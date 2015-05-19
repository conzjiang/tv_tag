class CreateTaggings < ActiveRecord::Migration
  def change
    create_table :taggings do |t|
      t.integer :tag_id
      t.integer :tv_show_id
      t.timestamps
    end

    add_index :taggings, :tag_id
    add_index :taggings, :tv_show_id
    add_index :taggings, [:tag_id, :tv_show_id], unique: true
  end
end
