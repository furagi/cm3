class Gtf::LabelsController < CommonController

  private

    def label_params
      params.require(:label).permit()
    end
end

