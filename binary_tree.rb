require 'pry'


class BinaryTree
attr_reader :root

  def initialize(root=nil, data=nil)
    @root = root
    @sorted = []
    @possible_values = (1..21).to_a.shuffle
    @initial_poss_values = @possible_values
    @data = data
  end

  def load(filename)
    @data = {}
    f = File.open(filename, "r")
    f.each_line do |line|
      @data[line.split(',')[0].to_i]= (line.split(',')[1])
      @data
    end
    puts @data.count
  end

  def format_data
    @data = @data.map {|each| each.key.to_i }
  end

  def insert(value)
    node = NewNode.new
    node.value = value
    insert_at_root(node)
  end

  def insert_all
    while !@possible_values.empty?
      insert(@possible_values.pop)
    end
  end

  def insert_at_root(node)
      if @root == nil
        @root = node
      else
        move_insert(node)
      end
  end

  def move_insert(origin=@root, node)
    node.depth += 1
    if origin.value > node.value
      move_insert_left(origin, node)
    elsif origin.value < node.value
      move_insert_right(origin, node)
    end
  end

def move_insert_left(origin, node)
  if origin.left_side == nil
    origin.left_side = node
  else
    move_insert(origin.left_side, node)
  end
end

def move_insert_right(origin, node)
  if origin.right_side == nil
  origin.right_side = node
  else
  move_insert(origin.right_side, node)
  end
end


def include?(origin=@root, value)
  if origin.value == value
    @value_depth = origin.depth
    return true
  elsif origin.value > value
    move_search_left(origin, value)
  else
    move_search_right(origin, value)
  end
end

def depth_of(value)
  if include?(value)
    puts @value_depth
  else
    puts "Does not exist."
  end
end


def move_search_left(origin, value)
  if origin.left_side == nil
    puts false
  else
    include?(origin.left_side, value)
  end
end

def move_search_right(origin, value)
  if origin.right_side == nil
    puts false
  else
    include?(origin.right_side, value)
  end
end

  def min
    origin = @root
    until origin.left_side == nil
        origin = origin.left_side
      end
      min = origin.value
  end

  def max
    origin = @root
    until origin.right_side == nil
        origin = origin.right_side
      end
      max = origin.value
  end

end





class NewNode
  attr_accessor :value, :left_side, :right_side, :depth, :movie

def initialize (value=nil, left_side=nil, right_side=nil, depth=0, movie="Movie")
  @value = value
  @left_side = left_side
  @right_side = right_side
  @depth = depth
  @movie = movie
end

end


tree = BinaryTree.new
# tree.load('movies.txt')
tree.insert_all
tree.include?(23)
tree.include?(7)
tree.min
tree.max
tree.sort
