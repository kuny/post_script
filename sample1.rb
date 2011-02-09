require './post_script'

page :sample1, [700, 700] do

  bgcolor :red

  circle [350, 350], 310, :white, :fill
  arcn [350, 350], 300, [90, 270], :black, :fill

  circle [350, 500], 150, :white, :fill
  circle [350, 200], 150, :black, :fill

  circle [350, 500], 40, :black, :fill
  circle [350, 200], 40, :white, :fill

end

preview :sample1
