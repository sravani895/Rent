class AddColumnForSpecials < ActiveRecord::Migration
  def change
  	add_column :specials, :price, :integer
  end
end
