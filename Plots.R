?ggplot
library(ggplot2)
pisadaten <- read.csv2("C:\\Users\\David\\OneDrive\\Desktop\\R\\PISA_Daten.csv")
pisadaten$Lesekompetenz <- as.numeric(pisadaten$Lesekompetenz)
ggplot(pisadaten, aes(x = SES, y = Lesekompetenz))
ggplot(pisadaten, aes(x = SES, y = Lesekompetenz))+geom_point()
ggplot(pisadaten, aes(x = SES, y = Lesekompetenz))+geom_point()+geom_smooth(method = "lm", se=F, color = 2)
ggplot(pisadaten, aes(x = SES, y = Lesekompetenz))+geom_point()+geom_smooth(method = "lm", se=F, color = 2)+theme_bw() #zeichnet hintergrund weiss
ggplot(pisadaten, aes(x = SES, y = Lesekompetenz))+geom_point()+geom_smooth(method = "lm", se=F, color = 2)+theme_bw()+xlab("sozio-ökonomischer Status")
ggplot(pisadaten, aes(x = SES, y = Lesekompetenz))+xlab("sozio-ökonomischer Status")+geom_smooth(method = "lm", se=F, color = 2)+geom_point()+theme_bw() #reihenfolge geändert


#Barplot
ggplot(pisadaten, aes(x = SES, y = ))+geom_bar()
ggplot(pisadaten, aes(x = SES))+geom_bar(color="blue", fill= "green")#colours
ggplot(pisadaten, aes(x = SES))+geom_bar(fill= "green", color="blue")#colours

ggplot(pisadaten, aes(x = as.factor(Sprache), fill=as.factor(Sprache) ))+geom_bar()+scale_fill_brewer(palette = "Set0") 
ggplot(pisadaten, aes(x = as.factor(Sprache), fill=as.factor(Sprache) ))+geom_bar()+scale_fill_hue(c=40) #matt
ggplot(pisadaten, aes(x = as.factor(Sprache), fill=as.factor(Sprache) ))+geom_bar()+scale_fill_brewer(palette = "Set9")+coord_flip()

ggplot(Therapiestudie, aes(y = Anzahl2, x = FBehandlung))+geom_bar(stat = "summary", fun = "mean", color="blue", fill= "green") #summary weil nicht alle rohdaten sondern zusammengefasst, fun=function(man möchte mean)
ggplot(Therapiestudie, aes(y = Anzahl2, x = FBehandlung))+geom_bar(stat = "summary", fun = "mean", color="blue", fill= "green")+theme_bw() + coord_flip() +theme(axis.text.y = element_text(angle = 45,vjust = c(0.6))) +  xlab("Behandlungsform") +  ylab("Mittlere Anzahl Essanfälle zum Zeitpunkt 2")

#Lineplot
ggplot(Therapiestudie, aes(y = Anzahl2, x = Abschluss))+geom_line(stat = "summary", fun = "mean")


#hexplot:
ggplot(pisadaten, aes(x = SES, y = Lesekompetenz))+geom_point()+theme_bw()+xlab("sozio-ökonomischer Status")+geom_hex(bins=15)
ggplot(pisadaten, aes(x = SES, y = Lesekompetenz))+geom_point()+xlab("sozio-ökonomischer Status")+geom_hex(bins=10)+scale_fill_continuous(type = "viridis")

#histogram
ggplot(Therapiestudie, aes(x = Anzahl1))+geom_histogram()
ggplot(Therapiestudie, aes(x = Anzahl1))+geom_histogram(binwidth = 2, colour = "black", fill = "magenta") + ylab("Haeufigkeit (absolut)") +   theme_bw()

#Extra plots am Rand
library(ggExtra)
p <- ggplot(pisadaten, aes(x = SES, y = Lesekompetenz))+geom_point() #grundplot
ggMarginal(p, type="histogram")
ggMarginal(p, type="density")
ggMarginal(p, type="boxplot")

ptherapiestudie <- ggplot(Therapiestudie, aes(x = Anzahl1, y = Anzahl2))+geom_point()
ggMarginal(ptherapiestudie, type = "histogram")
ggMarginal(ptherapiestudie, type = "density")


#Bubble plot
library(ggplot2)
library(dplyr)
library(gapminder)
ggplot(pisadaten, aes(x = SES, y = Lesekompetenz, size= Alter))+geom_point()+geom_smooth(method = "lm", se=F, color = 2)+theme_bw()+xlab("sozio-ökonomischer Status")+scale_size(range = c(.001, 2), name="Alter")




