class SessionsController < ApplicationController

  def new
  end

  def create
    @employee = Employee.find_by(email: params[:email])
    if @employee && @employee.authenticate(params[:password])
      session[:employee_id] = @employee.id
      redirect_to "/"
    else
      redirect_to login_path
    end
  end
end
