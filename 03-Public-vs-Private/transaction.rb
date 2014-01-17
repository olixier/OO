class Transaction
  
  attr_reader :amount, :time

  def initialize(amount)
    @amount = amount
    @time = Time.now
  end
  
  def to_s
    (@amount > 0 ? '+' : '') + @amount.to_s + @time.strftime(" on %d/%m/%y at %I:%M %p")
  end

end
