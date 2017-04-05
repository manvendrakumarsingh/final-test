class PasswordResetController < ApplicationController
  def new
  end
  def create
  	user =User.find_by_email(params[:email])
  	user.send_password_reset if user
  	 render json: { response_code: 200, response_message: "Email sent with password reset instructions "}
 end  
  def edit
  	@user = User.find_by_password_reset_token!(params[:id])
end
 def update
  	@user = User.find_by_password_reset_token!(params[:id])
  	if @user.password_reset_sent_at < 2.hours.ago
  		 render json: { response_code: 200, response_message: "Password Reset has expired"}

end
end
