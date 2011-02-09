require './post_script'

page :sample2, [700, 700] do

  line1 do
    line [0, 0], [100, 0], :black
  end

  rhombus do

    line1

    left 60
    line1

    back
    translate [100, 0]
    left 60
    line1

    translate [50, 0]
    left 120
    line1

    back
    translate [50, 0]
    left 120
    line1    

  end

  hexagon do
    3.times do |t|
      rhombus
      right 60
    end
  end

  move_right do
    translate [100, 0]
    right 60
    translate [100, 0]
    left 60
  end

  move_left do
    right 60
    translate [-100, 0]
    left 60
    translate [-100, 0]
  end

  move_up do
    right 30
    translate [0, 100]
    left 30
    translate [100, 0]
  end

  bgcolor :white

  translate [180, 120]
  left 30

  3.times do |t|
    hexagon
    move_right
  end
    
  3.times do |t|
    move_left
  end
  move_up

  2.times do |t|
    hexagon
    move_right
  end

  2.times do |t|
    move_left
  end
  move_up

  hexagon

end

preview :sample2
