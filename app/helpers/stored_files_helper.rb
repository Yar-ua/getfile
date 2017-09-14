module StoredFilesHelper

  def set_path_to_object(value)
    return Rails.root.join('public', 'uploads', value.name)
  end

end
