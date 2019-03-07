require './aa'
require './module'

  my_hp = 20000
  enemy_hp = 0
  my_senzu = 3
  enemy_senzu = 0
  power = 0
  swich_waza = "不可！！！"
  turn = 1

enemy_list = ["チャオズ","天津飯","ベジータ","バータ","ジース","悟空"]
line = "----------------------------------------------------------"
win = "オメェの勝ちだぞ！！！（敵）\nまた遊んでくれよな"
lose ="おらの勝ちだ！！！\nドラゴンボールで生き返って出直してこい！\nでぇじょーぶだ、オメェならできる！"
start
puts line
puts "！！！ドラゴンボールドッカンバトル！！！"
puts "戦いたいやつを選べよな！"
show_enemy_list(enemy_list)
input = gets.chomp.to_i
puts "#{enemy_list[input - 1]}と戦うんだな！\n闘技場に移動するぞ！！！"

#きゃらのアスキー表示
if input == 1
  chaos_aa
elsif input == 2
tenshinhan_aa
elsif input == 3
  vegeta_aa
elsif input == 4
  bata_aa
elsif input == 5
  jisu_aa
elsif input == 6
  goku_aa
end


if input == 1
  enemy_hp += 10000
  enemy_senzu += 8
elsif input == 2
  enemy_hp += 14000
  enemy_senzu += 6
elsif input == 3
  enemy_hp += 60000
  enemy_senzu += 1
elsif input == 4
  enemy_hp += 14000
  enemy_senzu += 5
elsif input == 5
  enemy_hp += 12000
  enemy_senzu += 7
elsif input == 6
  enemy_hp += 17000
  enemy_senzu += 2
elsif input == 7
  enemy_hp += 70000
  enemy_senzu += 1
end


while true do
  puts line
  puts "●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●"
  puts "●                       ターン:#{turn}                                  ●"
  puts "●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●●"
  turn += 1
  show_hp(my_hp,enemy_hp,power,enemy_list[input - 1])
  kakegoe(my_senzu,enemy_senzu,power)
  me = 0
  enemy = 0
  recovery = 0
  me = gets.chomp.to_i
  enemy = rand(1..3)
  puts line
  status = "あなた：#{judge(me)}\n敵：#{judge(enemy)}"
  status2 = "必殺技使用:#{swich_waza}"
  #じゃんけん処理
  if enemy_hp >= 0 && my_hp >= 0
#気を澑める
    if me == 5
    power += 1
    puts "気が溜まった！"
    swich_waza = tamewaza(power,swich_waza)
    puts status2
     damage2 = ran_damage(enemy)
      puts "★★★★★ 敵の攻撃 ★★★★★"
      kaiouken
      kaishin(damage2)
      puts "ドカン！！\nあなたに#{damage2}のダメージ！！！"
      my_hp -= damage2
      show_hp(my_hp,enemy_hp,power,enemy_list[input - 1])
    end

    if power >= 3 && me == 6
      puts "必殺技！ 喰らえっ！"
      damage1 = ran_damage(me)
      damage1 = damage1 * 1.15
      damage1 = damage1.to_i
      enemy_hp -= damage1
      puts "★★★★★ あなたの攻撃 ★★★★★"
      genkidama
      kaishin(damage1)
      puts "ドカン！！\n敵に#{damage1}のダメージ！！！"
      show_hp(my_hp,enemy_hp,power,enemy_list[input - 1])
    end


#敵の自動回復
    if enemy_hp <= 6000 && enemy_senzu >= 1
        enemy = 4
    elsif enemy_hp >= 6000
        enemy = rand(1..3)
    end

#自分仙豆利用モーション
    if me == 4 && my_senzu >= 1
      my_senzu -= 1
      recovery = my_senzu_recovery
      my_hp += recovery
      puts "あなたはHP #{recovery}回復した！ 仙豆残り使用回数#{my_senzu}"
      show_hp(my_hp,enemy_hp,power,enemy_list[input - 1])
        elsif  my_senzu <= 0
          puts "仙豆がもうねぇ！！！"
          puts status
    end
