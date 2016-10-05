class Gtf::VideoFile < Gtf::MediaFile

  self.table_name = "video_file"
  belongs_to :media, class_name: "Gtf::Media"
  belongs_to :video, class_name: "Gtf::Video"
  belongs_to :video_encoding, class_name: "Gtf::VideoEncoding"

  def storage_id
    self.video.storage_id
  end

  def subpath
    self.video.subpath
  end

  def encoding_id
    self.video_encoding_id
  end

  def content
    self.video.content
  end

  def source_video_file
    if self.source_video_file_id.nil?
      return nil
    else
      Gtf::VideoFile.find(self.source_video_file_id)
    end

  end

end
