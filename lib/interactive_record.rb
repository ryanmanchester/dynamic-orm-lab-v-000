require_relative "../config/environment.rb"
require 'active_support/inflector'
require 'pry'

class InteractiveRecord

  def self.table_name
    self.to_s.downcase.pluralize
  end

  def self.column_names
    DB[:conn].results_as_hash = true
    sql = "PRAGMA table_info(#{table_name})"

    table_info = DB[:conn].execute(sql)
    column_names = []

    table_info.each do |row|
      column_names << row["name"]
    end
    column_names.compact
  end

  self.column_names.each do |col_name|
    binding.pry
  attr_accessor col_name.to_sym
end

  def initialize(options={})

    options.delete_if {|col| col == :id}.each do |attribute, value|
binding.pry
      self.send(("#{attribute}="), value)
    end
  end

  def table_name_for_values
    self.class.table_name
  end

end
