class UsersController < ApplicationController
     def index
      @user = User.all
       render json: {:user => @user,:user=>@user.as_json(except: [:created_at,:updated_at,:image,:first_name,:last_name,:dob,:country,:phone_number,:address,:state,:zip_code,:kids])}
   end
	 


   def show
    if @user = User.find_by(id: params[:user][:user_id])
    render json: {response_code: 200, :user=> @user.as_json(except: [:created_at,:updated_at,:password_digest])}
   else
     render json: { response_code: 400, response_message: "Bad Request"}    
    
     end
end
    
   

    def home

        user= User.find(params[:home][:user_id])
        if user.user_role == "king"
        	all = User.where.not(user_role:"king")
        	all = all.as_json(only: [:id, :first_name,:last_name,:user_role]) 
         end

          if user.user_role == "Queen"
          	all = User.where(user_role:"Girl")
            all = all.as_json(only: [:id, :first_name,:last_name,:user_role]) 	
          end
           if user.user_role == "Girl"
          	all = User.where(user_role:"Boy")  
            all = all.as_json(only: [:id, :first_name,:last_name,:user_role]) 
          end

           if user.user_role == "Boy"
          	all = User.where(user_role:"king")
            all = all.as_json(only: [:id, :first_name,:last_name,:user_role]) 
          end     
           render json: {home: all,user_role: user.user_role,response_code: 200, response_message: "User list."}
end



   


   #user user

   def create
    user = User.new(user_params)
     
    if user.save
        #session[:user_id] = user.id
      
        render json: {:user_id => user[:id], :user_role=> user[:user_role],response_code: 200, response_message: "SignUp successfully."}
    else
        render json: { response_code: 400, response_message: "could not signup successfully."}
    end
end


def update

user = User.find_by(id: params[:user][:user_id])

     return   render json: {response_code: 400, response_message: "user not found"} if user.blank?

           if user.update(update_params)
            render json: { response_code: 200, response_message: "successfully updated"}
            else
            	  render json: { response_code: 400, response_message: "could not updated"}
             
            end	
        end
     


  private

    def home_params
      params.require(:home).permit(:user_id,:user_role)
  end

 def update_params
      params.require(:user).permit(:email,:first_name,:last_name,:dob,:country,:address,:state,:zip_code,:kids,:phone_number,:image)
  end
  def user_params
    params.require(:user).permit(:email,:password,:password_confirmation,:user_role,:user_id)
  end

  

end
