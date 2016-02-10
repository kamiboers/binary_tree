require 'pry'

class BinaryTree
attr_reader :root

  def initialize
    @root = NewNode.new
    @possible_values = (1..100).to_a.shuffle
    # @root.movie = @possible_movies.pop
    @root.value = @possible_values.pop
  end

  def root
    puts @root.value
  end

  def possible_values_remain
    if !@possible_values.empty?
      create_new_node
    end
  end

  def create_new_node
    @value = NewNode.new
    @value.value = @possible_values.pop
    compare_nodes(@root, @value)
    possible_values_remain
  end



end

  def compare_nodes(original, newer)
    if original.value > newer.value
      if original.left_side == nil
        original.left_side = newer
      else
        compare_nodes(original.left_side, newer)
      end

    elsif original.value < newer.value
      if original.right_side == nil
        original.right_side = newer
      else
        compare_nodes(original.right_side, newer)
      end
    end
  end

# def search(desired, root)
#
#   if desired == root
#     puts "Value is equal to the root, at a depth of 0"
#   end
#
#   end



end



class NewNode
  attr_accessor :value, :left_side, :right_side, :depth

def initialize (value=nil, left_side=nil, right_side=nil, depth=0)
  @value = value
  @left_side = left_side
  @right_side = right_side
  @depth = depth
end

end


Tree = BinaryTree.new
Tree.possible_values_remain
Tree.root
binding.pry
