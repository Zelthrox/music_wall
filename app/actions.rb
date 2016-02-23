# Homepage (Root path)

enable :sessions

def login_user
  User.find { |user| user[:id] == session[:user_id]}
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

delete '/:id' do
  m = Music.find {|music| music.id.to_s == params[:id]}
  m.destroy
  redirect '/musics'
end


