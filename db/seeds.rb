1.times do
 @user = User.create(username: Faker::Name.name, password: 12345)
 @post = Post.create(post_title: Faker::Book.title, post_text: Faker::Company.catch_phrase, post_link: Faker::Internet.url)
 # @comment = Comment.create(comment_text: Faker::Hacker.say_something_smart)
 
 @user.posts << @post
 # @post.comments << @comment

end


