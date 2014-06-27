class AddWeinTable < ActiveRecord::Migration
  def change
    create_table :weine do |t|
      t.string :name
      t.integer :amount

      t.timestamps
    end
  end
end
