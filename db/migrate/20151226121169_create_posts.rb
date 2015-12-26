class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.text :title, nil: false
      t.text :resume, nil: false
      t.text :content, nil: false
      t.string :author, nil: false
      t.date :published, nil: false
      t.string :uri, nil: false
      t.string :external_link

      t.references :category

      t.timestamps
    end

    add_index :posts, :category_id

  end
end
