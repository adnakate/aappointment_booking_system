class TimeSlotSerializer < ActiveModel::Serializer
  attributes :id, :date, :start_time, :end_time, :day_of_week

  def day_of_week
    self.object.date.strftime("%A")
  end
end