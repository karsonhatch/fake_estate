class Home < ActiveRecord::Base
	belongs_to :seller
	has_one :address, dependent: :destroy
end
