class Service < ApplicationRecord
  has_many :cooperations#, dependent: :restrict_with_error
  has_many :stores, through: :cooperations
  # has_many :trades, dependent: :destroy
end
