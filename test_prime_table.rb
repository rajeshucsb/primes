require "test/unit"

require './prime_table'

class TestPrimeTable < Test::Unit::TestCase
  def setup
    @prime_table = PrimeTable.new
  end
  
  def test_next_prime
    assert_equal 2, @prime_table.next_prime 
  end

  def test_two_next_prime
    assert_equal 2, @prime_table.next_prime 
    assert_equal 3, @prime_table.next_prime 
    assert_equal 5, @prime_table.next_prime 
  end
  
  def test_next_primes
    assert_equal [2], @prime_table.next_primes(1)
  end
  
  def test_next_primes_2
    assert_equal [2,3], @prime_table.next_primes(2)
  end
  
  def test_next_primes_3
    assert_equal [2,3,5], @prime_table.next_primes(3)
  end
   
  def test_next_primes_raises
    assert_raise RuntimeError do
       @prime_table.next_primes(100) 
     end
  end
end