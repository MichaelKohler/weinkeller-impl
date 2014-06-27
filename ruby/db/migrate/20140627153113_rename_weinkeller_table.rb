class RenameWeinkellerTable < ActiveRecord::Migration
  def self.up
    rename_table :weinkellers, :wine_cellars
  end

  def self.down
    rename_table :wine_cellars, :weinkellers
  end
end
