library(bannerCommenter)
banner("Script name: AfD NRW",
       "Idea of Script: Analysis kleine Anfragen NRW- AfD from 2017",
       "Start Date: Feb 12 2022", 
       "last modification: Feb12 2022 ",
       "version: 1.0 ",
       emph = TRUE)


# library:

library(pdftools)
library(qpdf)
library(tokenizers)

nrw_afd <- pdf_text("NRW ab 2017 AfD.pdf")

# Build tokens for text analysis

nrw_afd_token <- tokenize_sentences(nrw_afd)
word_count_nrw_afd <- count_words(nrw_afd) # word count

nrw_afd_token_ger <- get_tokens(nrw1_to, language = "German")
nrw_afd_token_punct <- remove_punctuation(dtm) # remove punctuation

# Analysis with popdictR library
library(popdictR)



