library(factoextra)
library(dplyr)


dec_frame <- (decathlon2[1:10]
	%>% rename_all(sub, pattern="^X", replacement="Run_")
	%>% mutate_at(vars(contains('Run_')), funs(-.))
	%>% rename_all(sub, pattern="110m.", replacement="")
	%>% mutate_all(scale)
)

dec_mat <- as.matrix(dec_frame)
pca_ath <- prcomp(dec_mat, scale=TRUE)

pca_ath$sdev
pca_ath$rotation

pca_ath$sdev*pca_ath$rotation
pca_ath$sdev%*%pca_ath$rotation
