class CoachSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :time_zone

  def time_zone
    self.object.time_zone.name
  end
end