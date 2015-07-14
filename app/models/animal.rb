class Animal < ActiveRecord::Base
	validates :name, :species, presence: true
	belongs_to :zoo
end
