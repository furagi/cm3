class Gtf::Video < Gtf::Base

  include Created

  self.table_name = "video"
  belongs_to :company, class_name: "Gtf::Company"
  belongs_to :upload, class_name: "Gtf::Upload"
  belongs_to :file_object_type, class_name: "Gtf::FileObjectType"
  belongs_to :user, class_name: "Gtf::User"
  belongs_to :content, class_name: "Gtf::Content"
  belongs_to :storage, class_name: "Gtf::Storage"
  has_many :video_files, class_name: "Gtf::VideoFile"

  before_create :set_created

end
