class Admin::PreferencesController < ApplicationController

  def index

  end

  def new
    @preference = Preference.new
  end

  def create
    params["preference"]["allow_create_artists"] = true if params["preference"]["allow_create_artists"] == "1"
    params["preference"]["allow_create_songs"] = true if params["preference"]["allow_create_songs"] == "1"
    @preference = Preference.new(preference_params)

    if @preference.save
      redirect_to artists_path
    else
      render :new
    end
  end

  private

  def preference_params
    params.require(:preference).permit(:allow_create_artists)
  end

end
