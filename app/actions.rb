helpers do
  def logged_in?
    if session[:user_id]
      true
    else
      false
    end
  end

end


get '/' do
  "Hello, world"
end

post '/login' do
  email = params[:email]
  password = params[:password]
  @user = User.find_by({email: email})

  if @user.password == password
    session[:user_id] = @user.id
    "Logged in"
  else
    "Not logged in"
    # try again
  end
end

get '/login' do
  erb :'user/login'
end

get '/logout' do
  session.clear
end

get '/beers' do
  @beers = Beer.all.limit(10)
  erb :"beer/index"
end

get '/whiskeys' do
  "Whiskey Page"
end

before '/beers/:id' do
  redirect '/login' unless logged_in?
end

get '/beers/:id' do
  @beer = Beer.find(params[:id])
  erb :"beer/show"
end

get '/users/new' do
  erb :'user/signup'
end

post '/users' do
  @user = User.new
  @user.email = params[:email]
  @user.password = params[:password]
  @user.first_name = params[:first_name]
  @user.save
  redirect '/beers'
end

post '/comments' do
  # user_id -->
  user_id = session[:user_id]
  remarks = params[:remarks]
  beer_id = params[:beer_id]
  @comment = Comment.new
  @comment.user_id = user_id
  @comment.remarks = remarks
  @comment.beer_id = beer_id
  @comment.save
end


