class AddReferenceToChefs < ActiveRecord::Migration[6.0]
  def change
    add_reference :chefs, :user, foreign_key: true
  end
end
