class Person
  attr_accessor :username , :gender

  def input
    print 'enter name: '
    $username = gets.chomp
    print 'enter gender: '
    $gender = gets.chomp
  end

end

