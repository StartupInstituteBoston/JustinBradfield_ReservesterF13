class RestaurantsController < ApplicationController

#     passes the index page all of the restaurants in
#     alphebetical order

    def index
        @restaurants = Restaurant.order(:name)    
    end

    # Crud funtions to creat show update destroy etc
    # These methods will not all send html back
    
# These methods need to be made far more secure

    #sets instance variable and responds with
    # a form to create the new restaurant
    def new
         @restaurant=Restaurant.new()
    end

    # saves the restraunt created earlier after
	# giving it attributes from the post
    def create
        @restaurant= Restaurant.new restaurant_params
        if @restaurant.save
        	redirect_to @restaurant
        else
        	
            redirect_to :back , notice: "Your restaurant failed to be created"
   		end
    end


	# Show should link to the view for that restaurant
    def show
    	@restaurant=Restaurant.find params[:id]
    end


    # sets the instance variable restaurant 
    # and returns the edit form
    def edit
    	@restaurant=Restaurant.find params[:id]
    end
    #updates the targeted restaurant then redirects
    # to that restaurants page
    def update
        @restaurant=Restaurant.find params[:id]
    	if @restaurant.update_attributes restaurant_params
    		redirect_to @restaurant
    	else
            redirect_to :back , notice: "Make sure you have entered valid information"
    	end
    end

   #destroys the object then redirects to home
    def destroy
    	if Restaurant.destroy params[:id]
    		redirect_to root_url , notice: "Restaurant deleted successfully"
    	#I can't think of how these will happen
        # or how to test them
        # else
     #        redirect_to :back , notice: "Could not delete at this moment"
   		end
    end 

	def restaurant_params
		params.require(:restaurant).permit(:id,:name,:description,:street,:city,:state,:zip,:phone)
	end
end
