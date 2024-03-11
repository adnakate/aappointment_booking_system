# README

If you want to run it on local follow the steps below
- take clone from github
- Install rails 6
- Install ruby 2.7.2
- Do bundle install inside the folder
- Change database credentials in database.yml accordingly
- Run rake db:create
- Run rake db:migrate
- Run rake db:seed (to import csv)
- Run the job CreateWeeklyTimeSlotsJob manually for initial testing. (It is automated to run on every Sunday at 1 am)


Now you are ready to run the apis!


You can run the test cases with rspec command.


1. List Coaches - GET localhost:3000/api/v1/coaches

   Params - page



3. List Available Slots - GET localhost:3000/api/v1/coaches/available_slots

   Params - coach_id, page



5. Book a Slot or appointment - POST localhost:3000/api/v1/appointments

    Params - first_name:Abhijit
             last_name:Nakate
             email:abhijit@gmail.com
             time_slot_id:402




Technical details covered - 
- Basic rails associations
- All model level validations with custom messages
- Email regex validations with custom messages
- Controller level custom validations
- Serializers
- Pagination
- Added indexes wherever required
- Rspec
- Shared examples with rspec
- Efficient APIs
