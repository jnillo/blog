class CreateResources < ActiveRecord::Migration[5.0]
  def change
    create_table :resources do |t|
    	t.string :title, nil: false
    	t.text :description, nil: false
      t.string :link, nil: false
      t.string :image
      t.integer :downloads
      t.timestamps
    end
  end
end
