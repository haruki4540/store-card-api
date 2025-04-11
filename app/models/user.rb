class User < ApplicationRecord
    has_secure_password
  
    before_create :generate_email_confirm_token
  
    validates :email, presence: true, uniqueness: true
    validates :name, :furigana, :phone_number, :gender, :birth_date, presence: true
  
    def confirm!
        update(confirmed_at: Time.current, email_confirm_token: nil)
    end

    def confirmed?
      confirmed_at.present?
    end
  
    private
  
    def generate_email_confirm_token
      self.email_confirm_token = SecureRandom.urlsafe_base64
    end
  end
  


