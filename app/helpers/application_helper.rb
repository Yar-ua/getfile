module ApplicationHelper

  # хелпер для легкого отображения font-awesome icons
  def fa_icon
  	content_tag 'span', '', class: "fa fa-#{icon_class}"
  end

end
