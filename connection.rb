require 'mysql2'
client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "10041996")
# client.query("create database football")
client.query("use football") 
# client.query("create table football_names ( id int(4) not null auto_increment, name text(20), primary key(id));")
my_array = ["team1", "team2", "team3" , "team4"]
l = my_array.length.to_i;
i = 0 

while (i < l)
  client.query("insert into football_names(name)  values ('#{my_array[i]}');")
  i = i + 1
end 

for team in my_array do
  client.query("insert into football_names(name)  values ('#{team.to_s}');")
end

 k = 0
until (k >= l)
  client.query("insert into football_names(name)  values ('#{my_array[k]}');")
  k = k + 1
end	
