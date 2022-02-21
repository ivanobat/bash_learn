#!/bin/bash

# 1. execute your script download.sh

./download.sh

# 2. output from download.sh should be a compressed file called
#    data.tar.gz
#  - decompress the data.tar.gz file 

tar -xvf data.tar.gz data & wait $!

# 3. combine all the files in the "data" folder into a big file,
# - file that combines all of them should be named "results"

cd data

for f in $(ls)
do    
    echo $f
    #tail -30 $f > "file.tmp" && mv "file.tmp" $f
    tail -n -30 $f >> results.csv
    #cat $f >> results.csv
    echo "" >> results.csv
    # - remove the header row from each file,
    #   and add only the first 30 rows from it
    #   there are multiple ways to do this
    # - in each iteration you will add output to the "results" file
   
done
 cd ..

# 4. we will use only the first 2 columns from the "results" file 
# - filter the "results" file with only the first 2 columns
#   the end result should look as follows:
#   
#   27-Oct-16,115.39
#   26-Oct-16,114.31
#   and so on
# 
# - name the resulting file "resultsFinal" and place in the same folder 
#   as pipeline.sh 

awk -F',' '{print $1,$2}' OFS=',' data/results.csv > resultsFinal.csv
rm data/results.csv
# 5. we will now produce some figures with R, using the data produced above, 
#    note you will need to have ggplot2 package installed
#    in R execute following: install.packages("ggplot2")

tickers=$( ls data | sed 's/\.csv$//' )
echo $tickers
Rscript genFigure.R $tickers

# - finally, clean the iterim files, delete data folder, compressed 
#   data folder and results file

rm -rf data
rm resultsFinal.csv


