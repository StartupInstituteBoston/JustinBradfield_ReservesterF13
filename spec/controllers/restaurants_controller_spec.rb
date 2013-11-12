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
            post :create, restaurant: restaurant.attributes
            #this only works because nothing well be in the database
            #before the post statement
            expect(Restaurant.first).to eq restaurant
        end
        Restaurant.delete_all
        it 'should redirect to restaurant path' do
            post :create, restaurant: restaurant.attributes
            expect(response).should redirect_to restaurant
        end
    end
    describe " Get #edit" do
        Restaurant.delete_all
        let(:restaurant) {FactoryGirl.create(:restaurant)}
        it " should set instance variable equal to restaurant" do
            get :edit, restaurant: restaurant.id
            expect(assigns(:restaurant)).to eq restaurant
        end
    end
    # describe "delete" do 
    #     let(:restaurant) {FactoryGirl.create(:restaurant)}
    #     it 'should delete the given restaurant' do
    #         delete :destory
    #     end
    # end
end
