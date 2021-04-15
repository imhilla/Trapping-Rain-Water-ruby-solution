def trap(height)
  return 0 if height.empty?
  sum = [0]
  nexth = height.index(height.max)
  leftarr =  height[...nexth]
  rightarr = height[nexth+1...]
  recursiveleft(leftarr, nexth, sum)
  recursiveright(rightarr, sum)
  sum[0]
end
def recursiveleft(leftarr, index, sum)
  unless leftarr.empty?
      newlefth = leftarr.max
      lenindex = leftarr.index(newlefth)
      len = (index - lenindex) -1
      leftarea = newlefth * len
      blackarea = (leftarr[lenindex+1...index]).inject { |sum1, n| sum1 + n } || 0
      waterarea = leftarea - blackarea
      sum[0] += waterarea

      nexth = leftarr.index(newlefth)
      leftarr =  leftarr[...nexth]
      recursiveleft(leftarr, nexth, sum)
  end
end

def recursiveright(rightarr, sum)
  unless rightarr.empty?
      rightlenindex = rightarr.index(rightarr.max)
      lenright = rightlenindex
      rightarea = lenright * rightarr.max
      rightblackarea = (rightarr[0...rightlenindex]).inject { |sum2, n| sum2 + n } || 0
      rightwaterarea = rightarea - rightblackarea
      sum[0] += rightwaterarea

      nexth = rightarr.index(rightarr.max)
      rightarr = rightarr[nexth+1...]
      recursiveright(rightarr, sum)
  end

end