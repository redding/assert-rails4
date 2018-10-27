require "assert"
require "assert-rails4/adapter"

require "active_record"
require "active_record/migration"

class AssertRails4::Adapter

  class UnitTests < Assert::Context
    desc "AssertRails4::Adapter"
    setup do
      @class = AssertRails4::Adapter
    end
    subject{ @class }

    should "mixin AssertRails::Adapter" do
      assert_includes AssertRails::Adapter, subject
    end

  end

  class InitTests < UnitTests
    desc "when init"
    setup do
      @adapter = @class.new
    end
    subject{ @adapter }

    should have_imeths :reset_db
    should have_imeths :transaction, :rollback!

    should "know how to reset the db" do
      maintain_test_schema_called_with = nil
      Assert.stub(ActiveRecord::Migration, :maintain_test_schema!) do |*args|
        maintain_test_schema_called_with = args
      end

      subject.reset_db

      exp = []
      assert_equal exp, maintain_test_schema_called_with
    end

    should "know how to run a transaction block" do
      ar_transaction_called = false
      Assert.stub(ActiveRecord::Base, :transaction) do |&block|
        ar_transaction_called = true
        block.call
      end

      block_yielded_to = false
      subject.transaction{ block_yielded_to = true }

      assert_true ar_transaction_called
      assert_true block_yielded_to
    end

    should "know how to trigger a transaction rollback" do
      assert_raises(ActiveRecord::Rollback){ subject.rollback! }
    end

  end

end
