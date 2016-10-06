class Gtf::ImageEncoding < Gtf::Base
  self.table_name = "image_encoding"
  belongs_to :upload_extension, class_name: "Gtf::UploadExtension"
end
