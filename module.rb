def judge(hand)
  if hand == 1
    return "界王拳(グー)"
  elsif hand == 2
    return "かめはめ波(チョキ)"
  elsif hand == 3
    return "元気玉(パー)"
  elsif hand == 4
    return "仙豆：回復"
  elsif hand == 5
    return "気をためている！！！"
  end
end

def kakegoe(my_senzu,enemy_senzu,power)
  puts "行くぞ！！！...\n\n[1]:界王拳\n[2]:かめはめ波\n[3]元気玉\n[4]仙豆 使用残り回数:#{my_senzu}  敵の仙豆 残り:#{enemy_senzu}\n[5]必殺技:#{power}"
end

def show_hp(my_hp,enemy_hp,power,enemy_list)
  puts "■■■■■■■■■■■■■■■■■■■■■■"
  puts "あなたのHP：#{my_hp}"
  puts "#{enemy_list}のHP：#{enemy_hp}"
  puts "あなたの気：#{power}"
  puts "■■■■■■■■■■■■■■■■■■■■■■"
end

def show_enemy_list(enemy_list)
index = 1
  enemy_list.each do |enemys|
    puts"[#{index}]:#{enemys}"
  index += 1
  end
end

def ran_damage(me)
  me +=  me * rand(50..4000)
  me = me.to_i
  return me
end

def kaishin(www)
  if www >= 6000
    puts "会心の一撃！！！"
  end
end

def my_senzu_recovery
  recovery = rand(2..100) * rand(100..200)
  return recovery
end

def enemy_senzu_recovery
  recovery = rand(2..100) * rand(100..180)
  return recovery
end

def start
  puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
end

def tamewaza(power,swich_waza)
  if power >= 3
  swich_waza = "可能！！！"
  return swich_waza
else
  swich_waza = "不可！！！"
  return swich_waza
  end
end


