Function Implemented:-
Two functions are implemented named as
1.reduct()
2.entropy()
1.reduct():-
This function compute the reduct set based on the Sequential Backward
Elimination.
Initially we consider entire set of conditional attribute as reduct set and compute
the entropy for that set with respect to decision attribute by calling entropy()
function. We called this entropy value as “oldentrp” in our reduct function, and
if “oldentrp>0” we simply print that “unable to find out reduct because initialentropy is greater then 0”.
when “oldentrp==0” then we enter into the loop to perform actual reduct
computation where we first compute the entropy for each individual attribute(to
decide which attribute to be selected first to remove from initial reduct set i.e from all
conditional set). and store it into array of attrbiute where index represent attribute
ent_redAtr[i].
We remove the attribute having higest entropy value among all conditional attribute
and then we again find out the entropy of new reduct set(T1) .
if “newEntopy==0” then we continue this process (repeat) until we have number of
conditional attribute greater then or equal to 1(total attribute 2 ,one conditional
and one decission ) or “newEntopy==0” .
in each iteration at the end if that attribute is successful removed from reduct set we
make that attribute entropy equal to 0 in ent_redAtr[i] so that we can select next
attribute having highest attribute from remaining.
when “total attribute(tA)<2” or “newEntopy>0” we break the loop and come out
side the loop.Note:-
finding out the entropy of individual attribute and removing highest entropy attribute
from reduct set saves lot of computation time.
2.entropy() :-
Take two arguments 1 st total number of attributes(tA1) and 2 nd dec
system(dectab1) for which we want to compute the entropy.
In this function table1= cbind(dsctab[,-dA]) is use to convert the vacter into row
wise when onle single attribute left in condtional attribute set and -dA is used to
exclude the decsion attribute from D.S to create onlt conditioanl attribute sysetm.
“uniquetable” is conditional attribute table with unique object entry for this
unique(table1) function is used.
“val1” or (aj) one object of unique cond attribute table i.e object of “uniquetable”.
“val2” object of normal conditioanl attribute table. Then compare val1 and val2 to
find out how many time val1 repeated in cond attribute table to find out probability of
(aj). And increase the counter (count) if both are same.And then we find out Sumation of P(ci/aj)log(p(ci/aj)).
Where “unique_ds” is vactor of unique decison attribute.
“sum1” is used to hold the sum of all values from (1 to m) for each decision w.r.t. aj
“val3” is selected unique object(aj)+ selected Decision
and for each val3 we find out number of time that will occure in decision system and
increas the counter if match is found.then we compute p2{Sumation of P(ci/aj)log(p(ci/aj)).}
and add it to sum1.
Then add this sum1 value to the variable entp1 which is used to store the entropy
value
repeate this for all unique object of cond attribute table and finaly return the entropy
value(entp1).
Results:-
Following is the results of the given decision system in the paper ( Chapter 3 Rough
Set -Based Feature Selection:A review by Richard Jensen)
In our example dataset, EBR first evaluates the entropy of initial reduct set
{A1,A2,A3,A4},
Entropy
{A1,A2,A3,A4}= 0
if initial reduct set entropy==0, Then calculate entropy for each individual attribute:
Entropy
{A1} 1.1887219
{A2} 0.75
{A3} 0.9387219
{A4} 0.75
The Attribute with higest entropy here is {A1}. The algorithm selects attribute {A1}
to remove from Initial reduct set {A1,A2,A3,A4}, So set become{A2,A3,A4} then
calculate entropy for this subset:
Entropy
{A2,A3,A4}=0
Hence new reduct become {A2,A3,A4}.
Again select the attribute (from {A2,A3,A4}) having higest entropy and that is {A3},
The algorithm selects attribute {A3} to remove from current reduct set{A2,A3,A4},
So subset become{A2,A4} then calculate entropy for this subset:
Entropy
{A2,A4}=0
Hence new reduct become {A2,A4}.
Again select the attribute (from {A2,A4}) having higest entropy Here both A2 and
A4 have same entropy 0.75, So algorithm selects attribute {A2} to remove from
current reduct set{A2,A4}, So subset become{A4} then calculate entropy for this
subset:
Entropy
{A4}>0Stopping criterion has been met, add A2 back to the reduct set and return final Reduct
as {A2,A4} as this value equals the entropy for the entire feature set (H(D|{A2,A4})
= 0 = H(D|C)). The algorithm terminates and returns this feature subset; the dataset
can now be reduced to these features only. As the resulting entropy is zero, the
returned subset is a rough set reduct.
