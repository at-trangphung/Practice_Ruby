require 'sinatra'
require 'pry'
require 'mysql2'
PASS = 100_419_96
client = Mysql2::Client.new(host: 'localhost', username: 'root', password: PASS)
client.query('use customer')
delete '/bills' do
  prod_name = params['prod_name']
  a = client.query("delete from bills where pro_name = '#{prod_name}' ")
  rs = client.query('select * from bills')
  a = "Deleted: #{prod_name}<br>"
  a << ''
  rs.each do |row|
    a << "==> result: #{row['bill_id']} : #{row['pro_name']} <br>"
  end
  a
end
