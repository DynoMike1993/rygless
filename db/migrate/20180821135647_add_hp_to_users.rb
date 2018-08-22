class AddHpToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :hp, :integer, default: 10
  end
end
