class Coach < ApplicationRecord
  belongs_to :time_zone
  has_many :weekly_schedules, dependent: :destroy
  has_many :appointments

  validates_presence_of :first_name, :last_name, :email,
                        message: Proc.new { |record, data| "You must provide #{data[:attribute]}" }
end
