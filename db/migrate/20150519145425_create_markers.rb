class CreateMarkers < ActiveRecord::Migration
  def change
    create_table :markers do |t|
      t.integer :page
      t.string :category
      t.timestamps
    end

    add_index :markers, :category
  end
end
