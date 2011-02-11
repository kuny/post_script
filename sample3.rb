
$ps.page :sample3, [700, 700] do

  $ps.tetra0 do
    $ps.tetragon [-120, 0], [0, 120], [120, 0], [0, -120], :red
  end

  $ps.tetra1 do
    $ps.tetragon [-200, 0], [0, 200], [200, 0], [0, -200], :green
  end

  $ps.tetra2 do
    $ps.tetragon [-320, 0], [0, 320], [320, 0], [0, -320], :blue
  end

  $ps.bgcolor :black

  $ps.translate [350, 350]

  45.times do |t|
    $ps.tetra0
    $ps.right 4
  end

  45.times do |t|
    $ps.tetra1
    $ps.right 4
  end

  45.times do |t|
    $ps.tetra2
    $ps.right 4
  end

end

$ps.preview :sample3
