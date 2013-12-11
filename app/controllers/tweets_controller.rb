class TweetsController < ApplicationController
	def show
		@tweet = Tweet.find(params[:id])
	end

	def create
		tweet = current_user.tweets.new(tweet_params)
		if tweet.save
			redirect_to dashboard_path
		else
			flash.alert = 'Tweet cannot be empty'
			redirect_to dashboard_path
		end
	end

	private
	def tweet_params
		params.require(:tweet).permit(:content)
	end
end