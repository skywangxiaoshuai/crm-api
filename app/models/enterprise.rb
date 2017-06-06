class Enterprise < ApplicationRecord
  default_scope { order(created_at: :desc) }

  has_many :stores, foreign_key: :enterprise_id
  has_many :pictures, as: :imageable, dependent: :destroy
  # validates :developer_id, presence: true
  # validates :operator_id, presence: true
  validates :code, presence: true, uniqueness: true
end
