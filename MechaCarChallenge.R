library(dplyr)
mecha <- read.csv(file="MechaCar_mpg.csv")
reg <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + AWD
          + ground_clearance, data = mecha)
summary(reg)

suspension <- read.csv(file="Suspension_Coil.csv")
total_summary <- suspension %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), Variance_PSI=var(PSI), SD_PSI=sd(PSI), .groups='keep')
total_summary

lot_summary <- suspension %>% group_by(Manufacturing_Lot) %>% summarize(Mean_PSI=mean(PSI), Median_PSI=median(PSI), Variance_PSI=var(PSI), SD_PSI=sd(PSI), .groups='keep')
lot_summary

global_sample <-suspension %>% sample_n(50)
t.test(global_sample$PSI, mu=mean(suspension$PSI))

lot1_sample <- suspension %>% subset(Manufacturing_Lot=="Lot1") %>% sample_n(25)
t.test(lot1_sample$PSI, mu= mean(suspension$PSI))

lot2_sample <- suspension %>% subset(Manufacturing_Lot=="Lot2") %>% sample_n(25)
t.test(lot2_sample$PSI, mu= mean(suspension$PSI))

lot3_sample <- suspension %>% subset(Manufacturing_Lot=="Lot3") %>% sample_n(25)
t.test(lot3_sample$PSI, mu= mean(suspension$PSI))
