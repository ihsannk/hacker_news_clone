get '/login' do
  erb :login
end

post '/login' do
  @username = params[:username]
  @password = params[:password]

  @user = User.find_by(username: @username)
    if @user && @user.password == @password
      path = "/"
    else
      path = "/login"
    end

  session[:user] = @username
  session[:id] = @user.id
  redirect to path
end

post '/signup' do
  @username = params[:username]
  @password = params[:password]

  @user = User.create(username: @username, password: @password)
  session[:user] = @username
  session[:id] = @user.id
  redirect to "/"
end

get '/logout' do
  session[:user] = nil
  redirect to "/"
  erb :index
end

get '/user/:id' do
  @user = User.find(params[:id])
  erb :user
end

get '/user/:id/submissions' do
  @post = Post.where(user_id: params[:id])
  erb :submissions
end

get '/user/:id/comments' do
  @comment = Comment.where(user_id: params[:id])
  erb :comments
end
