class TweetsController < ApplicationController
  before_action :set_tweet, only:[:show, :edit, :update, :destroy,]
  before_action :login_check, only:[:new, :edit, :show, :index]

  def index
    @tweets = Tweet.all
  end

  def new
    if params[:back]
      @tweet = Tweet.new(tweet_params)
    else
      @tweet = Tweet.new
    end
  end


  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user_id = current_user.id
    if @tweet.save
      redirect_to tweets_path, notice: "つぶやきを作成しました！"
    else
      render 'new'
    end
  end

  def home
    @tweet = Tweet.order(:content)
    @tweet = Tweet.limit(10).order(:content)
  end

  def show
    @favorite = current_user.favorites
    @favorite = @favorite.where(user_id: current_user.id)
  end

  def edit
  end

  def update
    if @tweet.update(tweet_params)
      redirect_to tweets_path, notice: "つぶやきを編集しました！"
    else
      render 'edit'
    end
  end

  def destroy
    @tweet.destroy
    redirect_to tweets_path, notice:"つぶやきを削除しました！"
  end

  def confirm
    @tweet = Tweet.new(tweet_params)
    render :new if @tweet.invalid?
  end


  private
  def tweet_params
    params.require(:tweet).permit(:user_id, :content)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def login_check
    unless logged_in?
      flash[:notice] = "権限がありません"
      redirect_to new_session_path
    end
  end

  def session_user
    session.session_id
  end
end
