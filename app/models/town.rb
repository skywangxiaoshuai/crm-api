class Town < ApplicationRecord
  has_many :blocks, dependent: :restrict_with_error
end
