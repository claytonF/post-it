class PostsController < ApplicationController
  before_action :find_post, only: [:show,:edit,:update,:destroy] 
  # could use except instead of only if there are fewer to exclude than include

  def index
  	# instance variable is available in other files - i.e the view
  	# without the @ it will be a local variable only available within this method
  	@posts = Post.all
  end
  
  def show
  	#@posts = Post
    # this is retrieving a single ActiveRecord object using the ID from the URL to 'find' the row - params['id'] returns a number
	
  end

  

  def new # this needs a view for typing data
    # the @post var represents a fresh, new, empty Post object
    @post = Post.new
  end

  def create # no view needed; for submitting new form data
    # need to save data to DB

    @post = Post.new(post_params)

    if @post.save
      flash[:success] = "Successfully created a post."
      redirect_to posts_path
    else
      flash[:error] = "Something went wrong, try again."
      render :new
    end

    #Post.create(post_params)
    # need to redirect to a different location
    #redirect_to posts_path
  end

  

  def edit # this needs a view for typing data

  end

  def update # no view needed; for submitting edit form data
    #save an instance of the relevant post from 'Post' to a local var 'post'
    #call '.update' on local var 'post' to update the contents of that row
    if @post.update(post_params)
      flash[:success] = "Successfully updated '#{@post.title}'."
      redirect_to post_path(@post)
    else
      # redirect takes you to a new actions/page
      # render looks for view file and renders it - but keeps the data intact - if redirect will lose the data
      flash[:error] = "Something went wrong. Try again"
      render :edit
    end

  end

  

  def destroy
    @post.destroy() #could also chain destroy to end of previous line
    flash[:success] = "'#{@post.title}' deleted."
    @post = nil #set the variable to nil just to make sure we flush the value of this

    redirect_to posts_path #could use root_path (use rake routes to see where to redirect to)
  end

  private #custom method to handle our post parameters security
  def post_params
    params.require(:post).permit(:title,:body)
  end

  def find_post #custom method for finding a post as this is called in multiple places
    @post = Post.find(params["id"])
  end

end