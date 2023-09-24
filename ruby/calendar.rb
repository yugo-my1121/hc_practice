require 'date'

firstDay = Date.new(2023,9,1);
lastDay = Date.new(2023,9,-1);

print "\s\s\s\s\s#{firstDay.month}月\s"
p firstDay.year

#日付のスタート位置
startDay = firstDay.wday

#改行計算用の変数
numDay = startDay


p "月 火 水 木 金 土 日"

#日付の配列
valueDay = [*firstDay.day..lastDay.day]
i = 0
valueDay.each do |num|
  #曜日の位置まで空文字を入れる
  while i < startDay do
    print "　 "
    i += 1
  end
  #週の折り返しで改行で表示
  if numDay == 7 || numDay == 14 || numDay == 21 || numDay == 28
    puts "#{num}"
  else
    print "#{num} "
  end
  numDay += 1
end
