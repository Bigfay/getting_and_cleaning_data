This file will desccribe will 2 type of variables
1.column names of the output file
2.variables used in the script run_analysis.R

1.column names of the file : avgpersubjectperactivity.txt
- subject (person involved for that row)
- activity (activity like laying, standing, etc ...)
- measuretype (type of measure we are dealing with body acceleration via x,y, or z, etc ...)
- mean (calculated average grouped by the 3 previous fields)

2.variables used in the script run_analysis.R (in the order they appear)
-resultatdef = working data frame that will gather tidy data later
-activity = activity labels
-features = features.txt
-z = vector containing test and train to move through subfolders and files
-chemin = var for loop
-chemin1 = path built with the value chemin1 looping through z
-vtrain =vector containing paths got from the dir function used with chemin1 variable
-trainx = 0
-tnames =vector with measure type abody_acc ... body_gyro ...)
- train0 = var used and reused each time needed to collect the file name in use at that time
- train1 = train0 with file extension removed
- train = data.frame used to collect read files
- x= path to file prefixed with X_
- y= path to file prefixed with y_
- subject = var getting subjects "identities"
- resultat = is used to build the main tidy table
-a = is used to add column to the resultat table
-b = is used to add column to the resultat table
-bang=working variable used to store the result when not needed columns removed after standard deviation and mean are calculated
-avgpersubjectperactivity=tidy table with rows grouped by subject,activity, measuretype and average




