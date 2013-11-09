require 'spec_helper'

describe RestaurantsController do
    describe "Get #show" do
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
            expect(Restaurant.first).to eq restaurant
        end
        Restaurant.delete_all
        it 'should should redirect to restaurant path' do
            post :create, restaurant: restaurant.attributes
            expect(response).should redirect_to restaurant
        end
    end
end
