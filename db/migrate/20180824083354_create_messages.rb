class CreateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :messages do |t|
      t.string :sender
      t.string :phone_number
      t.string :content
      t.timestamp :created_at
    end
  end
end
