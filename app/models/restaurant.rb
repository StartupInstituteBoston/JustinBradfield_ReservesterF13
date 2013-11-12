class Restaurant < ActiveRecord::Base
	validates_presence_of :name, :description
	validates_presence_of :street, :city ,:state,:zip
	validates_presence_of :phone
	validates :phone, length:{minimum: 9}

end
