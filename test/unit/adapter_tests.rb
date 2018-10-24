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

    should "know how to reset the db" do
      maintain_test_schema_called_with = nil
      Assert.stub(ActiveRecord::Migration, :maintain_test_schema!) do |*args|
        maintain_test_schema_called_with = args
      end

      subject.reset_db

      exp = []
      assert_equal exp, maintain_test_schema_called_with
    end

  end

end
