class PostController < ApplicationController
  before_filter :authenticate_user!
  before_filter do
	flash[:error]="OLOLOLO!!!!yr8trwfgily"
  end;
  
  def index
	@posts=Post.all
  end

  def show
  end

  def new
	#@post=Post.new;
	@post=current_user.posts.build;
  end

  def create
	@post = current_user.posts.build(params.require(:post).permit(:post_header, :post_test, :post_tags))
	@post.save;
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
