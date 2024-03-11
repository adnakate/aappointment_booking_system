require 'rails_helper'

RSpec.describe Coach, type: :model do
  describe 'should create time slots for all coaches' do
    it "should create time slots successfully" do
      time_zone = FactoryBot.create(:time_zone)
      @coach_1 = FactoryBot.create(:coach, time_zone: time_zone)
      @coach_2 = FactoryBot.create(:coach, time_zone: time_zone)
      @coach_3 = FactoryBot.create(:coach, time_zone: time_zone)
      @coach_4 = FactoryBot.create(:coach, time_zone: time_zone)
      weekly_schedule_1 = FactoryBot.create(:weekly_schedule, coach: @coach_1)
      weekly_schedule_2 = FactoryBot.create(:weekly_schedule, coach: @coach_2)
      weekly_schedule_3 = FactoryBot.create(:weekly_schedule, coach: @coach_3)
      weekly_schedule_4 = FactoryBot.create(:weekly_schedule, coach: @coach_4)
      Coach.create_weekly_time_slots
      expect(Coach.count ).to eq(4)
      expect(TimeSlot.count ).to eq(16)
    end
  end
end
