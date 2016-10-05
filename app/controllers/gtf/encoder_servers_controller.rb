class Gtf::EncoderServersController < CommonController

  private
    def permitted_params
      {
        :encoder_server => params.permit(:gtf_encoder_server => [
          :name,
          :description,
          :status,
          :is_usable
        ])[:gtf_encoder_server]
      }
    end
end

