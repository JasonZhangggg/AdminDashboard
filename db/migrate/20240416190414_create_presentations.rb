class CreatePresentations < ActiveRecord::Migration[7.1]
  def change
    create_table :presentations do |t|
      t.string :title
      t.text :description
      t.date :date

      t.timestamps
    end
  end
end
