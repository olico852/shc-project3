class SearchesController < ApplicationController
  before_action :is_authenticated, only: [:update, :delete, :edit ]

  def new
    @search = Search.new
    @genders = Caregiver.uniq.pluck(:gender)
    @specialty = Specialty.uniq.pluck(:ability)
    @lang = Language.uniq.pluck(:sglang)
  end

  def create
    p 'something ' * 20
    # p @search.inspect
    p search_params
    @search = Search.create(search_params)
    redirect_to @search
  end

  def show
    @search = Search.find(params[:id])
    puts '::::::::'*20
    puts @search.inspect
    
  end

  private
  def search_params
    params.require(:search).permit(:name, :yearsofexperience, :gender, :languages => [], :specialties => [])
  end

end
