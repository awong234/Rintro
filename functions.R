summarizePois = function(mean, length_out, debug = F) { 
  
  if(debug){browser()}
  
  out = rpois(n = length_out, lambda = mean)
  
  outSummary = summary(out)
  
  outList = list("RandomNumbers" = out, 
                 "Summary" = outSummary)
  
  return(outList)
  
}