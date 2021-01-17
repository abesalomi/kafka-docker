#!/bin/bash
input="default-server.properties"
while IFS= read -r line
do
  echo $(eval echo ${line})
done < "$input"
