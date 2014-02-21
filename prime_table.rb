#! /usr/bin/env ruby
# Usage is ./prime_table n

class PrimeTable   
  @@total_numbers = 10000
  def initialize
    @numbers = (0..@@total_numbers).to_a
    @head = 2
  end
  
  def next_prime
    # return @head number, before that put all the multiples of that number from @head till @@total_numbers/@head to -1, and advance head till next non negative number
    next_prime = @head
    for multiplier in (@head..@@total_numbers/@head) do
      @numbers[@head*multiplier] = -1
    end
    
    @numbers[next_prime] = -1
    while @numbers[@head] == -1
      @head += 1
      if @head > @@total_numbers
        raise "Number of primes outside bound"
      end 
    end
    next_prime
  end         
  
  def next_primes(n)
    primes = []
    n.times do
      primes << next_prime
    end
    
    primes
  end
  
  def print_table(n) 
    primes = next_primes(n)    
    
    (1..10).each do |i|
      puts primes.map{ |prime| "%05d"  % ( prime* i) }.join(" ")
    end
  end
end       

n = ARGV[0]
if n.nil? 
  n = 10
end 

PrimeTable.new.print_table(n.to_i)


