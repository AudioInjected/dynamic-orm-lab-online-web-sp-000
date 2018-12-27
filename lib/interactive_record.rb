require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'pry'

class InteractiveRecord
  def self.table_name
    self.to_s.downcase.pluralize
  end 
  
  def self.column_names
    DB[:conn].results_as_hash = true
    sql = "pragma table_info('#{table_name}')"
    info = DB[:conn].execute(sql)
    info.collect {|col| col["name"]}
  end
  
  def initialize(options = {}) 
    
  end
end