=begin
 Simple Bond pricing model
=end
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
  def pricea(arr)
      puts "Inside price a ,arr=#{arr}"
      @par=arr[1]
      @coupanrate=arr[2]
      @discountrate=arr[3]
      @timetomaturity=arr[4]
      price
  end
  def priceh(h)
      @par=h[:par]
      @coupanrate=h[:coupanrate]
      @discountrate=h[:discountrate]
      @timetomaturity=h[:timetomaturity]
      price
  end
=begin
   input from user
=end
  def prompt
      puts "Enter name of bond"
      @name=gets.chomp
      puts "Enter par value"
      @par=gets.to_i
      puts "Enter coupan rate"
      while @coupanrate=gets.to_f
          if @coupanrate > 0
              break
           end
       puts "Enter coupan rate"
      end
      
      puts "Enter discount value"
      @discountrate=gets.to_f
      puts "Enter time to maturity"
      @timetomaturity=gets.to_i
      price
      
      
  end
  def pblock
      puts "Enter name of bond"
      yield #@name=gets.chomp
      puts "Enter par value"
      @par=gets.to_i
      puts "Enter coupan rate"
      while @coupanrate=gets.to_f
          if @coupanrate > 0
              break
          end
          puts "Enter coupan rate"
      end
      
      puts "Enter discount value"
      @discountrate=gets.to_f
      puts "Enter time to maturity"
      @timetomaturity=gets.to_i
      price
      
 end
end
a=["treasury 1 year",100.0,6.0,6.0,5]
treasury=Bond.new
treasury.pricea(a)

h={
    name: "treasury 10 year",
    par:  100,
    coupanrate: 10,
    discountrate: 8,
    timetomaturity: 10
}
treasury.priceh(h)
