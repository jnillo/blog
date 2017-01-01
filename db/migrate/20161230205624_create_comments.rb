class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.string :user, nil: false
      t.text :content, nil: false
      t.integer :status, default: 0

      t.references :post

      t.timestamps
    end
    
    add_index :comments, :user
    add_index :comments, :status
    add_index :comments, [:post_id, :status]
  end
end
