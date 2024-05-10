#!/bin/bash

# Check if the number of arguments is not equal to 2
if [ "$#" -ne 2 ]; then
    echo "Usage: ./gencsv.sh <start_index> <end_index>"
    exit 1
fi

# Extract start and end index from command line arguments
start_index=$1
end_index=$2

# Create a CSV file named inputFile
output_file="inputdata"
echo "Creating $output_file ..."

# Iterate over the range of indices and generate random numbers
for ((index=start_index; index<=end_index; index++)); do
    # Generate a random number between 0 and 999
    random_number=$((RANDOM % 1000))
    # Append the index and random number to the CSV file
    echo "$index, $random_number" >> "$output_file"
done

echo "File $output_file created successfully."

