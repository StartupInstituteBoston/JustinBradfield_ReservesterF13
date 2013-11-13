require 'spec_helper'
#test unit for the Restaurants controller
describe RestaurantsController do
    describe 'Get #index' do
        it 'should respond with index' do
             get :index    
             expect(response).to render_template("index")
        end
    end
    # using factory girl to generate a restaurant. 
    #factory can be found in spec/factory/restaurant.rb
    describe "Get #show" do
        #delete all clears test database. this shouldn't be necessary
        # but db cleaner didn't work properly
         Restaurant.delete_all
        let(:restaurant) {FactoryGirl.create(:restaurant)}
        it " should get the restaurant instance variable" do
          get :show,id:restaurant.id    
            expect(assigns(:restaurant)).to eq restaurant
        end 
        it " should display the show get the show template" do
            get :show,id:restaurant.id    
            expect(response).to render_template("show")
        end 
    end
    describe "Get #new" do
         Restaurant.delete_all
        it " should create a new restaurant variable" do
            get :new    
            expect(assigns(:restaurant)).to be_a_new(Restaurant)
        end 
          it " should display the show get the new template" do
            get :new    
            expect(response).to render_template("new")
        end 
    end

    describe "Put #create" do
        Restaurant.delete_all
        restaurant =FactoryGirl.create(:restaurant)
        it " should create a new restaurant" do
         Restaurant.delete_all
            post :create, restaurant: restaurant.attributes
            #this only works because nothing well be in the database
            #before the post statement
            expect(Restaurant.first).to eq restaurant
        end

        it " should not create a new restaurant" do
         Restaurant.delete_all
            request.env["HTTP_REFERER"] = "where_i_came_from"
            restaurant.phone='1234567'
            post :create, restaurant: restaurant.attributes
            expect(response).to redirect_to "where_i_came_from"
            expect(Restaurant.count).to eq 0
        end

         Restaurant.delete_all
        it 'should redirect to restaurant path' do
            post :create, restaurant: restaurant.attributes
            expect(response).to redirect_to restaurant
        end
         Restaurant.delete_all
    end


    describe " Get #edit" do
         Restaurant.delete_all
        let(:restaurant) {FactoryGirl.create(:restaurant)}
        it " should set instance variable equal to restaurant" do
            get :edit, id:restaurant.id
            expect(assigns(:restaurant)).to eq restaurant
        end
    end
    describe "put #update" do 
         Restaurant.delete_all
        let(:restaurant) {FactoryGirl.create(:restaurant)}
        it "should update the restaurant" do
            #if it works for name it should work for everything hopefully
            restaurant.name="test"
            post :update, id: restaurant.id,restaurant: restaurant.attributes
            expect(Restaurant.first.name).to eq restaurant.name
        end
        it "should fail to update the restaurant" do
            #this sets a referer so that the redirect_to :back will test
            request.env["HTTP_REFERER"] = "where_i_came_from"
            restaurant.phone="12345678"
            post :update, id: restaurant.id,restaurant: restaurant.attributes
            expect(response).to redirect_to "where_i_came_from"
        end
    end

    describe "delete#destroy" do
         Restaurant.delete_all
        let(:restaurant) {FactoryGirl.create(:restaurant)}
        it "should delete the restaurant" do
            delete :destroy, id:restaurant.id
            #this works agains because nothing else should be in the database
            expect(Restaurant.count).to eq 0

        end
    end
end
