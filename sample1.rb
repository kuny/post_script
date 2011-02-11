
$ps.page :sample1, [700, 700] do

  $ps.bgcolor :red

  $ps.circle [350, 350], 310, :white, :fill
  $ps.arcn [350, 350], 300, [90, 270], :black, :fill

  $ps.circle [350, 500], 150, :white, :fill
  $ps.circle [350, 200], 150, :black, :fill

  $ps.circle [350, 500], 40, :black, :fill
  $ps.circle [350, 200], 40, :white, :fill

end

$ps.preview :sample1
