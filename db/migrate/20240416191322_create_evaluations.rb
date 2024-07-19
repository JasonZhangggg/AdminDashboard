class CreateEvaluations < ActiveRecord::Migration[7.1]
  def change
    create_table :evaluations do |t|
      t.integer :points
      t.text :feedback

      t.timestamps
    end
  end
end
