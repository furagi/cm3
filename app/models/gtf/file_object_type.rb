class Gtf::FileObjectType < Gtf::Base
  self.table_name = "file_object_type"
  belongs_to :content_type, class_name: "Gtf::ContentType"
  belongs_to :file_object_type_family, class_name: "Gtf::FileObjectTypeFamily"
  belongs_to :secondary_content_type, class_name: "Gtf::SecondaryContentType"
end
