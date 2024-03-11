class Api::V1::CoachesController < ApplicationController
  before_action :validate_coach_id, only: [:available_slots]

  def index
    coaches = Coach.includes(:time_zone).order(:created_at).page params[:page]
    render json: { coaches: ActiveModel::Serializer::CollectionSerializer.new(coaches) }, status: :ok
  end

  def available_slots
    available_slots = @coach.time_slots
                            .left_outer_joins(:appointment)
                            .where(appointments: { id: nil })
                            .order(Arel.sql("CAST(start_time AS TIME)")).page params[:page]
    render json: { available_slots: ActiveModel::Serializer::CollectionSerializer.new(available_slots) }, status: :ok
  end

  private

  def validate_coach_id
    return render json: { errors: 'Enter coach id' }, status: :unprocessable_entity if !params[:coach_id].present?
    @coach = Coach.where(id: params[:coach_id]).last
    render json: { errors: 'Invalid coach id' }, status: :unprocessable_entity if !@coach.present?
  end
end
