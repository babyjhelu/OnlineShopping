module ProductsHelper

  def approve_link_text(approvable)
    approvable.status? ? 'Active' : 'Inactive'
  end

end
