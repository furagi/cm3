class Gtf::VideosController < Gtf::SubContentsController

  belongs_to :content, shallow: true

  private

    def parent_controller
      "gtf/contents"
    end

    def parent_id
      permitted_params[:video][:content_id]
    end

    def permitted_params
      {:video => params.permit(:gtf_video => [
          :content_id,
          :video_type_id,
          :video_name,
          :external_data,
          :sef_name,
          :access_level,
          :cm_sorting_index
        ])[:gtf_video]
      }
    end
end

