class ApplicationController < ActionController::Base
  helper_method :logged_in?, :current_employee

  def current_employee
    if session[:employee_id]
      @employee = Employee.find(session[:employee_id])
    end
  end

  def logged_in?
    !!current_employee
  end
end
