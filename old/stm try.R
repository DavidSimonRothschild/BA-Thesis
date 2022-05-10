library(bannerCommenter)
banner("Script name: stm package ",
       "Idea of Script:",
       "Start Date: Feb 24 2022", 
       "last modification: Feb 25 2022 ",
       "version: 0.1",
       emph = TRUE)

library(stm)
library(tidyverse)
library(quanteda)
library(tidytext)
library(tm)
library(Matrix)

# import text
library(pdftools) # to import pdf files

afd_Saarland <- pdf_text("Sammelmappe_AfD_Saarland.pdf")
linke_Saarland <- pdf_text ("Sammelmappe_Linke_Saarland.pdf")


as <- textProcessor(afd_Saarland) # textProcessor AfD
vs <- VectorSource(as)
vc <- VCorpus(vs)

afd_corp <- corpus(afd_Saarland)

afd_dfm <- dfm(afd_corp)
# afd_stm <- asSTMCorpus(afd_dfm)

model2 <- stm(rw, K=10, verbose = TRUE)

summary(model2)

word_topics <- tidy(model2, matrix = "beta")
word_topics

word_topics %>%
  group_by(topic) %>%
  slice_max(beta, n = 2) %>%
  ungroup() %>%
  mutate(topic = paste("Topic", topic)) %>%
  ggplot(aes(beta, reorder_within(term, beta, topic), fill = topic)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(vars(topic), scales = "free_y") +
  scale_x_continuous(expand = c(0, 0)) +
  scale_y_reordered() +
  labs(x = expression(beta), y = NULL)


