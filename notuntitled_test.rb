gem 'minitest', '~> 5.2'
require 'minitest/autorun'
require 'minitest/pride'
require_relative 'notuntitled'

class TreeTest < Minitest::Test

def test_the_root_exists
  tree = BinaryTree.new
  assert (1..100).to_a.shuffle.include? @root.value
  assert_equal @root.class, NewNode
  assert_equal @root.left_side, nil
  assert_equal @root.right_side, nil
end

def new_node_exists_and_has_value
  tree = BinaryTree.new
  refute @value.value.empty?
  refute @value.left_side
  refute @value.right_side
end


puts @root.value
puts @root.left_side.value
puts @root.right_side.value
puts @root.left_side.left_side.value
puts @root.left_side.right_side.value
