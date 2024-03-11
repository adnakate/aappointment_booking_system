class TimeZone < ApplicationRecord
  has_many :coaches

  validates_presence_of :name,
                        message: Proc.new { |record, data| "You must provide #{data[:attribute]}" }
end
