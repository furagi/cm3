class Gtf::VideoFilesController < Gtf::SubContentsController

  belongs_to :video, shallow: true

  private

    def parent_controller
      "gtf/videos"
    end

    def parent_id
      permitted_params[:video_file][:video_id]
    end

    def permitted_params
      {:video_file => params.permit(:gtf_video_file => [
          :video_id,
          :media_id,
          :video_encoding_id,
          :source_video_file_id,
          :created,
          :filename,
          :filesize,
          :duration,
          :width,
          :height,
          :frame_count,
          :frame_rate,
          :bitrate,
          :encode_start,
          :encode_finish,
          :encode_status,
          :prepared_for_wm_embedding,
          :video_order,
          :ratio,
          :status,
          :is_expirable
        ])[:gtf_video_file]
      }
    end
end
