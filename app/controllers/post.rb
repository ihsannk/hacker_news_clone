get "/submit" do
  erb :submit
end

post "/submit" do
  @title = params[:post_title]
  @url = params[:post_link]
  @text = params[:post_text]
  @user_id = session[:id]

  @post = Post.create(post_title: @title, post_link: @url, post_text: @text, user_id: @user_id)
  redirect to "/"
end

get "/post/:id" do
  @post = Post.find(params[:id])
  erb :post
end

post "/post/:id" do
  @comment_text = params[:comment_text]
  @post_id = params[:id]
  @user_id = session[:id]

  @comment = Comment.create(comment_text: @comment_text, post_id: @post_id, user_id: @user_id )
  redirect to "/post/#{@post_id}"
end