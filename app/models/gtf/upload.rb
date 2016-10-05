class Gtf::Upload < Gtf::Base
  self.table_name = "upload"
  belongs_to :company, class_name: "Gtf::Company"
  belongs_to :content, class_name: "Gtf::Content"
  belongs_to :file_object_type, class_name: "Gtf::FileObjectType"
  belongs_to :upload_action, class_name: "Gtf::UploadAction"
  belongs_to :user, class_name: "Gtf::User"
end
