class Admin::ContactsController < ApplicationController

  def index
    @contacts = Contact.all.order(updated_at: :desc)
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    #@contact.user = current_user
    respond_to do |format|
      if @contact.save
        format.html { redirect_to admin_contacts_path, notice: '新增文章成功' }
        format.json { render :show, status: :created, location: @contact }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to admin_contacts_url
  end
end
