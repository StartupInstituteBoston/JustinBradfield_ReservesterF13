class Restaurant < ActiveRecord::Base
	validates_presence_of :name, :description
	validates_presence_of :street, :city ,:state,:zip
	validates_presence_of :phone
	validates :phone, length:{minimum: 9}
	before_save :get_address
	after_validation :gecoded_by get_address
	def get_address
        address=self.street + "," + self.city + ","
       	address+= self.state +","+self.zip
        return address
    end

end



