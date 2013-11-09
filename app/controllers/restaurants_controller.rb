class RestaurantsController < ApplicationController

#     passes the index page all of the restaurants in
#     alphebetical order

    def index
        @restaurants = Restaurant.order(:name)    
    end

    # Crud funtions to creat show update destroy etc
    # These methods will not all send html back
    
# These methods need to be made far more secure

    # Tears down the form, and returns the success
    # of the creation of a new restaurant

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
        	flash[:notice]="there was an error creating your restaurant"
   		end
    end


	# Show should link to the view for that restaurant
    def show
    	@restaurant=Restaurant.find params[:id]
    end



     # Sends JSON with a partial to edit
    def edit
    	@restaurant=Restaurant.find restaurant_params[:id]

    end

    # tears down edit partial and responds with success
    # of the update of the erstaurant
    def update
    	if @restaurant.update_attributes post_params
    		redirect_to :back
    	else
    		flash[:notice]="there was an error updating";
    	end
    end

    # sends a JSON or java script responce verifying 
    # the deletion of the Restaurant
    def destroy
    	if Restaurant.destroy(restaurant_params[:id])
    		flash[:notice]="Restaurant deleted successfully"
    	else
    		flash[:notice]="Error deleting your restaurant"
   		end
    end 

	def restaurant_params
		params.require(:restaurant).permit(:id,:name,:description,:street,:city,:state,:zip,:phone)
	end
end
