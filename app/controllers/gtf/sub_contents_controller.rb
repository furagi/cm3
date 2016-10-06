class Gtf::SubContentsController < CommonController

  def update
    update! { edit_parent_url }
  end

  def destroy
    destroy! { edit_parent_url }
  end

  def create
    create! { edit_parent_url }
  end

  private
    def edit_parent_url
      {action: "edit", controller: parent_controller, id: parent_id}
    end

end

