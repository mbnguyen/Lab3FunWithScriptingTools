#!/bin/bash

######################################
# Question 1
echo ""
echo "Question 1"

# Running the command and storing the ouput to variable STR
echo "Running command grep -v '^ATOM\|^CONECT\|^HETATM\|^TER\|^END' 4HKD.pdb"
STR="$(grep -v '^ATOM\|^CONECT\|^HETATM\|^TER\|^END' 4HKD.pdb)"

# Saving the outputs to a file named 'question1.txt'
echo "Saving the outputs to file question1.txt"
echo -e "$STR" > question1.txt

######################################
# Question 2
echo ""
echo "Question 2"

# Running the command and storing the ouput to a temporary file
echo "Running command sed 's/HETATM/ATOM  /g' 4HKD.pdb > temp"
sed 's/HETATM/ATOM  /g' 4HKD.pdb > temp

# Running the command on the temporary file and storing the ouput to variable STR
echo "Running command sed 's/MSE/MET/g' temp"
STR="$(sed 's/MSE/MET/g' temp)"

# Remove the temporary file
echo "Removing temp"
rm temp

# Saving the output to a file named 'question2.txt'
echo "Saving the outputs to file question2.txt"
echo -e "$STR" > question2.txt

######################################
# Question 3
echo ""
echo "Question 3"

# Calculate the max and min and store the output to a file named question3.txt
echo "Calculate the max and min and store the output to a file named question3.txt"
awk '
BEGIN {
	firstRun = 0
}  
$1 == "ATOM" {
	print $0
	if (firstRun == 0) {
		minX = maxX = $7
        	minY = maxY = $8
        	minZ = maxZ = $9
		firstRun = 1
	}
        if (minX > $7) minX = $7
        if (maxX < $7) maxX = $7
        if (minY > $8) minY = $8
        if (maxY < $8) maxY = $8
        if (minZ > $9) minZ = $9
        if (maxZ < $9) maxZ = $9
}
END {
	printf "\nThe result:\n"
        printf "X: min = %f\tmax = %f\n", minX,	maxX
        printf "Y: min = %f\tmax = %f\n", minY, maxY
        printf "Z: min = %f\tmax = %f\n", minZ, maxZ 
}' 4HKD.pdb > question3.txt

######################################
# Question 4
echo ""
echo "Question 4"

# Calculate the mean and store the output to a file named question4.txt
echo "Calculate the mean and store the output to a file named question4.txt"
awk '
BEGIN {
       	sumX = sumY = sumZ = 0
	count = 0
}
$1 == "HETATM" {
	print $0
	count += 1
	sumX += $7
	sumY += $8
	sumZ += $9
}
END {
	meanX = sumX / count
	meanY = sumY / count
	meanZ = sumZ / count
     	printf "\nThe result:\n"
        printf "X: mean: %f\n", meanX
        printf "Y: mean: %f\n", meanY
        printf "Z: mean: %f\n", meanZ
}' 4HKD.pdb > question4.txt

######################################
# Question 5
echo ""
echo "Question 5"

# Running the command and store the output to a file named question5.txt
echo "Running the command sed 's/HOH/WAT/g' 4HKD.pdb > question5.txt"
sed 's/HOH/WAT/g' 4HKD.pdb > question5.txt

######################################
# Question 6
echo ""
echo "Question 6"

# Get the list of ATOMs and store it to a temporary file
echo "Get the list of ATOMs and store it to a temporary file"
echo "Command: awk '/ATOM/ {print}' 4HKD.pdb > temp"
awk '$1 == "ATOM" {print}' 4HKD.pdb > temp

# Sort the temporary file by 11th col and store the output to a file named question6.txt
echo "Running the command sort -nk11 temp > question6.txt"
sort -nk11 temp > question6.txt

# Remove the temporary file
echo "Removing the temporary file"
rm temp

echo ""
echo ""
