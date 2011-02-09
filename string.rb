class String

  def to_num a
    if a =~ /\./
      a.to_f
    else
      a.to_i
    end
  end

  def split_sp
    array = self.split(" ")
    if array[-1] == "translate"
      array[0] = to_num(array[0])
      array[1] = to_num(array[1])
    elsif array[-1] ==  "rotate"
      array[0] = to_num(array[0])
    end
    array
  end

end
