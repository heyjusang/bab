class FixColumnName < ActiveRecord::Migration
  def up
    rename_column :menus, :like, :liking
    rename_column :menus, :dislike, :disliking
  end

  def down
  end
end
