require "byebug"





class PolyTreeNode

  attr_accessor :children, :value, :parent

  def initialize(value)
    @children = []
    @value = value
    @parent = nil
  end

  def parent=(parent_node)
    # Returns if self
    return if self.parent == parent_node
    # Handles nil
    if parent_node == nil
      return @parent = nil
    end
    #
      if parent_node != @parent
        if self.parent != nil
          # byebug
          if self.parent.children.include?(self)

            self.parent.children.delete(self)
          end
        end
      end
      # Assign new parent value
     @parent = parent_node
     # Assign child to parent_node
     @parent.children << self
    # return nil if parent_node.children.include?(self)

  end

  def add_child(child_node)
    child_node.parent = self
  end

  def remove_child(child_node)
    raise "Not a child" if child_node.parent != self
    child_node.parent = nil

  end

  def dfs(target_value, &prc)
    prc ||= Proc.new {|node| node.value == target_value}
    return target_value if prc.call(self.value)

    self.children.each do |child|
      return value if value == target_value
      child.dfs(target_value, &prc) if child.children.empty? == true
    end


  end


end
