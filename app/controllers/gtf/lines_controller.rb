class Gtf::LinesController < CommonController

  private

    def line_params
      params.require(:line).permit()
    end
end

