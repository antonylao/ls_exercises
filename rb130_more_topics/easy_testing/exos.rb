require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

class NoExperienceError < StandardError ; end

class Employee
  def initialize
    @experience = nil
  end

  def hire
    raise NoExperienceError unless @experience
  end

end
class BooleanTest < Minitest::Test
  def setup
    @odd_nb = 3
    @xyz = 'xyz'
    @nil = nil
    @empty_list = []
    @list = ['xy', 'xyz', 'yz']
    @employee = Employee.new
    @numeric = Numeric.new
    @kind_of_numeric = 1.5
  end

  def test_odd_question
    assert_equal(true, @odd_nb.odd?)
  end

  def test_xyz
    assert_equal('xyz', @xyz)
  end

  def test_nil
    assert_nil(@nil)
  end

  def test_empty_list
    assert_empty(@empty_list) # counts for 2 assertions
    #assert_equal true, @empty_list.empty?
  end

  def test_includes_xyz
    assert_includes(@list, 'xyz') # counts for 2 assertions
    # assert(@list.include?('xyz'))
    # assert_equal(true, @list.include?('xyz'))
  end

  def test_hire_raise_exception
    assert_raises(NoExperienceError) {@employee.hire}
  end

  def test_instance_of_numeric
    assert_instance_of(Numeric, @numeric)
  end

  def test_kind_of_numeric
    assert_kind_of(Numeric, @kind_of_numeric)
  end

  def test_same_object
    # list = ['xy', 'xyz', 'yz']
    list = @list

    assert_same(list, @list)
  end

  def test_refute_include
    @list.delete('xyz')
    refute_includes(@list, 'xyz')
  end
end