class PostsController < ApplicationController
  before_action :set_post, only: [ :show, :edit, :update, :destroy]

  def index
    @posts = Post.order(created_at: :desc)
  end

  def new
    @post = Post.new # フォーム用の空のインスタンスを生成する。
  end

  def create
    @post = Post.new(post_params) # ストロングパラメータを引数に
    @post.save # saveをしてデータベースに保存する。
    redirect_to @post, notice: '投稿を保存しました'
  end

  def show  
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    if @post.update(post_params)
      redirect_to @post, notice: "投稿を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @post.destroy
    redirect_to posts_path, notice: "投稿を削除しました。"
  end

  private

  def post_params # ストロングパラメータを定義する
    params.require(:post).permit(:caption)
  end

  def set_post
    @post = Post.find(params[:id])
  end
end
