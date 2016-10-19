class Gtf::ImageEncoded < Gtf::Base
  self.table_name = "image_encoded"
  belongs_to :encoder_server, class_name: "Gtf::EncoderServer"
  belongs_to :image_encoding, class_name: "Gtf::ImageEncoding"
  belongs_to :image, class_name: "Gtf::Image"
end
