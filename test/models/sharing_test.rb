require 'test_helper'

class SharingTest < ActiveSupport::TestCase
  test "should save sharing without user" do
    user = users(:melissa)
    memory = memories(:poney)
    sharing = Sharing.new(memory: memory)
    assert sharing.save
  end

  test "should not save sharing without memory" do
    sharing = Sharing.new
    assert_not sharing.save
  end

  test "should have a token" do
    user = users(:melissa)
    memory = memories(:poney)
    sharing = Sharing.create(memory: memory)
    assert sharing.token.present?
  end

  test "should have a unique token" do
    user = users(:melissa)
    memory = memories(:poney)
    sharing = Sharing.create(memory: memory)
    tested_sharing = Sharing.new(token: sharing.token)
    assert_not tested_sharing.save
  end
end
