class PlacesController < ApplicationController
	def create
	user = User.where{:id params[:place][:user_id]}.first
     return render json: {response_code: 500, response_message: "User not found"} if user.blank
  place = user.places.new(place_params)
  if place.save!
render json: {place_id:place_id,response_code: 200, response_message: "added succefully"}
else
 render json: {place_id:place_id,response_code: 400, response_message: "could not found"} 	

	end

end
def show
	   user =Place.where(:id params[:place][:user_id]).first
	  return render json: {response_code: 500, response_message: "User not found"} if user.blank
      place = Place.where(user_id:,user_id)
      place.to_json
       render json: {place: place,response_code: 200} 	
end
private 
def place_params
    params.require(:place).permit(:user_id,:favorite_places)
  end
end

