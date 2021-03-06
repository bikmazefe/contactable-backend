class CreateContacts < ActiveRecord::Migration[6.1]
  def change
    create_table :contacts do |t|
      t.string :email
      t.string :phone
      t.string :first_name
      t.string :last_name
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
