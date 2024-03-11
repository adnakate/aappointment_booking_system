class Api::V1::AppointmentsController < ApplicationController
  before_action :validate_create_params, only: [:create]

  def create
    guest = Guest.create_or_fetch_guest(params)
    appointment = create_appointment_object(guest)
    if appointment.save
      render json: { appointment: ActiveModelSerializers::SerializableResource.new(appointment) }, status: :created
    else
      render json: { errors: appointment.errors }, status: :unprocessable_entity
    end
  end

  private

  #validations are added at model level too but some validations are necessary to be added here.
  def validate_create_params
    return render json: { errors: 'Enter first name' }, status: :unprocessable_entity if !params[:first_name].present?
    return render json: { errors: 'Enter last name' }, status: :unprocessable_entity if !params[:last_name].present?
    return render json: { errors: 'Enter email' }, status: :unprocessable_entity if !params[:email].present?
    return render json: { errors: 'Time slot id' }, status: :unprocessable_entity if !params[:time_slot_id].present?
    appointment = Appointment.where(time_slot_id: params[:time_slot_id]).last
    render json: { errors: 'Already booked by someone' }, status: :unprocessable_entity if appointment.present?
  end

  def create_appointment_object(guest)
    Appointment.new(time_slot_id: params[:time_slot_id],
                    guest_id: guest.id,
                    coach_id: get_coach_id)
  end

  def get_coach_id
    TimeSlot.find(params[:time_slot_id]).coach_id
  end
end
