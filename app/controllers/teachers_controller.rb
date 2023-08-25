class TeachersController < ApplicationController
  layout 'admin'

 before_action :logged_in_restriction ,:excpet=>[:login,:attempt_login,:logout]

 def index
  @teachers=Teacher.ascending
  end

def new
    @teacher=Teacher.new
  end

  def create
    @teacher=Teacher.new(teacher_params)
    if @teacher.save
      flash[:notice]="teacher saved successfully!!!"
      redirect_to(teachers_path)
    else
      render('new')
  end
end

  def edit
      @teacher=Teacher.find(params[:id])
     
  end

  def update
     @teacher=Teacher.find(params[:id])
      if @teacher.update(teacher_params)
        flash[:notice]="teacher details updated successfully!!!"
        redirect_to(teachers_path)
      else
        render('edit')
      end
  end

  def delete
    @teacher=Teacher.find(params[:id])
  end

  def destroy
    @teacher=Teacher.find(params[:id])
    @teacher.destroy
    flash[:notice]="teacher '#{@teacher.first_name}'  deleted successfully!!!"
    redirect_to(teachers_path)
  end
  private
  def teacher_params
    params.require(:teacher).permit(:first_name,:last_name,:email_id,:password)
  end


end
