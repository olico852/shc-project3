class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end


  def new
    @review = current_user.reviews.build(usertype: current_user.usertype)

  end


  def edit
  end

  def create
    @review = current_user.reviews.build(review_params)

    if @review.save
      redirect_to reviews_path, notice: "Your profile has been sucessfully created"
      # format.html { redirect_to @review, notice: 'Review was successfully created.' }
    else
      redirect_to :back, notice: "Error..."

    end
  end



  def update
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to @review, notice: 'Review was successfully updated.' }

      else
        format.html { render :edit }

      end
    end
  end


  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }

    end
  end

  private

    def set_review
      @review = Review.find(params[:id])
    end


    def review_params
      params.require(:review).permit(:comment, :rating, :usertype, :user_id)
    end
end
