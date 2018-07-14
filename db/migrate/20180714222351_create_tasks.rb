class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.belongs_to :user
      t.belongs_to :workspace
      t.timestamps null: false
    end
  end
end
