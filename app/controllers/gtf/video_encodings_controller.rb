class Gtf::VideoEncodingsController < InheritedResources::Base

  private

    def video_encoding_params
      params.require(:video_encoding).permit()
    end
end

