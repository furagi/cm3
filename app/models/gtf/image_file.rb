class Gtf::ImageFile < Gtf::MediaFile

  include SourceVideoFile

  self.table_name = "image_file"
  belongs_to :media, class_name: "Gtf::Media"
  belongs_to :image_encoding, class_name: "Gtf::ImageEncoding"
  belongs_to :image, class_name: "Gtf::Image"

  private

    def parent
      self.image
    end

    def encoding_id
      self.image_encoding_id
    end

end
