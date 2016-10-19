class Gtf::UploadsController < Gtf::SubContentsController

  belongs_to :content, shallow: true

  private

    def parent_controller
      "gtf/contents"
    end

    def parent_id
      permitted_params[:upload][:content_id]
    end

    def permitted_params
      {:upload => params.permit(:gtf_upload => [
          :upload_action_id,
          :file_object_type_id,
          :created,
          :company_id,
          :user_id,
          :content_id,
          :secondary_content_id,
          :target_id,
          :upload_subpath,
          :upload_start,
          :upload_finish,
          :status,
          :upload_status,
          :encode_status,
          :processing_status,
          :options,
          :json_options,
          :encoder_message,
          :spent_time_id,
          :priority,
          :warnings,
          :upload_mode,
          :rebuild_status_of_affected_resources
        ])[:gtf_upload]
      }
    end

end
