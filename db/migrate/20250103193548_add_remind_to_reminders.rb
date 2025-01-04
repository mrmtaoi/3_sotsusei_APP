class AddRemindToReminders < ActiveRecord::Migration[7.0]
  def change
    add_column :reminders, :remind, :string
  end
end
