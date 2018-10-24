require "assert-rails"

require "assert-rails4/version"
require "assert-rails4/adapter"

module AssertRails4
end

AssertRails.adapter(AssertRails4::Adapter.new)
