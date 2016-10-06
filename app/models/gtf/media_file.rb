class Gtf::MediaFile < Gtf::Base

  include Created
  before_create :set_created

  self.abstract_class = true

  # returns http://encdata-lh.gtflix.com/1/1/1324/3/066.jpg
  # where http://#{cdn_host}/#{storage_id}/#{video or image .subpath}/#{video_encoding_id or image_encoding_id}/#{filename}
  def url
    "http://#{Settings.cdn}/#{storage_id}/#{subpath}/#{encoding_id}/#{self.filename}"
  end

  def content
    parent.content
  end

  private

    def storage_id
      parent.storage_id
    end

    def subpath
      parent.subpath
    end

end
