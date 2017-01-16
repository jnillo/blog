class CreateTerms < ActiveRecord::Migration[5.0]
  def change
    create_table :terms do |t|
      t.string :title, nil: false
      t.string :first_letter, nil: false
      t.text :description, nil: false
      t.integer :status, default: 0

      t.timestamps
    end

    add_index :terms, :first_letter
    add_index :terms, :status
  end
end
