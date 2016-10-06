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
          :upload_id,
          :file_object_type_id,
          :company_id,
          :user_id,
          :content_id,
          # :secondary_content_id,
          :storage_id,
          :subpath,
          :url,
          :video_order,
          :created,
          :status,
          :subscription_news_state,
          :exporting_to_dmca_status
        ])[:gtf_video]
      }
    end
end
