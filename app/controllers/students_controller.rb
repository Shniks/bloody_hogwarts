class StudentsController < ApplicationController

  def index
    @students = Student.alphabetical
  end

  def show
    @student = Student.find(params[:id])
  end

end
