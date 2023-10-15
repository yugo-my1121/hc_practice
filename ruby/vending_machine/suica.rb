class Suica
  attr_reader :balance
  #attr_accessor :balance
  DEPOSIT = 500

  def initialize
    @balance = DEPOSIT
  end

  # Suicaをチャージする
  def charge(charge_num)
    if charge_num < 100
      raise "100円以下はチャージできません"
    else
      @balance += charge_num
    end
  end

  # Suicaのチャージ金額を減らす
  def pay(amount)
    if amount > @balance
      # チャージ金額が足りなかった場合例外処理を返す
      raise "残高が足りません"
    else
      @balance -= amount
      #balanceは読み込みできるので今回は残高から引かれる額を返す
      return amount
    end
  end
end
