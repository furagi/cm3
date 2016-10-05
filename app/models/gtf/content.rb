class Gtf::Content < Gtf::Base
  self.table_name = "content"
  default_scope ->{ order(:content_id => :desc) }
  belongs_to :content_type, class_name: 'Gtf::ContentType'
  has_one :scene
  has_many :videos, class_name: "Gtf::Video"
  has_many :images, class_name: "Gtf::Image"
  has_many :uploads, class_name: "Gtf::Upload"
end
