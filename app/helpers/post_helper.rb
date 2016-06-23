# Methods to base helper of the post instances
module PostHelper
  def show_shares(shares, social_network)
    if shares[social_network]
      shares[social_network].uniq.count
    else
      0
    end
  end
end
