class HomeController < ApplicationController

  def index
    @writings = Writing.order(created_at: :desc).page(params[:page]).per(6)
  end

  def about
      
  end  

  def contact

  end

  def coming_soon
    
  end

end
