require 'logger'

require 'bundler/setup'
require 'active_record'
require 'pg'

$stdout.sync = true

ActiveRecord::Base.logger = Logger.new(STDOUT)

100.times do |i|
  ActiveRecord::Base.establish_connection("postgres://postgres@cluster/postgres?pool=5")
  begin
    ActiveRecord::Base.connection.execute("INSERT INTO temp VALUES(#{i})")
  rescue ActiveRecord::StatementInvalid => e
    if e.cause.class == PG::ReadOnlySqlTransaction
      puts 'readonly!'
    else
      raise
    end
  else
    puts 'success'
  end
  sleep 2
end
