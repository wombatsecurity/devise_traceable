class DeviseCreate<%= table_name.camelize.singularize %>Tracings < ActiveRecord::Migration
  def self.up
    create_table :activity_streams do |t|
      t.integer  :<%= table_name.classify.foreign_key  %>
  t.string :action
  t.text :notes
  t.string :ip_address
  #Any additional fields here
  #t.timestamps
end

add_index :activity_streams, :<%= table_name.classify.foreign_key  %>
end

def self.down
drop_table :activity_streams
end
end
