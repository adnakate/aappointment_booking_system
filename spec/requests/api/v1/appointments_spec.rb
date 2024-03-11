require 'rails_helper'

RSpec.describe "Api::V1::Appointments", type: :request do
  describe 'successfully creates an appointment' do
    subject(:perform) do
      time_zone = FactoryBot.create(:time_zone)
      coach = FactoryBot.create(:coach, time_zone: time_zone)
      time_slot = FactoryBot.create(:time_slot, coach: coach)
      post '/api/v1/appointments', params: {
        time_slot_id: time_slot.id,
        first_name: 'Abhijit',
        last_name: 'Nakate',
        email: 'abhijit@gmail.com'
      }
    end
    include_examples 'creates a new object', Appointment
    include_examples 'creates a new object', Guest
  end

  describe 'should return different errors' do
    it "should return first_name should be present " do
      time_zone = FactoryBot.create(:time_zone)
      coach = FactoryBot.create(:coach, time_zone: time_zone)
      time_slot = FactoryBot.create(:time_slot, coach: coach)
      post '/api/v1/appointments', params: {
        time_slot_id: time_slot.id,
        last_name: 'Nakate',
        email: 'abhijit@gmail.com'
      }
      expect(response).to have_http_status :unprocessable_entity
    end

    it "should return last_name should be present " do
      time_zone = FactoryBot.create(:time_zone)
      coach = FactoryBot.create(:coach, time_zone: time_zone)
      time_slot = FactoryBot.create(:time_slot, coach: coach)
      post '/api/v1/appointments', params: {
        time_slot_id: time_slot.id,
        first_name: 'Abhijit',
        email: 'abhijit@gmail.com'
      }
      expect(response).to have_http_status :unprocessable_entity
    end

    it "should return email should be present " do
      time_zone = FactoryBot.create(:time_zone)
      coach = FactoryBot.create(:coach, time_zone: time_zone)
      time_slot = FactoryBot.create(:time_slot, coach: coach)
      post '/api/v1/appointments', params: {
        time_slot_id: time_slot.id,
        first_name: 'Abhijit',
        last_name: 'Nakate',
      }
      expect(response).to have_http_status :unprocessable_entity
    end

    it "should return time_slot_id should be present " do
      time_zone = FactoryBot.create(:time_zone)
      coach = FactoryBot.create(:coach, time_zone: time_zone)
      time_slot = FactoryBot.create(:time_slot, coach: coach)
      post '/api/v1/appointments', params: {
        first_name: 'Abhijit',
        last_name: 'Nakate',
        email: 'abhijit@gmail.com'
      }
      expect(response).to have_http_status :unprocessable_entity
    end
  end
end
