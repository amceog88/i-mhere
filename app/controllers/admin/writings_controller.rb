class Admin::WritingsController < Admin::ApplicationController
  before_action :set_writing, only: [:show, :edit, :update, :destroy]

  def index
    @writings = Writing.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
    @writing = Writing.find(params[:id])
  end

  def new
    @writing = Writing.new
  end

  def create
    @writing = Writing.new(writing_params)
    #@writing.user = current_user
    respond_to do |format|
      if @writing.save
        format.html { redirect_to admin_writings_path, notice: '新增文章成功' }
        format.json { render :show, status: :created, location: @writing }
      else
        format.html { render :new }
        format.json { render json: @writing.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @writing = Writing.find(params[:id]) 
  end

  def update
    respond_to do |format|
      if @writing.update(writing_params)
        format.html { redirect_to admin_writings_path, notice: '更新文章成功' }
        format.json { render :show, status: :ok, location: @writing }
      else
        format.html { render :edit }
        format.json { render json: @writing.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @writing = Writing.find(params[:id])
    @writing.destroy
    
    respond_to do |format|
      format.html { redirect_to admin_writings_url }
      format.json { head :no_content }
    end
  end

private

  def set_writing
    @writing = Writing.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def writing_params
    params.require(:writing).permit(:title , :description ,:writer, :image)
  end
end
