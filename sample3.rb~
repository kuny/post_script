
require './post_script'

page :sample3, [700, 700] do

  tetra0 do
    tetragon [-120, 0], [0, 120], [120, 0], [0, -120], :red
  end

  tetra1 do
    tetragon [-200, 0], [0, 200], [200, 0], [0, -200], :green
  end

  tetra2 do
    tetragon [-320, 0], [0, 320], [320, 0], [0, -320], :blue
  end

  bgcolor :black

  translate [350, 350]

  45.times do |t|
    tetra0
    right 4
  end

  45.times do |t|
    tetra1
    right 4
  end

  45.times do |t|
    tetra2
    right 4
  end

end

preview :sample3
