require 'test_helper'
require 'digest/sha1'

class UserTest < ActiveSupport::TestCase
  test "should create a user with a hashed password" do
    password = "1234"
    user = User.new(
      :username => "tester",
      :password => password,
      :permission_group_id => 1,
      :company_id => 1,
      :name => "tester",
      :surname => "test",
      :email => "test",
      :description => "test",
      :disabled => 0,
      :last_login => Time.now,
      :language => 1,
      :ftp_password => "wqe",
      :ftp_uid => 1,
      :ftp_gid => 1,
      :ftp_homedir => "test",
      :ftp_shell => "#",
      :ftp_expiration => Time.now,
      :ftp_lastlogin => Time.now,
      :ftp_lastlogout => Time.now,
      :ftp_count => 0
    )
    user_id = user.user_id.to_s
    user.save
    # user.reload # (make sure it saved!)
    assert_not_nil user.user_id
    assert user.password == Digest::SHA1.hexdigest(password + user_id + Settings.salt)
  end
  test "given a user named 'tester0' with a password of '1234', he should be authenticated with 'tester' and '1234' " do
    assert User.authenticate("tester0", "1234")
  end
end
