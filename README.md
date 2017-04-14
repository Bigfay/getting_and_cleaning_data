How the script works ...
1. Loading the needed libraries in this case (stringr,dplyr and readr)
2. Creation of an empty data.frame called resultatdef that will be filled later with results
3. Get activities labels
4. Get features
5. Creation of a vector containing the nature of datas to be collected (test and train(ing))
6. Vector above will help to find our way through subfolders and files navigation
7. Main "for loop" with condition "chemin in z" uses the vector above to treat first test and then training data
8. Loop into the main  with "i in vtrain" reshape file names and make them usable (remove extension, etc ...) to be computed
9. Extraction files with dynamic naming
10. Merge body files measure, subject and activity
11. As requested calculation of mean and standard deviation for each row
12. The result is saved in a working table called "bang"
13. From "bang" creation  of table "avgpersubjectperactivity"
14. That table is tidy grouping by subject,activities and measuretype the average
15. Creation of a txt file with the result using the function write.table with option row.names=FALSE

The End :-)
