module ApplicationHelper

	    def get_address restaurant
        	  address=restaurant.street + "," + restaurant.city + ","
       		  address+= restaurant.state +","+restaurant.zip
        return address
    end
end
