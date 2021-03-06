class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_action :ensure_that_logged_in, only: [:new, :create, :edit, :update]
  before_action :ensure_that_admin

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def tag_specific
    @tag = tag_params[:tag]
    @posts = Post.where(:id => PostTag.where("tag = ?", @tag).select("post_id"))
    render 'index'
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @post_comment = PostComment.new
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Artikkeli lisätty' }
        format.json { render :show, status: :created, location: @post }
      else
        @alert = @post.errors
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to posts_path, notice: 'Artikkelin muokkaus onnistui' }
        format.json { render :show, status: :ok, location: @post }
      else
        @alert = @post.errors
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Artikkeli poistettu' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :text)
    end

    def tag_params
      params.permit(:tag)
    end

    def ensure_that_logged_in
      if !current_user
        return false
      return true
    end
  end
end
