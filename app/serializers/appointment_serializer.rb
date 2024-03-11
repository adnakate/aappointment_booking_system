class AppointmentSerializer < ActiveModel::Serializer
  attributes :id, :coach_id, :coach_name, :guest_id, :guest_name, :time_slot

  def coach_name
    self.object.coach.name
  end

  def guest_name
    self.object.guest.first_name + ' ' + self.object.guest.last_name
  end

  def time_slot
    self.object.time_slot.start_time + '-' + self.object.time_slot.end_time
  end
end