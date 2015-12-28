class AddSlugAndSeoPost < ActiveRecord::Migration[5.0]
  def change
    add_column :posts, :slug, :string, nil: false

    create_table :seo_datas do |t|
      t.string :seo_description, nil: false
      t.string :seo_title, nil: false
      t.string :seo_image, nil: false
      t.string :seo_tags
      t.integer :post_id
      t.timestamps
    end
    add_index :seo_datas, :post_id
  end
end
