class Gtf::ScenesController < Gtf::SubContentsController

  private

    def permitted_params
      puts "scene"
      {:scene => params.permit(:gtf_scene => [
          :user_id,
          :editor_id,
          :company_id,
          :content_id,
          :line_id,
          :director_id,
          :studio_id,
          :link_scene_status_id,
          :created,
          :tape,
          :director_rating,
          :director_comment,
          :seo_title,
          :small_description,
          :big_description,
          :keywords,
          :talents,
          :bts_description,
          :behind_info,
          :date_of_production,
          :runtime,
          :cost,
          :sales_at_day_100,
          :sales_at_day_547,
          :name,
          :external_data,
          :need_to_extract_metadata
        ])[:gtf_scene]
      }
    end
end
