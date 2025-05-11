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


  

 
end