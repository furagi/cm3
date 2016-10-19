class Gtf::SceneGenresController < CommonController

  private

    def scene_genre_params
      params.require(:scene_genre).permit()
    end
end

