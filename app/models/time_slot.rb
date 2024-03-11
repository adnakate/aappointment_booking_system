class TimeSlot < ApplicationRecord
  belongs_to :coach
  has_one :appointment

  validates_presence_of :date, :start_time, :end_time,
                        message: Proc.new { |record, data| "You must provide #{data[:attribute]}" }
  paginates_per 10
end
