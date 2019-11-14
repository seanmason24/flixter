class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_enrolled_in_current_lesson, only: [:show]

  def show
  end

  private

  def require_enrolled_in_current_lesson
    course = current_lesson.section.course
    if !current_lesson.enrolled_in?(course)
      redirect_to course_path(course), alert: 'Error Message Here'
    end
  end    

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end