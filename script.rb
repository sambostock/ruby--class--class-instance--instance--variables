# frozen_string_literal: true

require 'minitest/autorun'

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

class VariableTest < Minitest::Test
  def test_class_variables
    A.class_variable = 'foo'

    assert_equal 'foo', A.class_variable_get('@@class_variable')
    assert_equal 'foo', A.class_variable

    assert_equal 'foo', B.class_variable_get('@@class_variable')
    assert_equal 'foo', B.class_variable
  end

    def test_class_instance_variables
    A.class_instance_variable = 'bar'

    assert_equal 'bar', A.instance_variable_get('@class_instance_variable')
    assert_equal 'bar', A.class_instance_variable

    assert_nil B.instance_variable_get('@class_instance_variable')
    assert_nil B.class_instance_variable
  end

    def test_instance_variables
    a = A.new
    b = B.new

    a.instance_variable = 'biz'

    assert_equal 'biz', a.instance_variable_get('@instance_variable')
    assert_equal 'biz', a.instance_variable

    assert_nil b.instance_variable_get('@instance_variable')
    assert_nil b.instance_variable
  end
end
