class Instructor::SectionsController < ApplicationController
  def new
    @course = Couse.find(params)[:course_id])
    @section = Section.new
  end
end
