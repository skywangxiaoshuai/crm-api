class Store < ApplicationRecord
  paginates_per 15  # 分页时每页显示15条数据
  default_scope {order(created_at: :desc)}  #默认按照创建时间从大大小排序

  belongs_to :enterprise, foreign_key: :enterprise_id
  belongs_to :block
  has_many :pictures, as: :imageable, dependent: :destroy
  has_many :cooperations
  has_many :services, through: :cooperations
  has_many :trades, dependent: :destroy

  validates :category, presence: true
  validates :district, presence: true
  validates :code, presence: true, uniqueness: true

  scope :store_district, -> (*params) {
    params_hash = params.to_h.deep_symbolize_keys
    district_level, district_id = params_hash[:level], params_hash[:id]
    if district_level.present? && district_id.present?
      where("district->'#{district_level}'->>'id' = ?", district_id)
    end
  }

  scope :store_category, -> (*params) {
    params_hash = params.to_h.deep_symbolize_keys
    category_level, category_id = params_hash[:level], params_hash[:id]
    if category_level.present? && category_id.present?
      where("category->'#{category_level}'->>'id' = ?", category_id)
    end
  }

  class << self
    # ransack scope
    def ransackable_scopes(auth_obj = nil)
      %i(store_district store_category)
    end
  end

end
