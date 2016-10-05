require 'digest/sha1'

class Idcert::WebsiteUser < Idcert::Base
  attr_accessor :source_password
  before_save :encrypt_source_password
  after_save :clear_source_password
  before_create :set_created
  validates_presence_of :username
  validates :source_password, :confirmation => true #password_confirmation attr
  self.table_name = "website_user"
  belongs_to :country, class_name: 'Shared::Country'
  belongs_to :currency, class_name: 'Shared::Currency'

  private

    def encrypt_source_password
      puts "Password: #{self.source_password}"
      if self.source_password.present?
        puts self.source_password
        self.password = Digest::SHA1.hexdigest(self.source_password + self.website_user_id.to_s + Settings.salt)
      end
      return true
    end

    def clear_source_password
      self.source_password = nil
    end

    def set_created
      self.created = Time.now
    end
end
