
##  R Commands:

####  Load multiple CVS at once

```
files = list.files(pattern="*.csv")
```

**Splitng the csv file**
```
names <- as.data.frame(files) %>%
	separate(files, into=c("names", "ext"), sep= "[.]")
```

**loading the csv into a list**

```
ls = list(NULL)
for (i in 1:length(files)){
	x <- read.csv(files[i], as.is=T)
	x$IDs <- rep(names$names[i], nrow(x))
	ls[[i]] = x
}
ls[[1]]
```

**rbind the # samples to creat the Master_table**
```
new_file <- rbind.fill(ls)
```
------------------------------------------------------------------------------------
**write a list as csv**

```
lapply(list, function(x) write.table( data.frame(x),
	'list_out.csv' , append= T, sep=',' ))`
```

[Style guide R](http://adv-r.had.co.nz/Style.html)
[Advance Functions](http://adv-r.had.co.nz/Functions.html)
[Environments](http://adv-r.had.co.nz/Environments.html)
<!--stackedit_data:
eyJoaXN0b3J5IjpbLTgwOTU0Mzc2OCwtMTg0ODM5Njg5XX0=
-->