class Gtf::VideoFile < Gtf::MediaFile

  include SourceVideoFile

  self.table_name = "video_file"
  belongs_to :media, class_name: "Gtf::Media"
  belongs_to :video, class_name: "Gtf::Video"
  belongs_to :video_encoding, class_name: "Gtf::VideoEncoding"

  def content
    parent.content
  end

  private

    def parent
      self.video
    end

    def encoding_id
      self.video_encoding_id
    end

end
