require 'yaml'
require './numeric'
require './string'

class Object

  X = 0
  Y = 1

  @__file = nil

  def path=(path)
    @__path = path
  end

  def putz (a)
    if @__file
      @__file.puts a
    end
  end

  def page(fileName, pageSize, &block)

    begin

      @__colorName = YAML.load_file('./colors.yml')

      @__file = nil
      @__size = []
      @__history = []

      @__file = File.open("./#{fileName.to_s}.ps", "w")
      @__size = pageSize
      putz("<< /PageSize [ #{@__size[X].to_s} #{@__size[Y].to_s} ] >> setpagedevice")
      gsave
      block.call
      showpage
      gstore
    ensure
      @__file.close
    end

  end

  def method_missing(name, *args, &block)
    if block
      putz "/#{name.to_s} {"
        block.call
      putz "} def"
    else
      if args.length == 0
        putz name.to_s
      end
    end
  end

  def moveto(point)
    putz "#{point[X].to_s} #{point[Y].to_s} moveto"
  end

  def lineto(point)
    putz "#{point[X].to_s} #{point[Y].to_s} lineto"
  end

  def line(point0, point1, *colorName)
    newpath
    moveto point0
    lineto point1
    if colorName.length == 0
      setcolor :black
    else
      setcolor colorName[0]
    end
    stroke
  end

  def setgray(color)
    putz "#{color.to_s} setgray"
  end

  def setrgbcolor(color)
    putz "#{color[0].to_s} #{color[1].to_s} #{color[2].to_s} setrgbcolor"
  end

  def setcmykcolor(color)
    putz "#{color[0].to_s} #{color[1].to_s} #{color[2].to_s} #{color[3].to_s} setcmykcolor"
  end

  def tetragon(point0, point1, point2, point3, *option)
    newpath
    moveto point0
    lineto point1
    lineto point2
    lineto point3
    lineto point0
    closepath

     if option.length == 0
      setcolor :black
      stroke
    elsif option.length > 0
      setcolor option[0]
      unless option.length == 2
        stroke
      else
        putz option[1].to_s
      end
    end


  end

  def circle(center, radius, *option)
    putz "#{center[X].to_s} #{center[Y].to_s} #{radius.to_s} 0 360 arc"

    if option.length == 0
      setcolor :black
      stroke
    elsif option.length > 0
      setcolor option[0]
      unless option.length == 2
        stroke
      else
        putz option[1].to_s
      end
    end
    
  end

  def arc(center, radius, angle, *option)
    putz "#{center[X].to_s} #{center[Y].to_s} #{radius.to_s} #{angle[0].to_s} #{angle[1].to_s} arc"

    if option.length == 0
      setcolor :black
      stroke
    elsif option.length > 0
      setcolor option[0]
      unless option.length == 2
        stroke
      else
        putz option[1].to_s
      end
    end
    
  end

  def arcn(center, radius, angle, *option)
    putz "#{center[X].to_s} #{center[Y].to_s} #{radius.to_s} #{angle[0].to_s} #{angle[1].to_s} arcn"
    if option.length == 0
      setcolor :black
      stroke
    elsif option.length > 0
      setcolor option[0]
      unless option.length == 2
        stroke
      else
        putz option[1].to_s
      end
    end    
  end

  def bgcolor(colorName)

    newpath
    moveto [0, 0]
    lineto [@__size[0], 0]
    lineto [@__size[0], @__size[1]]
    lineto [0, @__size[1]]
    lineto [0, 0]
    closepath
    setcolor colorName
    fill

  end

  def setcolor(color)

    if color.class == Symbol
      if @__colorName.has_key?(color.to_s)
        setrgbcolor @__colorName[color.to_s]
      end
    elsif color.class == Array
      if color.length == 3
        setrgbcolor color
      elsif color.length == 4
        setcmykcolor color
      end
    elsif color.class == Fixnum || color.class == Float
      setgray color
    end
  end

  def rotate(angle)
    @__history.push "#{angle.to_s} rotate"
    putz @__history[-1]
  end

  alias :left :rotate

  def right(angle)
    rotate angle.minus
  end

  def translate(point)
    @__history.push "#{point[X].to_s} #{point[Y].to_s} translate"
    putz @__history[-1]
  end

  def back
    if @__history.length > 0
      array = @__history.delete_at(-1).split_sp

      if array[-1] == "translate"
        putz "#{array[0].minus.to_s} #{array[1].minus.to_s} translate"
      else
        putz "#{array[0].minus.to_s} rotate"
      end
    end
  end

  def preview(name)
    system("gs -sDEVICE=x11alpha #{@__path}#{name.to_s}.ps")
  end

  def to_gif(name, size)
    system("gs -q -dNOPAUSE -dBATCH -sDEVICE=ppm -sOutputFile=- -r#{size[0].to_s}x#{size[1].to_s} #{name.to_s}.ps | ppmtogif >#{name.to_s}.gif")
  end

  def mark
    line [-300, 0], [300, 0], :blue
    line [300, 0], [295, 5], :blue
    line [300, 0], [295, -5], :blue

    line [0, -300], [0, 300], :green
    line [0, 300], [5, 295], :green
    line [0, 300], [-5, 295], :green

    circle [0, 0], 10, :red
    circle [0, 0], 5, :red, :fill
  end

end
