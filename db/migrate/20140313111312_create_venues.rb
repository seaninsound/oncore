class CreateVenues < ActiveRecord::Migration
  def change
    create_table :venues do |t|

    	t.string :name
    	t.text :address
    	t.integer :capacity
    	t.integer :price_in_pence
    	t.boolean :is_available
    	t.float :latitude
    	t.float :longitude
    	t.integer :user_id
    	
      t.timestamps
    end
  end
end
