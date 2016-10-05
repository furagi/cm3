class Gtf::ContentReleasesController < CommonController

  private

    def content_release_params
      params.require(:content_release).permit()
    end
end

