
$ps.page :sample2, [700, 700] do

  $ps.line1 do
    $ps.line [0, 0], [100, 0], :black
  end

  $ps.rhombus do

    $ps.line1

    $ps.left 60
    $ps.line1

    $ps.back
    $ps.translate [100, 0]
    $ps.left 60
    $ps.line1

    $ps.translate [50, 0]
    $ps.left 120
    $ps.line1

    $ps.back
    $ps.translate [50, 0]
    $ps.left 120
    $ps.line1    

  end

  $ps.hexagon do
    3.times do |t|
      $ps.rhombus
      $ps.right 60
    end
  end

  $ps.move_right do
    $ps.translate [100, 0]
    $ps.right 60
    $ps.translate [100, 0]
    $ps.left 60
  end

  $ps.move_left do
    $ps.right 60
    $ps.translate [-100, 0]
    $ps.left 60
    $ps.translate [-100, 0]
  end

  $ps.move_up do
    $ps.right 30
    $ps.translate [0, 100]
    $ps.left 30
    $ps.translate [100, 0]
  end

  $ps.bgcolor :white

  $ps.translate [180, 120]
  $ps.left 30

  3.times do |t|
    $ps.hexagon
    $ps.move_right
  end
    
  3.times do |t|
    $ps.move_left
  end
  $ps.move_up

  2.times do |t|
    $ps.hexagon
    $ps.move_right
  end

  2.times do |t|
    $ps.move_left
  end
  $ps.move_up

  $ps.hexagon

end

$ps.preview :sample2
