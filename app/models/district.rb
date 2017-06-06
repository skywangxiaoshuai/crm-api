class District < ApplicationRecord
  belongs_to :parent, class_name: "District", optional: true
  has_many :children, class_name: "District", foreign_key: "parent_id"
end
