class CollegesController < ApplicationController
layout 'admin'

before_action :logged_in_restriction ,:excpet=>[:login,:attempt_login,:logout]
 def index
  @colleges=College.ascending
  end


 def show
  @college=College.find(params[:id])
  end

 
  def new
    @college=College.new
  end

  def create
    @college=College.new(college_params)
    if @college.save
      flash[:notice]="college saved successfully!!!"
      redirect_to(colleges_path)
    else
      render('new')
  end
end

  def edit
      @college=College.find(params[:id])
  end

  def update
     @college=College.find(params[:id])
      if @college.update(college_params)
        flash[:notice]="college updates successfully!!!"
        redirect_to(college_path(@college))
      else
        render('edit')
      end
  end

  def delete
    @college=College.find(params[:id])
  end

  def destroy
    @college=College.find(params[:id])
    @college.destroy
    flash[:notice]="college '#{@college.college_name}' deleted successfully!!!"
    redirect_to(colleges_path)
  end
  private
  def college_params
    params.require(:college).permit(:college_code,:college_name,:college_address)
  end


end
