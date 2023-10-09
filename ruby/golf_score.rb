#規定打数取得
regulationNumber = gets.chomp.split(",").map(&:to_i)
#プレイヤーの結果打数取得
result = gets.chomp.split(",").map(&:to_i)

#結果格納
score = []

#結果内容
SCORE_LIST = {
  1 => "ボギー",
  0 => "パー",
  -1 => "バーディ",
  -2 => "イーグル",
  -3 => "アルバトロス",
  -4 => "コンドル"
}

#スコア計算
result.each_with_index do |player, num|
  diff = player - regulationNumber[num]

  if player == 1 && [3,4].include?(regulationNumber[num])
    score << "ホールインワン"
  elsif diff >= 2
    score << "#{diff}ボギー"
  else
    score << SCORE_LIST[diff]
  end
end

puts score.join(",")
