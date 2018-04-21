require 'mysql2'
client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "10041996")
# client.query("create database customer")
client.query("use customer") 
# client.query("create table customers ( cus_id int(4) not null auto_increment, name text(20), gender text(20), join_date date, primary key(cus_id));")
client.query("create table bills ( bill_id int(4) not null auto_increment, cus_id int(4) not null, pro_name text(20), quanlity int(4), primary key(bill_id), foreign key(cus_id) references customers(cus_id));")
