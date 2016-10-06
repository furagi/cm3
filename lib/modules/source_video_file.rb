module SourceVideoFile
  module ClassMethods

  end

  module InstanceMethods
    def source_video_file
      if self.source_video_file_id.nil?
        return nil
      else
        Gtf::VideoFile.find(self.source_video_file_id)
      end
    end
  end

  def self.included(receiver)
    receiver.extend         ClassMethods
    receiver.send :include, InstanceMethods
  end
end
