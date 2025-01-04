class EmergencyKit < ApplicationRecord
  belongs_to :user
  belongs_to :owner, class_name: 'EmergencyKitsOwner'
  has_many :kit_items
  has_one :reminder, dependent: :destroy
  accepts_nested_attributes_for :reminder

  # 定期的にリマインダーを送信
  def self.send_reminders
    # interval_months分経過したリマインダーを送信
    Reminder.where('updated_at <= ?', Time.current - interval_months.months).find_each do |reminder|
      # 対応するユーザーにリマインダーメールを送信
      UserMailer.reminder_email(reminder.emergency_kit.user).deliver_later
    end
  end
end