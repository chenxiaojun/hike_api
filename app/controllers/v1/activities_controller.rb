module V1
  class ActivitiesController < ApplicationController
    include UserAuthorize
    before_action :login_required, only: [:create, :image]

    def index
      departure_city = params[:departure_city].presence
      @activities = Activity.user_visible.page(params[:page]).per(params[:page_size])
                            .yield_self { |it| departure_city ? it.where(departure_city: departure_city) : it  }
    end

    def create
      check_params
      @activity = Activity.create(user_params.merge(user: @current_user))
    end

    def image
      @image = ActivityImage.new(image: params[:image])
      if @image.image.blank? || @image.image.path.blank? || @image.image_integrity_error.present?
        raise_error 'file_format_error'
      end
      raise_error 'file_upload_error' unless @image.save
    end

    private

    def user_params
      params.permit(:cover_link,
                    :name,
                    :begin_time,
                    :end_time,
                    :departure_city,
                    :destination_province,
                    :destination,
                    :start_date,
                    :end_date,
                    :charge_type)
    end

    def check_params
      required_params = %w[cover_link name begin_time end_time departure_city destination_province destination start_date end_date charge_type]
      required_params.each { |r| requires! r.to_sym }
      optional! :charge_type, values: %w[free]
    end
  end
end
