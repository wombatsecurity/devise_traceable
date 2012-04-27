class DeviseCreate<%= table_name.camelize.singularize %>Tracings < ActiveRecord::Migration
  def self.up
    create_table :<%= table_name.singularize %>_tracings do |t|
      t.integer  :<%= table_name.classify.foreign_key  %>
  t.string :action
  t.text :notes
  t.string :ip_address
  #Any additional fields here
  #t.timestamps
end

add_index :<%= table_name.singularize %>_tracings, :<%= table_name.classify.foreign_key  %>
end

def self.down
drop_table :<%= table_name.singularize %>_tracings
end
end
