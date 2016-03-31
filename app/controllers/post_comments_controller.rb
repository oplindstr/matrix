class PostCommentsController < ApplicationController
  before_action :set_post_comment, only: [:show, :edit, :update, :destroy]

  # GET /post_comments
  # GET /post_comments.json
  def index
    @post_comments = PostComment.all
  end

  # GET /post_comments/1
  # GET /post_comments/1.json
  def show
  end

  # GET /post_comments/new
  def new
    @post_comment = PostComment.new
  end

  # GET /post_comments/1/edit
  def edit
  end

  # POST /post_comments
  # POST /post_comments.json
  def create
    @post_comment = PostComment.new(post_comment_params)
    @post = Post.find(@post_comment.post_id)

    respond_to do |format|
      if @post_comment.save
        format.html { redirect_to @post, notice: 'Post comment was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /post_comments/1
  # PATCH/PUT /post_comments/1.json
  def update
    respond_to do |format|
      if @post_comment.update(post_comment_params)
        format.html { redirect_to @post_comment, notice: 'Post comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @post_comment }
      else
        format.html { render :edit }
        format.json { render json: @post_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /post_comments/1
  # DELETE /post_comments/1.json
  def destroy
    @post_comment.destroy
    respond_to do |format|
      format.html { redirect_to post_comments_url, notice: 'Post comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post_comment
      @post_comment = PostComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_comment_params
      params.require(:post_comment).permit(:post_id, :user_id, :comment)
    end
end
