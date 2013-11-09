class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
        t.string :name
        t.text :description
        
        t.string :street
        t.string :city
        t.string :state
        t.string :zip

        t.string :phone
    end
  end
end
