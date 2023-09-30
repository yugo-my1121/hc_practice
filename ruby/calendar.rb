require 'date'
require 'optparse'

def display_calender(year,month)
  # 月名の辞書を定義（英語から日本語へのマッピング）
  month_names = {
    'January' => '1月',
    'February' => '2月',
    'March' => '3月',
    'April' => '4月',
    'May' => '5月',
    'June' => '6月',
    'July' => '7月',
    'August' => '8月',
    'September' => '9月',
    'October' => '10月',
    'November' => '11月',
    'December' => '12月'
  }
  #カレンダーのデータ
  karenderDate = Date.new(year,month)
  month_name = month_names[karenderDate.strftime('%B')]

  #曜日の始まり
  startDay = karenderDate.cwday
  #最終日の取得
  lastDay = Date.new(year,month,-1).day;

  #曜日の表示
  puts "#{month_name} #{year}".center(20)
  puts "月 火 水 木 金 土 日"

  #曜日のスタート位置を決める
  case startDay
  when 1 then
    nil
  when 2 then
    print "#{"   " * 1}"
  when 3 then
    print "#{"   " * 2}"
  when 4 then
    print "#{"   " * 3}"
  when 5 then
    print "#{"   " * 4}"
  when 6 then
    print "#{"   " * 5}"
  when 7 then
    print "#{"   " * 6}"
  end

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
