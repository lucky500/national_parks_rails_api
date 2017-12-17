class Park < ApplicationRecord
  validates_presence_of :name
  validates_presence_of :address
  validates_presence_of :description

  scope :random, -> { order('RANDOM()').first }
  scope :by_name, -> (name) { where("name LIKE ?", "#{name}%")}
  scope :by_address, -> (address) { where("address LIKE ?", "#{address}%")}
end
