class SearchesController < ApplicationController

  def new
    @search = Search.new
    @genders = Caregiver.uniq.pluck(:gender)
    @specialty = Specialty.uniq.pluck(:ability)
    @lang = Language.uniq.pluck(:sglang)
  end

  def create
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
    puts @search
  end

  private
  def search_params
    params.require(:search).permit(:name, :sglang, :specialties, :yearsofexperience, :gender)
  end
end
