require "test_helper"

class UserTest < ActionDispatch::IntegrationTest
   test "can see index" do
     get '/'
     assert_select 'h1', 'advertisements#index'
   end
end
