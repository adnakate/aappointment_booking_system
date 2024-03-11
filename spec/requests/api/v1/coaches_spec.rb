require 'rails_helper'

RSpec.describe "Api::V1::Coaches", type: :request do
  describe 'should list coaches' do
    before(:each) do 
      time_zone = FactoryBot.create(:time_zone)
      coach_1 = FactoryBot.create(:coach, time_zone: time_zone)
      coach_2 = FactoryBot.create(:coach, time_zone: time_zone)
      coach_3 = FactoryBot.create(:coach, time_zone: time_zone)
      coach_4 = FactoryBot.create(:coach, time_zone: time_zone)
    end

    it "should return list of coaches" do
      get '/api/v1/coaches'
      expect(response).to have_http_status :ok
    end
  end

  describe 'should list available slots for coaches' do
    before(:each) do 
      time_zone = FactoryBot.create(:time_zone)
      @coach_1 = FactoryBot.create(:coach, time_zone: time_zone)
      @coach_2 = FactoryBot.create(:coach, time_zone: time_zone)
      @coach_3 = FactoryBot.create(:coach, time_zone: time_zone)
      @coach_4 = FactoryBot.create(:coach, time_zone: time_zone)
      time_slot_1 = FactoryBot.create(:time_slot, coach: @coach_1)
      time_slot_2 = FactoryBot.create(:time_slot, coach: @coach_2)
      time_slot_3 = FactoryBot.create(:time_slot, coach: @coach_3)
      time_slot_4 = FactoryBot.create(:time_slot, coach: @coach_4)
    end

    it "should return list of coaches" do
      get '/api/v1/coaches/available_slots', params: { coach_id: @coach_1.id }
      expect(response).to have_http_status :ok
    end

    it "should return enter coach id error" do
      get '/api/v1/coaches/available_slots'
      expect(response).to have_http_status :unprocessable_entity
    end

    it "should return invalid coach id error" do
      get '/api/v1/coaches/available_slots', params: { coach_id: 10000 }
      expect(response).to have_http_status :unprocessable_entity
    end
  end
end
