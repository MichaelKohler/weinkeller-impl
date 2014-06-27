class RenameWeinToWine < ActiveRecord::Migration
  def self.up
    rename_table :weins, :wines
  end

  def self.down
    rename_table :wines, :weins
  end
end
