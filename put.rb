require 'sinatra'
require 'pry'
require 'mysql2'
PASS = 100_419_96
client = Mysql2::Client.new(host: 'localhost', username: 'root', password: PASS)
client.query('use customer')
put '/bills' do
  name = params['name']
  id = params['id']
  query_sql = "update bills set pro_name = '#{name}' where bill_id = '#{id}'"
  a = client.query(query_sql)
  rs = client.query('select * from bills')
  a = "Updated: #{name}<br>"
  a << ''
  rs.each do |row|
    a << "==> result: #{row['bill_id']} : #{row['pro_name']} <br>"
  end
  a
end
