class Gtf::SceneKeywordsController < CommonController

  private

    def scene_keyword_params
      params.require(:scene_keyword).permit()
    end
end

