require "./user.rb"
class Player < User
  attr_accessor :lives

  def initialize(lives)
    super
    @lives=lives
  end

  def reduce_life(deduction)
    @lives-=deduction
  end
end