# Homepage (Root path)

enable :sessions

helpers do

  def login_user
    User.find { |user| user[:id] == session[:user_id]}
  end

  def score_sum votes
    votes.inject(0) do |sum, vote|
      sum+=vote.score
    end
  end

  def voted? user, music
    a = music.votes.inject([]) do |a, vote|
      a << vote[:user_id]
    end
    a.include?(user.id)
  end

end



get '/' do
  erb :index
end

get '/musics' do
  @musics = Music.all
  erb :"musics/index"
end

get '/musics/new' do
  erb :"musics/new"
end

post '/musics' do
  user = User.find{ |user| user[:username] == login_user[:username]}
  @musics = Music.new(
    title: params[:title],
    author: params[:author],
    url: params[:url],
    added_by: user[:username]
  )
  if @musics.save
    redirect '/musics'
  else
    erb :"musics/new"
  end
end

get '/musics/login' do
  erb :"musics/login"
end

post '/musics/logins' do
  users = User.find{ |user| user[:username] == params[:username]}
  if users[:password] == params[:password]
    session[:user_id] = users[:id]
    redirect '/musics'
  else
    erb :"/musics/logins"
  end
end

get '/musics/logouts' do
  session.clear
  redirect '/musics'
end

delete '/musics/delete/:id' do
  m = Music.find {|music| music.id.to_s == params[:id]}
  m.destroy
  redirect '/musics'
end

put '/musics/upvote/:id' do
  m = Music.find {|music| music.id.to_s == params[:id]}
  if voted?(login_user, m) == false
    vote = Vote.create(
      voter: login_user.username,
      score: params[:score].to_i,
      user_id: login_user.id,
      music_id: params[:id]
  )
  end
  redirect '/musics' 
end

