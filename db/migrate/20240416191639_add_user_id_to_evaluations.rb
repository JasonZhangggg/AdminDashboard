class AddUserIdToEvaluations < ActiveRecord::Migration[7.1]
  def change
    add_column :evaluations, :user_id, :integer
  end
end
