require 'digest/sha1'

class Gtf::User < Gtf::Base

  include Created

  self.table_name = "user"
  belongs_to :permission_group, class_name: "Gtf::PermissionGroup"
  belongs_to :company, class_name: "Gtf::Company"
  attr_accessor :source_password
  before_save :encrypt_source_password
  after_save :clear_source_password
  before_create :set_created
  validates_presence_of :username
  validates :source_password, :confirmation => true #password_confirmation attr

  def self.authenticate(username, password)
    user = self.find_by_username(username)
    if user && !password.blank?
      password = Digest::SHA1.hexdigest("#{password}#{user.user_id.to_s}#{Settings.salt}")
      Gtf::User.find_by_username_and_password(username, password)
    end
  end

  private

  def encrypt_source_password
    puts "Password: #{self.source_password}"
    if self.source_password.present?
      puts self.source_password
      self.password = Digest::SHA1.hexdigest(self.source_password + self.user_id.to_s + Settings.salt)
    end
    return true
  end

  def clear_source_password
    self.source_password = nil
  end

end
