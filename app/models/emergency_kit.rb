class EmergencyKit < ApplicationRecord
  belongs_to :user
  belongs_to :owner, class_name: 'EmergencyKitsOwner'
  has_many :kit_items
  has_one :reminder, dependent: :destroy
  accepts_nested_attributes_for :reminder

  # 定期的にリマインダーを送信
  def self.send_reminders
    # 定期的なリマインダーを送る
    where("updated_at <= ?", Time.current - Reminder.pluck(:interval_months).first.months).find_each do |kit|
      UserMailer.reminder_email(kit.user).deliver_later
    end
  end
end