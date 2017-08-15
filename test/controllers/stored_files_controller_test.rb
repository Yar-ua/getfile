require 'test_helper'

class StoredFilesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stored_files_index_url
    assert_response :success
  end

end
