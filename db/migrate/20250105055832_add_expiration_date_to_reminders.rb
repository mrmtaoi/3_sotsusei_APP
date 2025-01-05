class AddExpirationDateToReminders < ActiveRecord::Migration[7.0]
  def change
    add_column :reminders, :expiration_date, :date
  end
end
