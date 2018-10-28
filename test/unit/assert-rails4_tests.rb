require "assert"
require "assert-rails4"

require "assert-rails4/adapter"

module AssertRails4

  class UnitTests < Assert::Context
    desc "AssertRails4"
    setup do
      @module = AssertRails4
    end
    subject{ @module }

    should "set AssertRails's adapter" do
      exp = AssertRails4::Adapter
      assert_instance_of exp, AssertRails.adapter
    end

  end

end
