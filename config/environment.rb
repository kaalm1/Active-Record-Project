require 'bundler/setup'
Bundler.require

require 'rake'
require 'active_record'
require 'yaml/store'
require 'ostruct'
require 'date'

require_all './app'

DBNAME = "library"

Dir[File.join(File.dirname(__FILE__), "../app/models", "*.rb")].each {|f| require f}
Dir[File.join(File.dirname(__FILE__), "../lib/support", "*.rb")].each {|f| require f}

# ActiveRecord::Base.establish_connection(:adapter => 'sqlite3',:database =>"db/#{DBNAME}-development.db")

DBRegistry["development"].connect!
DB = ActiveRecord::Base.connection

if ENV["ACTIVE_RECORD_ENV"] == "test"
  ActiveRecord::Migration.verbose = false
end
