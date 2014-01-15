class NationalAverage < ActiveRecord::Base
  #method that fetches the appropriate national average (p50 for corresponding agemos and gender)
  def z_score(x)
    if self.l == 0
      (((x/self.m)**self.l)-1)/(self.l * self.s)
    else self.l != 0
      return Math.log(x/self.m)/self.s
    end
  end

  #use distribution gem to calculate percentile.
  def percentile(x)
    return (Distribution::Normal.cdf(self.z_score(x))*100).round
  end
end


#            ((X/M)**L) - 1
# Z = -------------------------, L≠0
#                LS
# or
# Z = ln(X/M)/S ,L=0
