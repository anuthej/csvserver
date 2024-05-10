# csvserver

## Commands:
- **Clone repository to machine and cd into the solution and perform all the steps from that directory**

- **Docker images pull command:**
```
docker pull infracloudio/csvserver:latest
docker pull prom/prometheus:v2.22.0
```

```
- docker images
REPOSITORY               TAG       IMAGE ID       CREATED        SIZE
infracloudio/csvserver   latest    8cb989ef80b5   2 months ago   237MB
prom/prometheus          v2.22.0   7adf5a25557b   7 months ago   168MB
```

- **Bash script gencsv.sh**

-> cat gencsv.sh
```
#!/bin/bash

# Check if the number of arguments is not equal to 2
if [ "$#" -ne 2 ]; then
    echo "Usage: ./gencsv.sh <start_index> <end_index>"
    exit 1
fi

start_index=$1
end_index=$2

output_file="inputdata"
echo "Creating $output_file ..."


for ((index=start_index; index<=end_index; index++)); do
    random_number=$((RANDOM % 1000))
    echo "$index, $random_number" >> "$output_file"
done

echo "File $output_file created successfully."
```
- **Bash script output:**

-> cat inputdata
```
2, 562
3, 46
4, 473
5, 550
6, 318
7, 846
8, 608
```
- **Docker run command:**
```
docker run -d --name csvserver -e CSVSERVER_BORDER='Orange' -v ${PWD}/inputdata:/csvserver/inputdata -p 9393:9300 infracloudio/csvserver
```