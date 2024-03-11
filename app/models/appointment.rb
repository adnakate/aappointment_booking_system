class Appointment < ApplicationRecord
  belongs_to :coach
  belongs_to :guest
  belongs_to :time_slot
end
