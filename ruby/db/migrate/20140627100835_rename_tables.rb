class RenameTables < ActiveRecord::Migration
  def self.up
    rename_table :weinkeller, :weinkellers
    rename_table :weine, :weins
  end

  def self.down
    rename_table :weinkellers, :weinkeller
    rename_table :weins, :weine
  end
end
