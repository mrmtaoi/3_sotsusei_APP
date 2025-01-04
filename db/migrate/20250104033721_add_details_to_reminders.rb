class AddDetailsToReminders < ActiveRecord::Migration[7.0]
  def change
    add_column :reminders, :reminder, :string
    add_column :reminders, :interval_months, :integer
    add_reference :reminders, :emergency_kit, foreign_key: true
  end
end
