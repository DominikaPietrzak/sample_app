class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.belongs_to :user, index: true
      t.text :text

      t.timestamps
    end
  end
end
