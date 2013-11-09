class RestaurantsController < ApplicationController
/*
    passes the index page all of the restaurants in
    alphebetical order
*/
    def index
        @restaurants = Restaurant.order(:name)    
    end
/*
    Crud funtions to creat show update destroy etc
    These methods will not all send html back
    
    These methods need to be made far more secure
*/
    def create
        @restuarant=Restaurant.new()
        
    end


/*
    Show should link to the view for that restaurant
*/
    def show
        
    end
/*
    Tears down the form, and returns the success
    of the creation of a new restaurant
*/
    def new
         
    end

/*
     Sends JSON with a partial to edit
*/
    def edit
    end
/*
    tears down edit partial and responds with success
    of the update of the erstaurant
*/
    def update
    end
/*
    sends a JSON or java script responce verifying 
    the deletion of the Restaurant
*/
    def destroy
    end 

end
