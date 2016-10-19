class Gtf::ImagesController < Gtf::SubContentsController

  belongs_to :content, shallow: true

  private

    def parent_controller
      "gtf/contents"
    end

    def parent_id
      permitted_params[:image][:content_id]
    end

    def permitted_params
      {:image => params.permit(:gtf_image => [
          :upload_id,
          :file_object_type_id,
          :company_id,
          :user_id,
          :content_id,
          :secondary_content_id,
          :storage_id,
          :subpath,
          :url,
          :image_order,
          :created,
          :status,
          :source_video_file_id,
          :screenshots_rate
        ])[:gtf_image]
      }
    end

end

