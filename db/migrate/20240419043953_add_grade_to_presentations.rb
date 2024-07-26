class AddGradeToPresentations < ActiveRecord::Migration[7.1]
  def change
    add_column :presentations, :grade, :string
  end
end
