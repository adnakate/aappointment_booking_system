class Guest < ApplicationRecord
  has_many :appointments

  validates_presence_of :first_name, :last_name, :email,
                        message: Proc.new { |record, data| "You must provide #{data[:attribute]}" }
end
