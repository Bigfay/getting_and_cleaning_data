run_analysis <-function(){
#load needed libraries
        library(stringr)
        library(dplyr)
        library(readr)

        #get activities
        resultatdef<-data.frame()
        activity<-readLines(con="activity_labels.txt",n=-1L)
        activity<-subset(str_split_fixed(activity," ",2),,-1)
        #get features
        features<-readLines(con="features.txt",n=-1L)
        features<-subset(str_split_fixed(features," ",2),,-1)
        z=c("test","train")
for (chemin in z){        
#gather all files and creates tables
 chemin1=paste0(".\\",chemin,"\\")
 vtrain<- dir (path=chemin1,recursive=TRUE)
 trainx=0
 tnames=c()
 for (i in vtrain){
        train0<-word(i,-1,sep="/") #seperate name of the file from the top subfolder
        train1<-str_sub(train0,1,str_length(train0)-4) #remove .txt from file name
        if(grepl("^(body|total)",train1)){
        tnames<-rbind(tnames,train1)
        }
    train<-read.csv(paste(chemin1,i,sep=""),header=FALSE,sep="",dec=".") #retrieve data
    #assign dynamically names to extracted files
    assign(train1,train)
 }
 x<-paste0("X_",chemin)
 y<-paste0("y_",chemin)
 subject<-(paste0("subject_",chemin))
x<-get(x)
y<-get(y)
subject<-get(subject)
 names(x)=features
 colnames(y)="c1"
 y<-y%>%mutate(activity=activity[c1])%>%select(activity)
 x<-cbind(y,x)
 colnames(subject)="subject"
 x<-cbind(subject,x)
 resultat<-data.frame() #add to body and total files the measure,subject and activity 
 for (b in tnames){
        a<-cbind(y,b)
        a<-cbind(a,get(b))
        a<-cbind(subject,a)
       assign(b,a)
       resultat<-rbind(resultat,a)
 }
 names(resultat)[names(resultat)=="b"] <- "measuretype"
 resultatdef<- rbind(resultatdef,resultat)
 #Calculating mean and standard deviation for each row
 bang<-resultatdef%>%mutate(mean=rowMeans(.[4:131]))%>%mutate(stdv=apply(resultatdef[,4:131],1,sd))%>%select(subject,activity,measuretype,mean,stdv)
 bang<-bang%>%mutate(activity=substring(activity,1))
}

#create from previous table a tidy table grouped by subject,activity, measuretype,and average
avgpersubjectperactivity<-bang%>%select(subject,activity,measuretype,mean)%>%group_by(subject,activity,measuretype)%>%summarise(mean=mean(mean))
write.table(avgpersubjectperactivity,file=".\\avgpersubjectperactivity.txt",row.name = FALSE)
        }