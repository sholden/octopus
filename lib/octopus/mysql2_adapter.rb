require 'active_record/connection_adapters/mysql2_adapter'

class ActiveRecord::ConnectionAdapters::Mysql2Adapter
  def supports_shared_connection_pool?
    true
  end

  def database=(database)
    if @database != database
      execute("USE #{database};")
      @database = database
    end
    @database
  end
end
