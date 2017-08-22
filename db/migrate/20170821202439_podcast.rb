class Podcast < ActiveRecord::Migration[5.0]
  def change
    create_table :podcasts do |t|
      t.string :title, nil: false
      t.text :description, nil: false
      t.string :file, nil: false
      t.text :external_links

      t.references :post

      t.timestamps
    end

    add_column :posts, :podcast_id, :integer
  end
end
