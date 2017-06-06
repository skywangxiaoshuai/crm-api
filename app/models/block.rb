class Block < ApplicationRecord
  paginates_per 15 # 分页时每页显示15条数据

  default_scope { order(created_at: :desc) }

  # before_destroy :validate_stores_present?

  # belongs_to :user
  has_many :stores, dependent: :restrict_with_error

  validates :name, presence: true, uniqueness: true
  validates :code, presence: true, uniqueness: true


  scope :block_district, -> (*params) {
    params_hash = params.to_h.deep_symbolize_keys
    level, id = params_hash[:level], params_hash[:id]
    if level.present? && id.present?
      where("district->'#{level}'->>'id' = ?", id)
    end
  }

  class << self
    # ransack scope
    def ransackable_scopes(auth_obj = nil)
      # binding.pry
      %i(block_district)
    end
  end

  private

    def validate_stores_present?
      errors.add(:base, "该商圈下有商铺数据，请把商铺数据转移到其他商圈")
    end
end
