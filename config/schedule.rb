set :environment, "development"

every 1.day do
  runner "EmergencyKit.send_reminders"
end
