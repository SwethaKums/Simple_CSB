class StudentsController < ApplicationController
  layout 'admin'
  before_action :find_college,   :only=>[:new,:create,:edit,:update]
  before_action :logged_in_restriction ,:excpet=>[:login,:attempt_login,:logout]

 
  def index
  @students=Student.ascending
  end


 def show
  @student=Student.find(params[:id])
  end

 
  def new
    @student=Student.new
   
  end

  def create
    @student=Student.new(student_params)
    if @student.save
      flash[:notice]="student saved successfully!!!"
      redirect_to(students_path)
    else
     
      render('new')
  end
end

  def edit
      @student=Student.find(params[:id])
      
     
  end

  def update
     @student=Student.find(params[:id])
      if @student.update(student_params)
        flash[:notice]="student updates successfully!!!"
        redirect_to(student_path(@student))
      else
        
        render('edit')
      end
  end

  def delete
    @student=Student.find(params[:id])
  end

  def destroy
    @student=Student.find(params[:id])
    @student.destroy
    flash[:notice]="student '#{@student.student_name}' deleted successfully!!!"
    redirect_to(students_path)
  end
  private
  def student_params
    params.require(:student).permit(:college_id,:student_name,:student_address,:permalink)
  end

  def find_college
    @college=College.ascending
  end
end
