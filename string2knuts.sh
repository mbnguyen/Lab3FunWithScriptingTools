#!/bin/bash

echo "Printing the results"

awk '{
split($0, str, "/");
if (str[1] < 0) {
	str[2] *= -1;
	str[3] *= -1;
}
knuts = (str[1]*23 + str[2])*17 + str[3];
print knuts;
}' lab3data.txt > out1.txt

cat out1.txt

echo "Saved the outputs to a file named out1.txt"
echo "Please run ./knuts2string.sh"

