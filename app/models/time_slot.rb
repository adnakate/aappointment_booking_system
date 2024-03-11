class TimeSlot < ApplicationRecord
  belongs_to :coach
  has_one :appointment

  validates_presence_of :day_of_week, :start_time, :end_time,
                        message: Proc.new { |record, data| "You must provide #{data[:attribute]}" }
end
