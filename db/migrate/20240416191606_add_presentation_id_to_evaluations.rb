class AddPresentationIdToEvaluations < ActiveRecord::Migration[7.1]
  def change
    add_column :evaluations, :presentation_id, :integer
  end
end
