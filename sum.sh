#!/bin/bash

echo "Print the sum of out1.txt"

awk 'BEGIN{
sum = 0;
}
{
sum += $0;
}
END {
print sum
}' out1.txt

echo "Print the sum of out2.txt"

awk 'BEGIN{
sum1 = sum2 = sum3 = 0;
}
{
split($0, str, "/");
sum1 += str[1];
sum2 += str[2];
sum3 += str[3];
}
END {
printf ("%d/%d/%d\n", sum1, sum2, sum3);
}' out2.txt
