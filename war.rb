class War
    attr_reader :name, :hitpoint, :attack_damage

    def initialize(name,hitpoint,attack_damage)
        @name = name
        @hitpoint = hitpoint
        @attack_damage = attack_damage
    end

    def attack(enemy,dodge,attack_order,randomNum)
        puts "#{@name} attack #{enemy.name} with #{@attack_damage} damage"
        if dodge == false
            enemy.take_damage(@attack_damage)
        else
            if attack_order == randomNum
                enemy.take_damage(0)
                puts "#{enemy.name} has a dodge"
            else
                enemy.take_damage(@attack_damage)
            end 
        end
    end

    def take_damage(damage)
        @hitpoint -= damage
        puts self
    end

    def to_s
        return "#{@name} has #{@hitpoint} left"
    end

    def til_die
        if @hitpoint <= 0
            # puts "#{@name} is die"
            true
        end
    end
end

jin = War.new("Jin Sakai",100,50)
khotun = War.new("Khotun",500,50)

count_attack_to_jin = (jin.hitpoint / khotun.attack_damage.to_f).ceil
dodge = (80.to_f / 100 * count_attack_to_jin).to_i
attacked = count_attack_to_jin - dodge

random_num = rand(1..count_attack_to_jin)
dodge = true
i = 1
o = 1
loop do
    jin.attack(khotun,dodge=false,i,0)
    puts "\n"
    i+=1
    break if khotun.til_die

    khotun.attack(jin,dodge=true,o,random_num)
    puts "\n"
    o+=1
    break if jin.til_die
end

if jin.til_die
    puts "#{jin.name} is die"
else
    puts "#{khotun.name} is die"
end