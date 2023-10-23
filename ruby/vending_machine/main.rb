require_relative 'suica'
require_relative 'machine'

#残高1200円のオブジェクト作成
suica = Suica.new
suica.charge(700)
# チャージを100円以下に指定したときに例外処理になる
# suica.charge(50)
puts "残高:#{suica.balance}"

#自動販売機のオブジェクト
machine = Machine.new



#モンスターの購入処理で本数を減らす
puts "本数:#{machine.purchase(suica,"モンスター")}"

#売り上げ
puts "売り上げ:#{machine.sales}"

# 残高(1200-230(モンスター分)=970ならOK)
puts "残高:#{suica.balance}"

puts "========================================"

# 購入できるリスト
puts "購入できるドリンクリスト:"
puts machine.buy_drink_list(suica)

# 指定してジュースを補充
machine.juce_replenishment("いろはす",5)
puts "========================================"
#指定したジュースの在庫確認
puts "いろはすの在庫:#{machine.stock_juce("いろはす")}"

# いろはす購入
puts "残高から引く額:#{machine.purchase(suica,"いろはす")}"

# いろはすの在庫
puts "いろはすの在庫:#{machine.stock_juce("いろはす")}"

# Suica残高
puts "残高:#{suica.balance}"

# モンスター購入
puts "残高から引く額:#{machine.purchase(suica,"モンスター")}"

#モンスターの在庫
puts "いろはすの在庫:#{machine.stock_juce("モンスター")}"

# Suica残高
puts "残高:#{suica.balance}"
