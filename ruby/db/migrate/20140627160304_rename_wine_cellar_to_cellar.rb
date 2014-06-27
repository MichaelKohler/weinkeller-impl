class RenameWineCellarToCellar < ActiveRecord::Migration
  def self.up
    rename_table :wine_cellars, :cellars
  end

  def self.down
    rename_table :cellars, :wine_cellars
  end
end
