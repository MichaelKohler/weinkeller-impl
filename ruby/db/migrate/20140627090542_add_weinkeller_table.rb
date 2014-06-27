class AddWeinkellerTable < ActiveRecord::Migration
  def change
    create_table :weinkeller do |t|
      t.string :name

      t.timestamps
    end
  end
end
