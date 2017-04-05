class SessionsController < ApplicationController
	 def create
	     user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
        #session[:user_id] = user.id
        cookies.permanent[:auth_token] = user.auth_token
        render json: {:user_id => user[:id],:user_role=> user[:user_role], response_code: 200, response_message: "Successfully logged in."}
    else
        
     render :json => {:response_code=> 400,:response_message => "Unauthorized Access!"}     
 end
    
end
def destroy
	cookies.delete(:auth_token)
	    #session[:user_id] = nil
    redirect_to users_url, notice: 'logged out'
 
end
end
