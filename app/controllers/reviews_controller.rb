class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show

  end


  def new
    if current_user.usertype == 'Caregiver'
    @caregiver_user_id = Caregiver.find_by(user_id: current_user.id).id
    @transaction_id = Transaction.find_by(caregiver_id: @caregiver_user_id).id
    p '8'*50
    p @transaction_id
    p '8'*50
    elsif current_user.usertype == 'Fammember'
    @transaction_id = Transaction.find_by(user_id: current_user.id).id
    end
    @review = current_user.reviews.build()
  end


  def edit
  end

  def create
    @review = current_user.reviews.build(review_params)
    if current_user.usertype == 'Caregiver'
    @caregiver_user_id = Caregiver.find_by(user_id: current_user.id).id
    @review['transaction_id'] = Transaction.find_by(caregiver_id: @caregiver_user_id).id
    elsif current_user.usertype == 'Fammember'
    @review['transaction_id'] = Transaction.find_by(user_id: current_user.id).id
    end
    if @review.save
      flash[:success] = "Review created!"
      if current_user.usertype == 'Caregiver'
        redirect_to caregiver_path(current_user.id) and return
      elsif current_user.usertype == 'Fammember'
        redirect_to fammember_path(current_user.id) and return
      end

    else
      redirect_to :back, notice: "Error..."

    end
  end

  def update

      if @review.update(review_params)
        flash[:success] = "Review updated!"
        if current_user.usertype == 'Caregiver'
          redirect_to caregiver_path(current_user.id) and return
        elsif current_user.usertype == 'Fammember'
          redirect_to fammember_path(current_user.id) and return
        end

      else
        redirect_to :back, notice: "Error..."

      end

  end

  def destroy
    @review.destroy
    flash[:success] = "Review destroy!"
    if current_user.usertype == 'Caregiver'
      redirect_to caregiver_path(current_user.id) and return
    elsif current_user.usertype == 'Fammember'
      redirect_to fammember_path(current_user.id) and return

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
