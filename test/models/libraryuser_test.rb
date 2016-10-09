require 'test_helper'

class LibraryUserTest < ActiveSupport::TestCase

  def setup
    @libraryuser = Libraryuser.new(name: "Example User", email: "user@ncsu.edu", password: "abc", password_confirmation: "abc")
  end

  test "should be valid" do
    assert @libraryuser.valid?
  end

  test "name should be present" do
    @libraryuser.name = "     "
    assert_not @libraryuser.valid?
  end

  test "email should be present" do
    @libraryuser.email = "     "
    assert_not @libraryuser.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@ncsu.edu USER@abc.COM A_US-ER@abc.bar.org
                         first.last@abc.jp alice+bob@baz.cn]
    valid_addresses.each do |valid_address|
      @libraryuser.email = valid_address
      assert @libraryuser.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_abc.org user.name@example.
                           abc@bar_baz.com abc@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @libraryuser.email = invalid_address
      assert_not @libraryuser.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email addresses should be unique" do
    duplicate_user = @libraryuser.dup
    duplicate_user.email = @libraryuser.email.upcase
    @libraryuser.save
    assert_not duplicate_user.valid?
  end

  test "password should be present (nonblank)" do
    @libraryuser.password = @libraryuser.password_confirmation = " " 
    assert_not @libraryuser.valid?
  end

  test "email addresses should be saved as lower-case" do
    mixed_case_email = "abc@ncsu.edu"
    @libraryuser.email = mixed_case_email
    @libraryuser.save
    assert_equal mixed_case_email.downcase, @libraryuser.reload.email
  end

  test "password should have a minimum length" do
    @libraryuser.password = @libraryuser.password_confirmation = "a" 
    assert_not @libraryuser.valid?
  end

end
