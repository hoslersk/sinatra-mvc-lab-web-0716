require_relative 'config/environment'

class App < Sinatra::Base

  get '/' do
    erb :user_input
  end

  post '/piglatinize' do
    piggin = PigLatinizer.new
    @user_phrase = piggin.to_pig_latin(params[:user_phrase])
    erb :pig_latinized
  end

end
