class Gtf::ImageFilesController < Gtf::SubContentsController

  belongs_to :image, shallow: true

  private

    def parent_controller
      "gtf/images"
    end

    def parent_id
      permitted_params[:image_file][:image_id]
    end

    def permitted_params
      {:image_file => params.permit(:gtf_image_file => [
          :image_id,
          :image_encoding_id,
          :media_id,
          :created,
          :filename,
          :filesize,
          :sef_name,
          :width,
          :height,
          :encode_start,
          :encode_finish,
          :encode_status,
          :image_order,
          :status,
          :shared_access
        ])[:gtf_image_file]
      }
    end

end
