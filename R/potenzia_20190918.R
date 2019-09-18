##########################################################
##########################################################
##########################################################
##########################################################
##########################################################
# Data:              2019 09 18
# Egilea:
# Deskribapena:      Entrenamiento basado en potencia 
# 
# R bertsioa:
# R version 3.4.2 (2017-09-28)
# Platform: x86_64-pc-linux-gnu (64-bit)
# Running under: Ubuntu 16.04 LTS
#########################################################
#########################################################
#########################################################

# Load packages ------------------------------------------
library(ggplot2)
library(akima)
library(viridis)
library(ggthemes)

# Housekeeping ------------------------------------------- 
getwd()
setwd('/media/josetxu/Seagate Expansion Drive/Segurtasun_2016_20160516/2020/potentzia/R')
list.files()
rm(list=ls())

# Data ---------------------------------------------------
datuak <- expand.grid(rel=seq(1.85,6.40,0.1),
                      weight=seq(50,100,0.5))
datuak$power=datuak$weight*datuak$rel
#head(datuak)

# Plot it ------------------------------------------------
# potenzia_I_20190918.pdf
ggplot(datuak) +
  aes(x=weight,y=rel,z=power, fill=power) +
  geom_tile() +
  stat_contour(color="red",size=1,breaks = c(200))+
  stat_contour(color="white",size=1,breaks = c(300,400,500,600))+
  stat_contour(color="yellow",size=1,breaks = c((200/75)*56))+
  #  stat_contour(color="white",breaks = c(200,400))+
  #  stat_contour(color="white",bins = 36) +
  scale_fill_viridis() +
  # geom_hline(aes(yintercept=200/75),linetype='dotted',colour='white')+
  geom_vline(aes(xintercept=75),linetype='dotted',colour='yellow')+
  geom_vline(aes(xintercept=56),linetype='dotted',colour='yellow')+
  geom_hline(aes(yintercept=2.40),linetype='dotted',colour='white')+
  geom_hline(aes(yintercept=2.93),linetype='dotted',colour='white')+    
  geom_hline(aes(yintercept=3.47),linetype='dotted',colour='white')+
  geom_hline(aes(yintercept=4.09),linetype='dotted',colour='white')+
  geom_hline(aes(yintercept=4.62),linetype='dotted',colour='white')+    
  geom_hline(aes(yintercept=5.15),linetype='dotted',colour='white')+
  geom_hline(aes(yintercept=5.69),linetype='dotted',colour='white')+
  geom_hline(aes(yintercept=200/75),colour='yellow')+
  scale_x_continuous(name='weight (kg)',
                     breaks = seq(50,100,5)) + 
  scale_y_continuous(name='relative power (w/kg)',
                     breaks = seq(1.80,6.40,0.4))+
  annotate("text",label="FAIR",x=85,y=2.6,size=6,colour="black",fontface = "bold")+
  annotate("text",label="MODERATE",x=85,y=3.2,size=6,colour="black",
           fontface = "bold")+
  annotate("text",label="GOOD",x=85,y=3.78,size=6,colour="black",
           fontface = "bold")+
  annotate("text",label="VERY GOOD",x=85,y=4.355,size=6,colour="black",
           fontface = "bold")+
  annotate("text",label="EXCELLENT",x=85,y=4.885,size=6,colour="black",
           fontface = "bold")+
  annotate("text",label="EXCEPTIONAL",x=85,y=5.42,size=6,colour="black",
           fontface = "bold")+
  annotate("text",label="WORLD CLASS",x=85,y=6.045,size=6,colour="black",
           fontface = "bold")

#ggsave('potentzia_I_20190918.pdf', plot = last_plot(),
#       device = 'pdf',
#       path = '/media/josetxu/Seagate Expansion Drive/Segurtasun_2016_20160516/2020/potentzia/tex/fig',
#       scale = 1, width = 5.42, height = 6.04, units = c("in", "cm", "mm"),
#       dpi = 300, limitsize = TRUE)

# potenzia_II_20190918.pdf (detalle)

ggplot(datuak) +
  aes(x=weight,y=rel,z=power, fill=power) +
  geom_tile() +
  stat_contour(color="red",size=1,breaks = c(200))+
  stat_contour(color="white",size=1,breaks = c(300,400,500,600))+
  stat_contour(color="yellow",size=1,breaks = c((200/75)*56))+
#  stat_contour(color="white",breaks = c(200,400))+
#  stat_contour(color="white",bins = 36) +
  scale_fill_viridis() +
# geom_hline(aes(yintercept=200/75),linetype='dotted',colour='white')+
  geom_vline(aes(xintercept=75),linetype='dotted',colour='yellow')+
  geom_vline(aes(xintercept=56),linetype='dotted',colour='yellow')+
  geom_hline(aes(yintercept=2.40),linetype='dotted',colour='white')+
  geom_hline(aes(yintercept=2.93),linetype='dotted',colour='white')+    
  geom_hline(aes(yintercept=3.47),linetype='dotted',colour='white')+
  geom_hline(aes(yintercept=4.09),linetype='dotted',colour='white')+
  geom_hline(aes(yintercept=4.62),linetype='dotted',colour='white')+    
  geom_hline(aes(yintercept=5.15),linetype='dotted',colour='white')+
  geom_hline(aes(yintercept=5.69),linetype='dotted',colour='white')+
  geom_hline(aes(yintercept=200/75),colour='yellow')+
  scale_x_continuous(name='weight (kg)',
                     breaks = seq(50,100,5)) + 
  scale_y_continuous(name='relative power (w/kg)',
                     breaks = seq(1.80,6.40,0.4))+
  annotate("text",label="FAIR",x=85,y=2.6,size=6,colour="black",fontface = "bold")+
  annotate("text",label="MODERATE",x=85,y=3.2,size=6,colour="black",
           fontface = "bold")+
  annotate("text",label="GOOD",x=85,y=3.78,size=6,colour="black",
           fontface = "bold")+
  annotate("text",label="VERY GOOD",x=85,y=4.355,size=6,colour="black",
           fontface = "bold")+
  annotate("text",label="EXCELLENT",x=85,y=4.885,size=6,colour="black",
           fontface = "bold")+
  annotate("text",label="EXCEPTIONAL",x=85,y=5.42,size=6,colour="black",
           fontface = "bold")+
  annotate("text",label="WORLD CLASS",x=85,y=6.045,size=6,colour="black",
           fontface = "bold")+
  coord_cartesian(ylim = c(2.35,3.0))+
  theme_tufte(base_family="Helvetica")+
  theme(legend.position='none')+
  scale_y_continuous(name='relative power (w/kg)',
                     breaks = seq(2.35,3.00,0.05))

#ggsave('potentzia_II_20190918.pdf', plot = last_plot(),
#       device = 'pdf',
#       path = '/media/josetxu/Seagate Expansion Drive/Segurtasun_2016_20160516/2020/potentzia/tex/fig',
#       scale = 1, width = 5.42, height = 6.04, units = c("in", "cm", "mm"),
#       dpi = 300, limitsize = TRUE)









