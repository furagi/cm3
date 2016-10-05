class Gtf::PermissionGroupsController < CommonController

  private

    def permission_group_params
      params.require(:permission_group).permit()
    end
end

