require 'csv'

csv_text = File.read(Rails.root.join('db', 'coaches.csv'))
csv = CSV.parse(csv_text, headers: true)

puts '---System is importing csv for you. Please wait----'

csv.each do |row|
  coach_attributes = {
    name: row['Name'],
    time_zone: TimeZone.find_or_create_by(name: row['Timezone']),
    email: "#{row['Name'].split(' ').first.downcase}@gmail.com"
  }
  coach = Coach.find_or_create_by(coach_attributes)

  coach.weekly_schedules.create(
    day_of_week: WeeklySchedule.day_of_weeks[row['Day of Week'].downcase],
    available_at: row['Available at'].to_s,
    available_until: row['Available until'].to_s
  )
end