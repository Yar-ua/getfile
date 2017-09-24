module ApplicationHelper

  # хелпер для легкого отображения font-awesome icons
  def fa_icon
  	content_tag 'span', '', class: "fa fa-#{icon_class}"
  end


  # возвращает иконку в соответствии с типом файла
  def show_me_icon(value)
  	case value
  	  when 'video'
  	    return fa_icon('file-video-o')
  	  when 'audio'
  	  	return fa_icon('file-audio-o')
      when 'image'
        return fa_icon('file-image-o')
      when 'archieve'
      	return fa_icon('file-archive-o')
      when 'document'
     	return fa_icon('file-text-o')
    else
      return fa_icon('file-o')
    end
  end

end
