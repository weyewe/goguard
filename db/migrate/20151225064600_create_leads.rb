class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
    	t.string :name 
    	t.string :email
    	t.string :phone_number
    	t.integer :age 
    	t.text :address

      t.integer :selected_product 

      t.string :booking_date
      t.text :description

      

      t.timestamps null: false
    end
  end
end
