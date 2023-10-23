require_relative 'suica'
require_relative 'juice'


class Machine

    attr_reader:Stock_Juce,:sales
    # 自動販売機はジュースを１種類格納できる
    # ジュースは名前と値段の情報をもつ
    def initialize
      # 初期状態で、ペプシ(150円)を5本格納している。
      @Stock_Juce = {
        "ペプシ" =>{juice:Juice.new("ペプシ",150),quantity:5},
        "モンスター" =>{juice:Juice.new("モンスター",230),quantity:5},
        "いろはす" =>{juice:Juice.new("いろはす",120),quantity:5}

        #  "ペプシ" =>{name:"ペプシ",price:150,quantity:5},
        #  "モンスター" =>{name:"モンスター",price:230,quantity:5},
        #  "いろはす" =>{name:"いろはす",price:120,quantity:5}
      }
      @sales = 0
    end

    # 自動販売機は在庫を取得できる
     def Stock_Juce(name)
       @Stock_Juce[name][:quantity]
     end

    # 自動販売機はペプシが購入できるかどうかを取得できる。
    # →suicaの残高がペプシの値段以上かつペプシの本数が0より多い時trueそれ以外false
    def Purchase_Check?(suica,name)
      suica.balance >= @Stock_Juce[name][:juice].price && @Stock_Juce[name][:quantity] > 0
    end

    # ジュース値段以上のチャージ残高がある条件下で購入操作を行うと以下の動作をする
      # 自動販売機はジュースの在庫を減らす
      # 売り上げ金額を増やす
      # Suicaのチャージ残高を減らす
    # チャージ残高が足りない場合もしくは在庫がない場合、購入操作を行った場合は例外を発生させる
    # 自動販売機は現在の売上金額を取得できる

    #購入メソッド
    def Purchase(suica,name)
      if Purchase_Check?(suica,name)
        @Stock_Juce[name][:quantity] -= 1
        @Stock_Juce[name][:quantity]
        #売り上げ金額を増やす
        @sales += @Stock_Juce[name][:juice].price

        #Suicaのチャージ金額を減らす
        suica.pay(@Stock_Juce[name][:juice].price)

      else
        raise "売り切れです"
      end
    end

    #自動販売機の売り上げ
    def get_sales
      @sales
    end

    # 自動販売機は購入可能なドリンクのリストを取得できる
     def buy_drink_list(suica)
      list = []
      @Stock_Juce.each do |key,value|
        if suica.balance >= value[:juice].price && value[:quantity] > 0
          list << key
        end

      end
      return list
     end
    # 自動販売機に在庫を補充できるようにする
    def juce_replenishment(name,num)
      @Stock_Juce[name][:quantity] += num
    end

end
