require 'date'
require 'optparse'

def display_calender(year,month)
  #カレンダーのデータ
  karenderDate = Date.new(year,month)
  month_name = karenderDate.strftime('%m')

  #曜日の始まり
  startDay = karenderDate.cwday
  #最終日の取得
  lastDay = Date.new(year,month,-1).day;

  #曜日の表示
  puts "#{month_name}月 #{year}".center(20)
  puts "月 火 水 木 金 土 日"

  #曜日のスタート位置を決める
  print "#{"   " * (startDay - 1) }"

  day = 1
  while day <= lastDay do
    #右ずめで表示
    print "#{day.to_s(10).rjust(2)} "

    #週ごとに改行
    if (day + startDay - 1) % 7 == 0
      puts "\n"
    end
    day += 1
  end

end

# コマンドライン引数が、1~12月でない場合の出力
def get_calendar_month(year, month)
  if (1..12).include?(month)
    display_calendar(year, month)
    return
  end
  puts "#{month} is neither a month number (1..12) nor a name"
end

def main
  # 本日日付から取得、初期化
  today = Date.today
  year = today.year
  month = today.month
  # コマンドライン引数
  OptionParser.new do |opt|
    ## 引数の挙動を定義
    opt.on('-m M', '--month M', Integer, 'Select of month M') do |m|
      unless (1..12).include?(m)
        puts "#{m} is neither a month number (1..12) nor a name"
        exit
      end
      month = m
    end
    ## 定義されたコマンドラインオプションを解析・実行
    opt.parse!(ARGV)
  end
  display_calender(year, month)
end

main
