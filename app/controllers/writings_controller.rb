class WritingsController < ApplicationController
  before_action :set_writing, only: [:show]
  
  def show
    @writing = Writing.find(params[:id])
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
