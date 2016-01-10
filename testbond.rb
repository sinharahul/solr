#  testbond.rb
#  
#
#  Created by RAHUL SINHA on 1/9/16.
#
require_relative 'bond'
require 'test/unit'
class TestBond < Test::Unit::TestCase
  def test_discount_bond
    ibm=Bond.new
    ibm.name="ibm 5 year"
    ibm.par=100.0
    ibm.coupanrate=4.0
    ibm.discountrate=6.0
    ibm.timetomaturity=5
    assert_equal(91.575,ibm.price )
  end
  def test_premium_bond
      premium=Bond.new
      premium.par=100
      premium.coupanrate=8.0
      premium.discountrate=6.0
      premium.timetomaturity=5
      assert_equal(108.425,premium.price )
  end
  def test_par_bond
      apple=Bond.new
      apple.name="apple premium"
      apple.par=100.0
      apple.coupanrate=6.0
      apple.discountrate=6.0
      apple.timetomaturity=5
      assert_equal(100,apple.price )
  end
end
