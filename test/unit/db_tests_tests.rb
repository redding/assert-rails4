require "assert"
require "assert-rails/db_tests"

# Note: this is "unit" test that is acting like a "system-ish" test between
# this adapter gem and AssertRails's DbTests.  It is a copy of the
# same unit tests in AssertRails but instead of stubbing the adapter,
# it stubs ActiveRecord directly.

class AssertRails::DbTests

  class UnitTests < Assert::Context
    desc "AssertRails::DbTests"
    setup do
      @transaction_called = false
      Assert.stub(ActiveRecord::Base, :transaction) do |&block|
        @transaction_called = true
        block.call
      end

      @class = AssertRails::DbTests
    end
    subject{ @class }

    should "add an around callback to run tests in a rollback transaction" do
      assert_equal 1, subject.arounds.size
      callback = subject.arounds.first

      block_yielded_to = false
      assert_raises(ActiveRecord::Rollback) do
        callback.call(proc{ block_yielded_to = true })
      end
      assert_true @transaction_called
      assert_true block_yielded_to
    end

  end

end
