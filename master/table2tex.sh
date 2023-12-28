#!/bin/bash
#
# here we count the ampersands to determine how the tabular-tag in latex should look like
count_ampersands(){
infile=$1
count=0
tab="|l|"
#
# to make sure tabular has the correct number of columns, even if the table is faulty
# (faulty as in "in one line we forgot an ampersand, dammit!"), we only take in aspect
# the line which contains the most ampersands
#
lines=`cat $infile | wc -l`
for i in `seq $lines`; do
count_new=`cat $infile | sed -n $i,1p | sed s/[^\&]//g | wc -m`
let "count_new-=1"
if [ $count_new -gt $count ]; then
count=$count_new
fi
done
#
# with the number in our ampersand-counter we take the 'tab' variable from above
# and concat as many 'c|' to it as our counter tells us to
for j in `seq $count`; do
tab=$tab"c|"
done
echo "\begin{tabular}{$tab}"
}
#
# here is the main-part: we convert semicola to ampersands with spaces and line-endings to \\ \hline
# then we create a file with the correct table header, the table content and the footer
for FILE in $1; do
newname=`echo $FILE | sed s/csv/tex/`
cat $FILE | sed s/\;/' \& '/g | sed s/.$/'\\\\ \\hline'/g > ./foo
#
echo "\begin{table}
\centering" > $newname
count_ampersands ./foo >> $newname
echo "\hline " >> $newname
cat ./foo >> $newname
echo " \end{tabular}
\caption{My_Caption}
\label{My_Label}
\end{table}" >> $newname
done
