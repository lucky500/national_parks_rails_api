class Park < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :description
end
