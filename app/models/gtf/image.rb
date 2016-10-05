class Gtf::Image < Gtf::Base
  self.table_name = "image"
  belongs_to :company, class_name: "Gtf::Company"
  belongs_to :content, class_name: "Gtf::Content"
  belongs_to :file_object_type, class_name: "Gtf::FileObjectType"
  belongs_to :director, class_name: "Gtf::Director"
  belongs_to :storage, class_name: "Gtf::Storage"
  belongs_to :upload, class_name: "Gtf::Upload"
  belongs_to :user, class_name: "Gtf::User"
end
