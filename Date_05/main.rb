load 'customer.rb'
require 'date'
# require_relative 'connect_DB'

class Main 
  def insertCustomer
    $cus_id = $client.query("SELECT MAX(cus_id) FROM customers").first["MAX(cus_id)"]   
    @cus = Customer.new
    @cus.input 
    $client.query("insert into customers(name, gender, join_date) values ('#{@cus.username}', '#{@cus.gender}', '#{@cus.join_date}')")
    print "Your ID is : #{$cus_id}\n" 
  end 

  def insertBill
    @cus = Customer.new
    @cus.buy($cus_id, $product_name, $quantity)
    $client.query("insert into bills(cus_id, pro_name, quanlity) values (#{$cus_id.to_i}, '#{$product_name}', #{$quantity.to_i})")
  end

  def showProduct
    print "Please enter your ID: "
    $id_cus = gets.chomp.to_i
    rs = $client.query("select pro_name, sum(quanlity) from bills  where cus_id = #{$cus_id} GROUP BY pro_name")
    if (rs.count == 0) 
      puts "You have not bought anything"
    else 
      puts 'you have bought...'
      rs.each do |row|
        puts "==> result: #{row["pro_name"]} : #{row["sum(quanlity)"]}"
      end
    end
  end

  def menu 
    puts '============================ MENU ==============================='
    puts '1. Tạo mới 1 customer, lưu vào DB, lưu ý ID không được trùng.'
    puts '2. Customer mua hàng, lưu vào DB. # nhập tên hàng hoá và số lượng từ bàn phím.'
    puts '3. Nhập vào ID của customer và show tất cả các hàng hoá và số lượng của customer đó đã mua,Nếu nếu một mặt hàng được mua 2 lần thì sẽ tính tổng của 2 lần lại. Ví dụ: có 2 lần buy(ruby, 10) và buy(ruby, 5) thì sẽ show lên là ruby -> 15. Nếu không tồn tại in ra là không tồn tại.'
    puts '0. thoát'
    print 'Enter number: '
  end  
end

main = Main.new
checkMenu = true
while checkMenu
  main.menu
  ch = gets.chomp
  case ch
  when '0'
    puts '==> googbye !!!'
    checkMenu = false
    break
  when '1'
    main.insertCustomer
  when '2'
    main.insertBill
  when '3'
    main.showProduct
  end
end


