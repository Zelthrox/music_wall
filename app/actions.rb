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
  @musics = Music.new(
    title: params[:title],
    author: params[:author],
    url: params[:url]
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

post '/logins' do
  users = User.find{ |user| user[:username] == params[:username]}
  if users[:password] == params[:password]
    session[:user_id] = users[:id]
    redirect '/musics'
  else
    erb :"/musics/logins"
  end
end
