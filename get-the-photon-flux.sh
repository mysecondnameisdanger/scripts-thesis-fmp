#!/bin/bash
#

# Declare path variables
FLUX="/home/murphy/doc/dose/experimental_parameters/Flux"
RAW="/home/murphy/raw"

cd ${RAW}

# The flux is stored in the diffraction pattern
for i in $(find -name "b*.cbf" | sort -n)
do
  flux=$(bzgrep -a Flux ${i})
  echo ${i} ${flux} >> flux-raw.dat
done

# Clean the raw data file
sed -e s'+./++' \
    -e s'+/+ +g' flux-raw.dat > tmp

mv tmp flux-cln.dat

# Get a summary
awk '{print "," $1", " $2", ", $6}' flux-cln.dat | uniq -c > flux-sum.csv

# Move the files
mv flux-* ${FLUX}

echo "Done"
