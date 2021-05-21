class CreatePetitons < ActiveRecord::Migration[5.2]
  def change
    create_table :petitons do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :state
      t.integer :zipcode
      t.string :good_home
      t.timestamps
    end
  end
end