library(bannerCommenter)
banner("Script name: Comparison only Title vs. Full Text kleine Anfragen Saarland AfD ",
       "Idea of Script:",
       "Start Date: Feb 18 2022", 
       "last modification: Feb 18 2022 ",
       "version: 1.0",
       emph = TRUE)

# Libraries
library(pdftools)
library(quanteda)
library(quanteda.textplots)
library(quanteda.textstats)
library(popdictR)
library(tidyverse)


# Fulltext AfD Saarland ---------------------------------------------------



afd_Saarland <- pdf_text("Sammelmappe_AfD_Saarland.pdf")
linke_Saarland <- pdf_text ("Sammelmappe_Linke_Saarland.pdf")

# tokenization

afd_Saarland_tokenize <- tokenize_word(afd_Saarland)
afd_Saarland_token <- as.tokens(afd_Saarland_tokenize)

remove_words_afd <- tokens_select(afd_Saarland_token, c("Anfrage","drucksache","afd","Landtag des Saarlandes", "Abgeordneten","betr", "Wahlperiode", "Ausgegeben","bitte wenden"), selection = "remove")
remove_word_numbers_afd <- stringi::stri_replace_all_regex(remove_words_afd, "\\d", "") # remove all numbers
afd_dfm <- dfm(remove_word_numbers_afd) # change to dfm formate

textplot_wordcloud(afd_dfm)

afd_char <- as.character(afd_Saarland_tokenize) # as character

saarland_afd_popu <- run_popdict(afd_char)
sum(saarland_afd_popu$dict_gruendl_2020)

##############################################################################################################################

# ## Fulltext die Linke Saarland ------------------------------------------


# Linke Saarland

linke_Saarland <- pdf_text ("Sammelmappe_Linke_Saarland.pdf")


linke_Saarland_tokenize <- tokenize_word(linke_Saarland)
linke_Saarland_token <- as.tokens(linke_Saarland_tokenize)

remove_words_linke <- tokens_select(linke_Saarland_token, c("Anfrage","drucksache","die linke","Landtag des Saarlandes", "Abgeordneten","betr", "Wahlperiode", "Ausgegeben","bitte wenden"), selection = "remove")
remove_word_numbers_linke <- stringi::stri_replace_all_regex(remove_words_linke, "\\d", "") # remove all numbers
linke_dfm <- dfm(remove_word_numbers_linke) # change to dfm formate

textplot_wordcloud(linke_dfm)

linke_char <- as.character(linke_Saarland_tokenize) # as character

saarland_linke_popu <- run_popdict(linke_char)
sum(saarland_linke_popu$dict_gruendl_2020)


# ## Titel AfD Saarland ---------------------------------------------------

afd_Saarland_title <- pdf_text("Titel Anfrage AfD Saarland WP16.pdf")


# tokenization

afd_Saarland_title_tokenize <- tokenize_word(afd_Saarland_title)

afd_Saarland_titel_token <- as.tokens(afd_Saarland_title_tokenize)

remove_words_titel_afd <- tokens_select(afd_Saarland_titel_token, c("Anfrage","drucksache","afd","Landtag des Saarlandes", "Abgeordneten","betr", "Wahlperiode", "Ausgegeben","bitte wenden"), selection = "remove")
remove_words_titel_numbbers_afd <- stringi::stri_replace_all_regex(remove_words_afd, "\\d", "") # remove all numbers
afd_dfm_titel <- dfm(remove_words_titel_numbbers_afd) # change to dfm formate

textplot_wordcloud(afd_dfm_titel)

afd_char <- as.character(afd_Saarland_title_tokenize) # as character

saarland_afd_popu <- run_popdict(afd_char)
sum(saarland_afd_popu$dict_gruendl_2020)



# Titel die Linke Saarland ------------------------------------------------

linke_Saarland_title <- pdf_text("Titel Anfragen die Linke Saarland WP16.pdf")


# tokenization

linke_Saarland_title_tokenize <- tokenize_word(linke_Saarland_title)

linke_Saarland_titel_token <- as.tokens(linke_Saarland_title_tokenize)

remove_words_titel_linke <- tokens_select(linke_Saarland_titel_token, c("Anfrage","drucksache","afd","Landtag des Saarlandes", "Abgeordneten","betr", "Wahlperiode", "Ausgegeben","bitte wenden"), selection = "remove")
remove_words_titel_numbbers_linke <- stringi::stri_replace_all_regex(remove_words_linke, "\\d", "") # remove all numbers
dfm_linke_titel <- dfm(remove_words_titel_numbbers_linke) # change to dfm formate

textplot_wordcloud(dfm_linke_titel)

linke_char <- as.character(linke_Saarland_title_tokenize) # as character

saarland_linke_popu <- run_popdict(linke_char)
sum(saarland_linke_popu$dict_gruendl_2020)



