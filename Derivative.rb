

#  Derivative.rb
#  
#
#  Created by RAHUL SINHA on 1/9/16.
#
class UnderLying
    attr_accessor :name,:buyprice,:sellprice
    def profit
        @sellprice-@buyprice
    end
end

class Market
end

class OTC < Market
end

class ExchangeTraded < Market
end
=begin
   A Derivative is a financial instrument that derives its value or performance
   from the performnce of the underlying asset
=end

class Derivative
    attr_accessor :name,:underlying_type,:value,:contractenforced
    attr_accessor :buydate,:selldate,:market
end
=begin
 ForwardCommitments lock in the trade price of the underlying
=end
class ForwardCommitments < Derivative
    def initialize
        @contractenforced=true
    end
end
=begin
 ContingentClaims offer the right but not the obligation to trade the underlying
 =end
class ContingentClaims < Derivative
    def initialize
        @contractenforced=false
    end
    
end
=begin
  Options offer the right but not the obligation to trade the underlying
=end
class Options < Derivative
    def initialize
        @contractenforced=false
    end
    def inTheMoney?
    end
end