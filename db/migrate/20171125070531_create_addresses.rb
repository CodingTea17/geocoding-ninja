class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :property_id
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :job_name
      t.integer :user_id

      t.timestamps
    end
  end
end
