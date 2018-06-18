require 'test_helper'

class SharingTest < ActiveSupport::TestCase
  test "should have a user" do
    memory = memories(:poney)
    sharing = Sharing.new(memory: memory, token: memory.token)
    assert_not sharing.save
  end

  test "should have a memory" do
    user = users(:anisa)
    sharing = Sharing.new(token: 'rdyrdrtd678gygy', user: user)
    assert_not sharing.save
  end

  test "should have a token" do
    user = users(:anisa)
    memory = memories(:poney)
    sharing = Sharing.new(memory: memory, user: user)
    assert_not sharing.save
  end

  test "user should be different than memory owner" do
    melissa = users(:melissa)
    anisa = users(:anisa)
    memory = memories(:poney)
    melissa_sharing = Sharing.new(memory: memory, user: melissa, token: memory.token)
    assert_not melissa_sharing.save
    anisa_sharing = Sharing.new(memory: memory, user: anisa, token: memory.token)
    assert anisa_sharing.save
  end

  test "token should be the same as memory" do
    user = users(:anisa)
    memory = memories(:poney)
    sharing = Sharing.new(memory: memory, user: user, token: 'tKkfgEUttkT1HQVa')
    assert_not sharing.save
    sharing = Sharing.new(memory: memory, user: user, token: memory.token)
    assert sharing.save
  end
end
