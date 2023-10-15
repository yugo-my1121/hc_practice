class Pikachu < Pokemon

  def initialize(name,type1,type2,hp)
    super
  end

  def attack
    super
    puts "#{@name}の10万ボルト!"
  end

end
