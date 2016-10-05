class Gtf::MediaFile < Gtf::Base

  include Created
  before_create :set_created

  self.abstract_class = true

  # returns http://encdata-lh.gtflix.com/1/1/1324/3/066.jpg
  # where http://#{cdn_host}/#{storage_id}/#{video or image .subpath}/#{video_encoding_id or image_encoding_id}/#{filename}
  def url
    "http://#{Settings.cdn}/#{self.storage_id}/#{self.subpath}/#{self.encoding_id}/#{self.filename}"
  end
end
