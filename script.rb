# frozen_string_literal: true

require 'pry'

# A = Class.new
class A
  def self.class_variable=(value)
    @@class_variable = value
  end

  def self.class_variable
    @@class_variable
  end

  def self.class_instance_variable=(value)
    @class_instance_variable = value
  end

  def self.class_instance_variable
    @class_instance_variable
  end

  def instance_variable=(value)
    @instance_variable = value
  end

  def instance_variable
    @instance_variable
  end
end

# B = Class.new(A)
class B < A
end

a = A.new
b = B.new

# A.class_variable          == B.class_variable
# A.class_instance_variable != B.class_instance_variable
# a.instance_variable       != b.instance_variable

binding.pry

puts :done
