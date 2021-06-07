class PostsController < ApplicationController

  before_action :authenticate_user
  before_action :ensure_correct_user, {only: [:edit, :update, :destroy]}
  
  def index
    @posts = Post.all.order(created_at: :desc)
    if params[:search] == nil
      @posts= Post.all
    elsif params[:search] == ''
      @posts= Post.all
    else
      @posts = Post.where("content LIKE ? ",'%' + params[:search] + '%')
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
    @likes_count = Like.where(post_id: @post.id).count
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(
      content: params[:content],
      attend: params[:attend],
      exam: params[:exam],
      homework: params[:homework],
      comment: params[:comment],
      user_id: @current_user.id
    )
    if @post.save
      flash[:notice] = "投稿を作成しました"
      redirect_to("/posts/index")
    else
      render("posts/new")
    end
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def update
    @post = Post.find_by(id: params[:id])

    @post.content = params[:content]
    @post.attend = params[:attend]
    @post.exam = params[:exam]
    @post.homework = params[:homework]
    @post.comment = params[:comment]

    if @post.save
      flash[:notice] = "投稿を編集しました"
      redirect_to("/posts/index")
    else
      render("posts/edit")
    end
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to("/posts/index")
    flash[:notice] = "投稿を削除しました"
  end

  def ensure_correct_user
    @post = Post.find_by(id: params[:id])
    if @post.user_id != @current_user.id
      flash[:notice] ="権限がありません"
      redirect_to("/posts/index")
    end
  end
  
  def search
  end
  
  def javascript
  end

  private
  def post_params
    params.require(:post).permit(:content)
  end

end
