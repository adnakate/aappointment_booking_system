class CreateWeeklyTimeSlotsJob < ApplicationJob
  queue_as :default

  def perform
    puts "-----performing create weekly time slots job-----"
    Coach.create_weekly_time_slots
  end
end
