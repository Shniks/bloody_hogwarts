class CoursesController < ApplicationController

  def index
    @courses = Course.alphabetical
  end

end
