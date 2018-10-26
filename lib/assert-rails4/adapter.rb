require "active_record"
require "active_record/migration"
require "assert-rails/adapter"

module AssertRails4

  class Adapter
    include AssertRails::Adapter

    def reset_db
      ActiveRecord::Migration.maintain_test_schema!
    end

  end

end
