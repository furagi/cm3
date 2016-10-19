class Gtf::ContentsController < CommonController

  private

    def permitted_params
      puts "content"
      {:content => params.permit(:gtf_content => [
          :content_type_id,
          :content_name,
          :external_data,
          :sef_name,
          :access_level,
          :cm_sorting_index
        ])[:gtf_content]
      }
    end
end
