group = ["A", "B", "C", "D", "E", "F"]
random_group = group.shuffle

#グループ組み合わせ(３人ずつ,２人と4人)
group_pattern = [[3,3],[2,4]]

#配列の組み合わせを取るための変数
randam = rand(2)

#グループの人数分けの抽選
group_num = group_pattern[randam]

#何人ずつに分けるかの変数
first_num = group_num[0]
second_num = group_num[1]

first_group = random_group.slice(0,first_num).sort
p first_group

second_group = random_group.slice(first_num,second_num).sort
p second_group
