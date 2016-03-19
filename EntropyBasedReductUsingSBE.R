reduct=function()
{
  dectab=read.csv("input.csv")   #file name to read data
  print("Decision System :")
  print(dectab)
  tA=ncol(dectab) #total number of attributes
  cA=tA-1         #conditioanl attribute
  oldentrp=entropy(tA,dectab) #calculate for entire conditional Atri Set
  print("Entropy Of All Cond Attrbiute Set:")
  print(oldentrp)
  reduct_set=c(1:cA)  #initial reduct set
  ent_redAtr=c(1:cA)  #to hold value of individual Cond attribute
  if(oldentrp==0) #DO tis only if initial entropy of all attribute is equal to 0
  {
    for(i in 1:cA)
    {
      reduct_set[i]=i #INITALIZATION OF INITIAL REDUCT SET
      ent_redAtr[i]=entropy(2,dectab[,c(i,tA)]) #Compute Entropy Of Individual Cond. Attribute
    }
    print("Entropy Of Individual Attribute::")
    print(ent_redAtr)
    print("Initial Reduct Set::")
    print(reduct_set)
    repeat #REDUCT COMPUTAION ALGORITHEM IMPLEMENTATION
    {
      val=which.max(ent_redAtr)
      print("Attribute Selected to remove::")
      print(val)
      T1=setdiff(reduct_set, val) #set excluding selected attribute
      tA1=length(T1)+1
      T2=union(T1,tA)
      dectab1=dectab[,T2]
      if(tA1>=2)
      {
        print("New Decision System::")
        print(cbind(dectab1))
        newEntopy=entropy(tA1,dectab1) #COMPUT ENTROPY OF NEW REDUCT SET
        print("Entropy::")
        print(newEntopy)
        if(newEntopy==0)
        {
          reduct_set=T1
          print("New Reduct Is:")
          print(reduct_set)
          ent_redAtr[val]=0   #change the entropy of selected attribute to 0
        }
        else
        {
          print("Imp Attribute for Reduct Can't Remove::")
          print(val)
          T1=union(reduct_set, val)  #add that attribute back to reduct Set
          break
        }
        s1=sum(ent_redAtr)
        if(s1==0)
        {
          print("All Remaning Attribute in Reduct Set have 0 Entropy Algo Stop:")
          print("Entropy Of Individual Attribute Of Current Reduct Set::")
          print(ent_redAtr[1:length(T1)])
          break
        }
      }
      else
      {
        print("Can't Remove This Attribute,Only 1 Cond Attribute left::")
        T1=union(reduct_set, val)
        break #when only one conditional attribute left 
      }
      reduct_set=T1
    }
    reduct_set=T1
    print("Final Reduct Is:")
    print(reduct_set)
  }
  else # when all cond attribute set entropy >0
  {
    print("No reduct for This Dec System,Initial Entropy of All Cond.Attribute >0::")
    print(oldentrp)
  }
}
