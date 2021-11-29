class CommentsController < ApplicationController
  before_action :set_comment, only: %i[ show edit update destroy ]

  # GET /comments or /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1 or /comments/1.json
  def show
  end

  # GET /comments/new
  def new
    @comment = Comment.new
  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments or /comments.json
  def create
    @adv = Advertisement.find(params[:advertisement_id])
    @comment = @adv.comments.create(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to advertisement_path(@adv), notice: "Comment was successfully created." }
        format.json { redirect_to advertisement_path(@adv), status: :created, location: @comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /comments/1 or /comments/1.json
  def update
    @adv_id= @comment.advertisement_id
    @adv = Advertisement.find(@adv_id)
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @adv, notice: "Comment was successfully updated." }
        format.json { redirect_to @adv, status: :ok, location: @comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1 or /comments/1.json
  def destroy
    @adv_id= @comment.advertisement_id
    @adv = Advertisement.find(@adv_id)
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to @adv, notice: "Comment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def comment_params
      params.require(:comment).permit(:user_id, :advertisement_id, :message)
    end
end
