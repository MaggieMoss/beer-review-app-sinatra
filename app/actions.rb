helpers do
  def logged_in?
    if session[:user_id]
      true
    else
      false
    end
  end

  def current_user
    User.find(session[:user_id])
  end
end

before '/beers' do
  if !logged_in?
    redirect '/index'
  end
end

get '/beers' do
  @beers = Beer.all
  erb :index
end

get '/beers/new' do
  @beer = Beer.new
  erb :'beer/new'
end

get '/beers/:id' do
  beer_id = params[:id]
  @beer = Beer.find(beer_id)
  erb :'beer/show'
end


get '/beers/:id/edit' do
  beer_id = params[:id]
  @beer = Beer.find(beer_id)
  erb :'beer/edit'
end

# update a beer
post '/beers/:id' do
  beer_id = params[:id]

  country = params[:country]
  name = params[:name]

  @beer = Beer.find(beer_id)
  @beer.name = name
  @beer.country = country
  @beer.save
  erb :'beer/show'
end

post '/beers' do
  country = params[:country]
  name = params[:name]
  @beer = Beer.new
  @beer.country = country
  @beer.name = name
  if @beer.save
    erb :'/beer/show'
  else
    erb :'/beer/new'
  end
end

get '/login' do

  erb :'/user/login'
end

post '/login' do
  email = params[:email]
  password = params[:password]
  user = User.find_by(email: email)
  if password == user.password
    session[:user_id] = user.id
    redirect '/beers'
  else
    redirect '/login'
  end
end

get '/logout' do
  session.clear
end











