class PostsController < ApplicationController

  def index
    @posts = Post.all
    # @posts = Post.create()
  end

  def show
    # byebug
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create 
    # byebug

    #new instance
    #save instance to db
    #p/R/G
    @post = Post.new(title: params[:post][:title], content: params[:post][:content])
    
    if @post.save
       #redirect to show page
      redirect_to @post , notice: "Post created successfully"
    else
      render :new ,status: :unprocessable_entity
    end
  end

  # def edit
  #   @post = Post.find(params[:id])
  #   if @post.update(title: params[:post][:title], content: params[:post][:content])
  #     redirect_to @post , notice: "Post updated successfully"
  #   else
  #     render :edit ,status: :unprocessable_entity
  #   end
  # end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    if @post.update(title: params[:post][:title], content: params[:post][:content])
      redirect_to @post , notice: "Post updated successfully"
    else
      render :edit ,status: :unprocessable_entity
    end
  end

  def destroy
    #fint post
    #delete
     @post = Post.find(params[:id])
     @post.destroy
     redirect_to posts_path , notice: "post deleted"
  end

end