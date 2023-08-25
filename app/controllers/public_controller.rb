class PublicController < ApplicationController
   layout 'public'
   before_action :self_navigation
  def index
  end

  def show
    @student=Student.where(:permalink=>params[:permalink]).first
    if @student.nil?
      redirect_to(root_path)
    else
  end
end

private

def self_navigation
  @colleges=College.ascending
end
end
