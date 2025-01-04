class AddDetailsToReminders < ActiveRecord::Migration[7.0]
  def change
    add_column :reminders, :reminder, :string
    add_column :reminders, :interval_months, :integer
    add_column :reminders, :emergency_kit_id, :integer
  end
end
