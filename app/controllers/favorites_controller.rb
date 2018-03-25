class FavoritesController < ApplicationController
  def create
    @tweet_id = params[:tweet_id]
    @user_id = current_user.id
    favorite = Favorite.create(user_id: @user_id,tweet_id: @tweet_id)
    redirect_to tweets_url, notice: "#{favorite.tweet.user.name}さんのつぶやきをお気に入り登録しました"
  end

  def destroy
    favorite = current_user.favorites.find_by(tweet_id: params[:tweet_id]).destroy
    redirect_to tweets_url, notice: "#{favorite.tweet.user.name}さんのつぶやきをお気に入り解除しました"
  end

end
