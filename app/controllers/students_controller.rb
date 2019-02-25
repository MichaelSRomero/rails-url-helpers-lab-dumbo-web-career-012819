class StudentsController < ApplicationController
  before_action :set_student, only: :show

  def index
    @students = Student.all
  end

  def show
    @student = set_student
  end

  def activate
    @student = set_student
    
    if @student.active
      @student.update(active: false)
    else
      @student.update(active: true)
    end

    redirect_to action: :show, id: @student
  end

  private

    def set_student
      @student = Student.find(params[:id])
    end
end
