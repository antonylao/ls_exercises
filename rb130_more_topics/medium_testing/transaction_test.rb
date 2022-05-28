require 'minitest/autorun'
# require 'minitest/reporters'
# Minitest::Reporters.use!

require_relative 'transaction'

class TransactionTest < Minitest::Test
  def setup
    @transaction = Transaction.new(15)
  end

  def test_prompt_for_payment
    test_input = StringIO.new("-1\n#{@transaction.item_cost - 1}\n#{@transaction.item_cost}")
    test_input2 = StringIO.new("#{@transaction.item_cost + 1}")

    output = StringIO.new
    @transaction.prompt_for_payment(input: test_input, output: output)
    assert_equal(15, @transaction.amount_paid)

    @transaction.prompt_for_payment(input: test_input2, output: output)
    assert_equal(16, @transaction.amount_paid)

  end

end