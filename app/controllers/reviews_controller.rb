class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end


  def new
    # @review = current_user.reviews.build(usertype: current_user.usertype)
    # @review = current_user.reviews.build()

      @review = current_user.reviews.build()
      @transaction_id = Transaction.find_by(user_id: current_user.id).id


    # @review = Review.find_by(user_id: current_user.id)
    # @transaction_id = Transaction.find_by(user_id: current_user.id).id
    # p '*' * 100
    # p 'review'
    # @caregiver = Caregiver.find_by(user_id: params[:fammember_id])
  end


  def edit
  end

  def create
    @review = current_user.reviews.build(review_params)
    @review['transaction_id'] = Transaction.find_by(user_id: current_user.id).id
    # p '*' * 50
    # p review_params
    # p @review
    # p '*' * 50

    if @review.save
      flash[:success] = "Review created!"
      if current_user.usertype == 'Caregiver'
        redirect_to caregiver_path(current_user.id) and return
      elsif current_user.usertype == 'Fammember'
        redirect_to fammember_path(current_user.id) and return
      end
      # redirect_to :back, notice: "Your profile has been sucessfully created"
      # format.html { redirect_to @review, notice: 'Review was successfully created.' }
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
