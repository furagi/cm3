class Gtf::AgentsController < CommonController

  respond_to :html

  has_scope :page, :default => 1

  before_action :require_user

  actions :all

  private
    def permitted_params
      {:agent => params.permit(:name, :email, :mobile, :company_id)}
    end

end
