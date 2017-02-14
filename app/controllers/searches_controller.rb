class SearchesController < ApplicationController
  def new
    @search = Search.new
    @specialty = Caregiver.uniq.pluck(:specialties)
    @genders = Caregiver.uniq.pluck(:gender)
    @lang = Caregiver.uniq.pluck(:languages)
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
  end

  private
  def search_params
    params.require(:search).permit(:name, :languages, :specialties, :yearsofexperience, :gender)
  end
end
