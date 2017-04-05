class User < ApplicationRecord
   has_secure_password
   	mount_uploader :image,ImageUploader
    validates :email,:presence => true, :uniqueness => true
    validates_format_of :email, :with => /\A[\+A-Z0-9\._%-]+@([A-Z0-9-]+\.)+[A-Z]{2,4}\z/i
  before_create{generate_toke(:auth_token)}
  
def send_password_reset
generate_toke(:password_reset_token)
self.password_reset_sent_at = Time.zone.now
save!
userMailer.password_reset(self).deliver	

   end

  def generate_toke(column)
	begin
		self[column] = SecureRandom.urlsafe_base64
	end while User.exists?(column => self[column])
		
	end

end
