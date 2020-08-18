class RemoveReferencesFromUsers < ActiveRecord::Migration[6.0]
  def change
    remove_reference(:users, :chef, foreign_key: true)
  end
end
