require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'cash_register'
require_relative 'transaction'

class CashRegisterTest < Minitest::Test
  def setup
    @transaction1 = Transaction.new(10)
    @transaction2 = Transaction.new(15)
    @register = CashRegister.new(1000)
  end

  def test_accept_money
    @transaction1.amount_paid = 5
    register_amount_before = @register.total_money
    @register.accept_money(@transaction1)
    register_amount_after = @register.total_money

    assert_equal(5, register_amount_after - register_amount_before)
  end

  def test_change
    assert_equal(-@transaction1.item_cost, @register.change(@transaction1))
    @transaction1.amount_paid = @transaction1.item_cost
    assert_equal(0, @register.change(@transaction1))
    @transaction1.amount_paid = @transaction1.item_cost + 10
    assert_equal(10, @register.change(@transaction1))
  end

  def test_give_receipt
    assert_output("You've paid $10.\n") { @register.give_receipt(@transaction1) }
    # @transaction1.amount_paid = 10
  end

end