class Zoo < ActiveRecord::Base
	validates :name, :location, :year_open, presence: true
	has_many :animals, dependent: :destroy 
end
