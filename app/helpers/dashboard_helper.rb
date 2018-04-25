module DashboardHelper
    def friendJob_comission(price)
      case price
      when 50..100
        return price * 0.15
      when 101..150
        return price * 0.10
      when 151..175
        return price * 0.05
      when 176...200
        return price * 0.03
      else
        return price * 0.01
    end
  end

  def friendJob_total(price)
    p (friendJob_comission(price).to_i + price) * 100
  end
end
