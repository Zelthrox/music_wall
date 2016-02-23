# Homepage (Root path)
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
