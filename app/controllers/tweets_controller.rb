class TweetsController < ApplicationController
    def index
        @tweets = Tweet.all
        
    end
    
    def new 
        @tweet = Tweet.new
    end
    
    def create
        @tweet = Tweet.new(message: params[:tweet][:message], tdate: Time.current)
        if @tweet.save
            flash[:notice] = 'ツイートしました'
            redirect_to '/'
        else
            render new_tweets_path
        end
    end
    
    def destroy
        tweet = Tweet.find(params[:id])
        tweet.destroy
        redirect_to root_path
    end
    
    def edit
        @tweet = Tweet.find(params[:id])
    end
    
    def update
        @tweet = Tweet.find(params[:id])
        message = params[:tweet][:message]
        @tweet.update(message: message)
        redirect_to root_path
    end
    
    def show 
        @tweet = Tweet.find(params[:id])
    end
end