#敵の仙豆利用モーション
    if enemy == 4 && enemy_senzu >= 1 && enemy_hp >= 0
      enemy_senzu -= 1
      recovery = enemy_senzu_recovery
      enemy_hp += recovery
      puts "敵はHP #{recovery}回復した！ 仙豆残り使用回数#{enemy_senzu}"
      show_hp(my_hp,enemy_hp,power,enemy_list[input - 1])
    elsif enemy_senzu <= 0
      puts "仙豆がもうねぇ！！！"
      puts status
    end

#じゃんけん本番

   #例外処理
    if me == 0 || me >= 7
      puts "技を出すんだ！よくわからない場合は下のリンクを参照してくれよな！"
      puts "(１〜３の間で入力しろって言ってんだろ！オメェぶっ殺すぞ！！！)"
      exit

  #あいこ処理
    elsif me == enemy
      puts line
      puts status
      puts "あいこで・・・・\nお互いにダメージ！！！"
      damage2 = ran_damage(enemy)
      my_hp -= damage2
      damage1 = ran_damage(me)
      enemy_hp -= damage1
      kaishin(damage1)
      kaishin(damage2)
      kaiouken
      puts "ドカン！！\n敵に#{damage1}のダメージ\nあなたに#{damage2}のダメージ！！！"
      show_hp(my_hp,enemy_hp,power,enemy_list[input - 1])
      puts line

#パー
    elsif me == 3 && enemy == 2
      puts line
      puts status
      damage2 = ran_damage(me)
      my_hp -= damage2
      puts "★★★★★ 敵の攻撃 ★★★★★"
      kaiouken
      kaishin(damage2)
      puts "ドカン！！\nあなたに#{damage2}のダメージ！！！"
      show_hp(my_hp,enemy_hp,power,enemy_list[input - 1])
      puts line

    elsif me == 3 && enemy ==1
      puts line
      puts status
      damage1 = ran_damage(me)
      enemy_hp -= damage1
      puts "★★★★★ あなたの攻撃 ★★★★★"
      genkidama
      kaishin(damage1)
      puts "ドカン！！\n敵に#{damage1}のダメージ！！！"
      show_hp(my_hp,enemy_hp,power,enemy_list[input - 1])
      puts line
#チョキ
    elsif me == 2 && enemy == 1
      puts line
      puts status
      damage2 = ran_damage(enemy)
      puts "★★★★★ 敵の攻撃 ★★★★★"
      kaiouken
      kaishin(damage2)
      puts "ドカン！！\nあなたに#{damage2}のダメージ！！！"
      my_hp -= damage2
      show_hp(my_hp,enemy_hp,power,enemy_list[input - 1])
      puts line

    elsif me == 2 && enemy == 3
      puts line
      puts status
      damage1 = ran_damage(me)
      enemy_hp -= damage1
      puts "★★★★★ あなたの攻撃 ★★★★★"
      kamehameha
      kaishin(damage1)
      puts "ドカン！！\n敵に#{damage1}のダメージ！！！"
      show_hp(my_hp,enemy_hp,power,enemy_list[input - 1])
      puts line
#グー
    elsif me == 1 && enemy == 2
      puts line
      puts status
      damage1 = ran_damage(me)
      enemy_hp -= damage1
      puts "★★★★★ あなたの攻撃 ★★★★★"
      kaiouken
      kaishin(damage1)
      puts "ドカン！！\n敵に#{damage1}のダメージ！！！"
      show_hp(my_hp,enemy_hp,power,enemy_list[input - 1])
      puts line

    elsif me == 1 && enemy == 3
      puts line
      puts status
      damage2 = ran_damage(me)
      puts "★★★★★ 敵の攻撃 ★★★★★"
      genkidama
      kaishin(damage2)
      puts "ドカン！！\nあなたに#{damage2}のダメージ！！！"
      my_hp -= damage2
      show_hp(my_hp,enemy_hp,power,enemy_list[input - 1])
      puts line
    end

#勝利判定
  if my_hp <= 0 && enemy_hp <= 0
    puts "同点だなぁ オメェやるな！"
    draw
    exit
  elsif my_hp <= 0
    puts lose
    losen
    exit
  elsif enemy_hp <= 0
    puts win
    winn
    puts line
    exit
  end
end
end


