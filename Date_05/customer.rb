require_relative 'person'

require 'mysql2'
$client = Mysql2::Client.new(:host => "localhost", :username => "root", :password => "10041996")
$client.query("use customer")

class Customer < Person
attr_accessor :id_cus , :join_date 

  def buy(cus_id, product_name, quantity)
    print 'enter cus_id: '
    $cus_id = gets.chomp
    print 'enter product name: '
    $product_name = gets.chomp
    print 'enter quantity: '
    $quantity = gets.chomp
  end 

  def input
    super()
    date = DateTime.new
    $join_date = DateTime.now.strftime("%F")
  end

end

