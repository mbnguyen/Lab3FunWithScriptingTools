#!/bin/bash

echo "Getting the data from out1.txt and printing the result:"

awk '{
sign = ""
galleons = int($0/(23*17));
rem = $0 % (23*17);
if (galleons < 0) {
	sign = "-";
	galleons *= -1;
	rem *= -1;
}
sickles = int(rem / 17);
knuts = rem % 17;
result = sign galleons "/" sickles "/" knuts;
print result;
}' out1.txt > out2.txt

cat out2.txt

echo "Saved the outputs to a file named out2.txt"
echo "Please run ./sum.sh"
