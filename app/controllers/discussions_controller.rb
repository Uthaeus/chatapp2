class DiscussionsController < ApplicationController
  before_action :set_dis, only: [:show, :update, :edit, :destroy]

  def index
    @discussions = Discussion.all 
  end

  def new
    @discussion = Discussion.new
  end

  def create
    @discussion = Discussion.new(dis_params)

    respond_to do |format|
      if @discussion.save
        format.html { redirect_to @discussion, notice: 'Discussion created successfully.' }
        format.json { render :show, status: :created, location: @discussion }
      else
        format.html { render :new }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @discussion.update(dis_params)
        format.html { redirect_to @discussion, notice: 'Discussion updated successfully.' }
        format.json { render :show, status: :ok, location: @discussion }
      else
        format.html { render :edit }
        format.json { render json: @discussion.errors, status: :unprocessable_entity }
    end
  end

  def show
  end

  def edit
  end

  def destroy
    @discussion.destroy

    respond_to do |format|
      format.html { redirect_to root_path, notice: "Discussion successfully removed." }
      format.json { head :no_content }
    end
  end


  private

  def dis_params
    params.require(:discussion).permit(:title, :body, :user_id)
  end

  def set_dis
    @discussion = Discussion.find(params[:id])
  end
end