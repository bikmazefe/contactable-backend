class CreateEventLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :event_logs do |t|
      t.string :action
      t.belongs_to :contact, null: false, foreign_key: true
      t.string :old_value
      t.string :new_value
      t.string :field

      t.timestamps
    end
  end
end
