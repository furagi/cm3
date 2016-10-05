class Gtf::SubContentsController < CommonController

  def update
    super { edit_parent_url }
  end

  def destroy
    super { edit_parent_url }
  end

  def create
    super { edit_parent_url }
  end

  private
    def edit_parent_url
      url = {action: "edit", controller: parent_controller, id: parent_id}
    end

end

