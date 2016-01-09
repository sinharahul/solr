class Bond
  attr_accessor :name,:par,:coupanrate,:discountrate,:timetomaturity
  def price
    puts "Calculating price of bond #{@name}"
    # coupanrate = 4% ,par 100, amt=4
    puts "par=#{@par} and couponrate=#{@coupanrate} and discount rate=#{@discountrate}"
    amt=@par*@coupanrate/100.0 
    denom=1.0+@discountrate/100
    sum=0
    for i in 1..@timetomaturity-1
      sum+=amt/(denom ** i)
#      puts "i=#{i} sum=#{sum}"
    end
    sum+=(@par+amt)/(denom ** @timetomaturity)
    puts "Bond market price is #{sum.round(3)}"
  end
end

ibm=Bond.new
ibm.name="ibm 5 year"
ibm.par=100.0
ibm.coupanrate=4.0
ibm.discountrate=6.0
ibm.timetomaturity=5

puts ibm
ibm.price

apple=Bond.new
apple.name="apple premium"
apple.par=100.0
apple.coupanrate=6.0
apple.discountrate=6.0
apple.timetomaturity=5
apple.price

premium=Bond.new
premium.par=100
premium.coupanrate=8.0
premium.discountrate=6.0
premium.timetomaturity=5
premium.price
