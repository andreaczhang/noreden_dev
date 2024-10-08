# nutrients for norkost 4

library(readxl)
library(data.table)
library(ggplot2)

# no supplement, with supplement
d_nosup <- read_excel("~/Documents/Data/uio_norkost/norkost_2408_nosup.xlsx", sheet = "sheet1")
d_wsup <- read_excel("~/Documents/Data/uio_norkost/norkost_2408_wsup.xlsx", sheet = "sheet1")

d_nosup <- data.table(d_nosup)
d_wsup <- data.table(d_wsup)

# two datasets are not substantially different
# supplements are only for certain subjects (those who take supp)

colnames(d_nosup)
colnames(d_wsup)

# drop some variables marked red in nosup 
# do the same for sup

dn <- d_nosup[, c(1:5, 21:57)]
colnames(d_nosup) 
colnames(dn) # 38 variables (excl. demographics)

dw <- d_wsup[, c(1:5, 21:57)]
colnames(dw) # 38 variables (excl. demographics)

# rename ----
# demographics
setnames(dn, old = 'Løpedag', new = 'round')
setnames(dn, old = 'Kjønn', new = 'sex')
setnames(dn, old = 'Alder_v_første_kont', new = 'age')
setnames(dw, old = 'Løpedag', new = 'round')
setnames(dw, old = 'Kjønn', new = 'sex')
setnames(dw, old = 'Alder_v_første_kont', new = 'age')


# set sex: 1 male 2 female
dn[sex == 1, sexc := 'male']
dn[sex == 2, sexc := 'female']
dw[sex == 1, sexc := 'male']
dw[sex == 2, sexc := 'female']



# save ----

write.csv(dn, file = '~/Documents/Data/uio_norkost/nutrient_nosup_spade.csv')
write.csv(dw, file = '~/Documents/Data/uio_norkost/nutrient_wsup_spade.csv')


# _______ -----
# 2024.9.25 ----
# analysis for four new variables

d <- read_excel("~/Documents/Data/uio_norkost/nutrients_2409.xlsx")
head(d)

d <- data.table(d)
colnames(d)

setnames(d, old = 'Løpedag', new = 'round')
setnames(d, old = 'Kjønn', new = 'sex')
setnames(d, old = 'Tilsatt sukker med tilskudd', new = 'tilsatt_sukker_med_tilskudd')
setnames(d, old = 'Fritt sukker med tilskudd', new = 'fritt_sukker_med_tilskudd')
setnames(d, old = 'Tilsatt sukker uten tilskudd', new = 'tilsatt_sukker_uten_tilskudd')
setnames(d, old = 'Fritt sukker uten tilskudd', new = 'fritt_sukker_uten_tilskudd')
setnames(d, old = 'Kobber med tilskudd', new = 'kobber_med_tilskudd')


write.csv(d, file = '~/Documents/Data/uio_norkost/nutrient_2409.csv')












