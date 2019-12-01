library(readxl)
library(dplyr)
library(tidyr)
library(ggplot2)

(evals = readxl::read_excel(path = 'evals.xlsx') )

(evals = evals %>% mutate_all(as.integer) )

evals_base = evals %>% select(Student:Topic_selection) %>% gather(key = Category, value = Rating, Pacing:Topic_selection) %>% mutate(Type = "Satisfaction")
evals_sec = evals %>% select(Student,Intro_section:BP_section) %>% gather(key = Category, value = Rating, Intro_section:BP_section) %>% mutate(Type = "Satisfaction")
evals_ret = evals %>% select(Student,Retention) %>% gather(key = Category, value = Rating, Retention) %>% mutate(Type = "Retention")

evals_data = rbind.data.frame(evals_base, evals_sec, evals_ret)

ggplot(evals_data) + 
  geom_point(aes(x = Type, y = Rating, color = Type), shape = 1, alpha = 0.7, position = position_jitter(width = 0.2)) + 
  ylim(c(0,10)) + 
  theme_bw() + 
  theme(axis.text.x = element_blank(),
        axis.title.x = element_blank())

Cairo::Cairo(width = 640, height = 640, file = 'evals_plot.png', dpi = 400)
ggplot(evals_data) +
  geom_boxplot(aes(x = Type, y = Rating), width = 0.2, outlier.shape = 1, outlier.alpha = 0.4) + 
  ylim(c(0,10)) + 
  theme_bw() + 
  theme(axis.title.x = element_blank(),
        panel.grid = element_blank(),
        axis.text.x = element_text(vjust = 0.5, angle = 45))
dev.off()
