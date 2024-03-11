class Guest < ApplicationRecord
  has_many :appointments

  validates_presence_of :first_name, :last_name, :email,
                        message: Proc.new { |record, data| "You must provide #{data[:attribute]}" }
  validates_uniqueness_of :email, message: INVALID_EMAIL
  validates_format_of :email, with: URI::MailTo::EMAIL_REGEXP, message: INVALID_EMAIL

  def self.create_or_fetch_guest(params)
    guest = Guest.where(email: params[:email]).last
    return guest if guest.present?
    guest = Guest.create!(first_name: params[:first_name],
                          last_name: params[:last_name],
                          email: params[:email])
    guest
  end
end
