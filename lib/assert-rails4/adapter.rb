require "active_record"
require "active_record/migration"
require "assert-rails/adapter"

module AssertRails4

  class Adapter
    include AssertRails::Adapter

    def reset_db
      ActiveRecord::Migration.maintain_test_schema!
    end

    def transaction(&block)
      ActiveRecord::Base.transaction(&block)
    end

    def rollback!
      raise ActiveRecord::Rollback
    end

  end

end
