class User < ApplicationRecord
  has_attached_file :avatar, styles: {medium: '200x200>', thumb: '30x30>'}, default_url: 'missing.png'
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :email, :presence => {:message => 'You must enter an email'},
            :uniqueness=> {:message => "A user with email: #{:email} already exists"}
  validates :username, :presence => {:message => 'You must enter an username'},
            :uniqueness=> {:message => "A user with username: #{:username} already exists"}
  validates :password, :presence =>true,
            :length => { :minimum => 5, :maximum => 40 },
            :confirmation =>true, :message => 'Password error'
  has_secure_password
end
