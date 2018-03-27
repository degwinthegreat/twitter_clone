class TweetMailer < ApplicationMailer
  default from: "from@example.com"

  def tweet_email(user, tweet)
    @content = tweet.content
    @user = user

    mail to: user.email, subject: "つぶやきました"
  end
end
