module EffortsHelper
  def simple_num(num)
    if num.to_i == num
      num.to_i
    else
      num
    end
  end
end
