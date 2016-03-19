# RimplementaionOfEntropyFunction
entropy=function(dA,dsctab)
{
  cA=dA-1 #number of conditional attribute
  table1=cbind(dsctab[,-dA]) #to convert vactor into row
  uniqtable=unique(table1)  #Unique Object table of cond System
  m=0 # counter
  count2=0 #to find out probability of each element in 2nd fun
  manprob=0
  entp1=0
  for(n in 1:nrow(uniqtable))
  {
    count=0
    val1=uniqtable[n,] #selcet each unique object
    for(y in 1:nrow(table1))#loop to find out probability of individual unique object(p(aj))
    {
      val2=table1[y,] 
      if(all(val1==table1[y,]))# compare val1 with each object of cond table
      {
        count=count+1 #number of time val1 object repeate
      }
    }
    unique_ds=unique(dsctab[,dA]) #find out total number of decision
    sum1=0
    for(y in 1:length(unique_ds))  #to find out all values p(Ci/aj)logp(Ci/aj) for each unique aj
    {
      count2=0
      val3=unique_ds[y] # select one decision
      unio=merge(val1,val3) # combine dec value with selected unique object 
      for(m in 1:nrow(dsctab))
      {
        if(all(dsctab[m,]==unio))
        {
          count2=count2+1 #number of time that unique object with decision repeate in dec table
        }
      }
     if(count2!=0)
     {
       p2=(count2/count)*(log(count2/count)/log(2))#find prob value for that object
       sum1=sum1+p2 # add to privious dec attribute value
     }
    }
    entp1=entp1+(-((count/nrow(table1))*sum1)) #final entropy 
  }
  return(entp1)
}
