class User < ActiveRecord::Base
  EMAIL_REGEXP = /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/
  
  scope :confirmed, -> { where.not(confirmed_at: nil) }
  
  validates_presence_of :email, :full_name, :location
  validates_length_of :bio, minimum: 5, allow_blank: false
  validates_format_of :email, with: EMAIL_REGEXP
  validates_uniqueness_of :email 
  
  has_secure_password

  before_create :generate_token

  def generate_token
    self.confirmation_token = SecureRandom.urlsafe_base64
  end

  def confirm!
    return if confirmed?
    
    self.confirmed_at = Time.current
    self.confirmation_token = ''
    save!
  end

  def confirmed?
    confirmed_at.present?
  end
  
  # scope :confirmed, where('confirmed_at IS NOT NULL')

  def self.authenticate(email, password)
    confirmed.
      find_by(email: email).
      try(:authenticate, password)    
  end
end