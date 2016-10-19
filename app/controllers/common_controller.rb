class CommonController < InheritedResources::Base

  respond_to :html

  has_scope :page, :default => 1

  before_action :require_user

  actions :index, :new, :create, :edit, :update, :destroy

end

