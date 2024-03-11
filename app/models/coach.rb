class Coach < ApplicationRecord
  belongs_to :time_zone
  has_many :weekly_schedules
  has_many :appointments
  has_many :time_slots

  validates_presence_of :name, :email,
                        message: Proc.new { |record, data| "You must provide #{data[:attribute]}" }
  validates_uniqueness_of :email, message: INVALID_EMAIL
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, message: INVALID_EMAIL

  paginates_per 10

  def self.create_weekly_time_slots
    time_slots = []
    Coach.includes(:weekly_schedules).find_each do |coach|
      coach.weekly_schedules.each do |schedule|
        start_time = schedule.available_at.to_time
        end_time = schedule.available_until.to_time
        current_time = start_time
        while current_time < end_time
          time_slots << coach.time_slot_object(schedule, current_time)
          current_time += 30.minutes
        end
      end
    end
    TimeSlot.import time_slots
  end

  def time_slot_object(schedule, current_time)
    TimeSlot.new(coach_id: id, date: calculate_date(schedule.day_of_week),
                 start_time: current_time.strftime("%H:%M"),
                 end_time: (current_time + 30.minutes).strftime("%H:%M"))
  end

  private

  def calculate_date(day_of_week)
    today = Date.today
    case day_of_week
    when 'monday'
      today + 1.days
    when 'tuesday'
      today + 2.days
    when 'wednesday'
      today + 3.days
    when 'thursday'
      today + 4.days
    when 'friday'
      today + 5.days
    when 'saturday'
      today + 6.days
    when 'sunday'
      today + 7.days
    end
  end
end
