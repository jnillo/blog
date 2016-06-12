class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :subject, nil: false
      t.text :content, nil: false
      t.string :email, nil: false
      t.string :phone

      t.timestamps
    end
    add_index :contacts, :email
  end
end
