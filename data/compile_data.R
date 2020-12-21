library(genius)
library(tidytext)
library(tidyr)
library(dplyr)

# Beatles
albums <- c("Sgt. Pepper's Lonely Hearts Club Band", "Revolver",
            "Rubber Soul", "The Beatles (The White Album)", "Abbey Road")

btls <- lapply(albums, function(x) cbind(genius_album(artist = "The Beatles",
                                                      album = x, 
                                                       info= "simple"),
                                         album = x)) %>%
        bind_rows(., .id = "column_label") 

# Beyonce
albums <- c("Dangerously in Love", "B'Day", "I Am... Sasha Fierce",
            "4", "Beyonce", "Lemonade")

bync <- lapply(albums, function(x) cbind(genius_album(artist = "Beyonce",
                                                      album = x, 
                                                      info= "simple"),
                                         album = x)) %>%
        bind_rows(., .id = "column_label") 

# Taylor Swift
albums <- c("Fearless", "Red", "1989",
            "Reputation", "Lover", "Folklore")

tylr <- lapply(albums, function(x) cbind(genius_album(artist = "Taylor Swift",
                                                      album = x, 
                                                      info= "simple"),
                                         album = x)) %>%
        bind_rows(., .id = "column_label") 

# Queen 
albums <- c("A Night At The Opera", "Queen", "Sheer Heart Attack",
            "Jazz", "A Day At The Races")

quen <- lapply(albums, function(x) cbind(genius_album(artist = "Queen",
                                                      album = x, 
                                                      info= "simple"),
                                         album = x)) %>%
        bind_rows(., .id = "column_label") 

# Drake
albums <- c("Take Care", "Nothing Was The Same", "Scorpion",
            "Views", "If You're Reading This It's Too Late")

drke <- lapply(albums, function(x) cbind(genius_album(artist = "Drake",
                                                      album = x, 
                                                      info= "simple"),
                                         album = x)) 

# Ariana Grande
albums <- c("Yours Truly", "My Everything", "Dangerous Woman",
            "Sweetener", "Thank U, Next", "Positions")

arig <- lapply(albums, function(x) cbind(genius_album(artist = "Ariana Grande",
                                                      album = x, 
                                                      info= "simple"),
                                         album = x)) %>%
       bind_rows(., .id = "column_label") 

# Clean up
clean_lyrics <- function(df, fileprefix){
   df_word <- df %>% 
    unnest_tokens(word, lyric,
                  token = "ngrams", n = 1) %>%
    anti_join(stop_words, 
              by = c("word" = "word")) %>%
     group_by(track_title, word, album) %>%
     tally()
   write.table(df_word, 
               file=paste0(fileprefix, "_lyrics.txt"), row.names = FALSE, quote = FALSE, sep = "\t")
   return(paste0("created file: ", fileprefix, "_lyrics.txt"))
}

# Create edge tables
clean_edges <- function(df, fileprefix){
  df_word <- df %>% 
    unnest_tokens(word, lyric,
                  token = "ngrams", n = 1) %>%
    anti_join(stop_words, 
              by = c("word" = "word")) %>%
    group_by(track_title, word, album) %>%
    tally() %>%
    group_by(word) %>%
    expand(track_title, to = track_title) %>% 
    filter(track_title < to) %>% 
    select(from = track_title, to, value = word)
  write.table(df_word, 
              file=paste0(fileprefix, "_edges.txt"), row.names = FALSE, quote = FALSE, sep = "\t")
  return(paste0("created file: ", fileprefix, "_edges.txt"))
}

clean_lyrics(arig, "arianagrande")
clean_lyrics(btls, "thebeatles")
clean_lyrics(bync, "beyonce")
clean_lyrics(drke, "drake")
clean_lyrics(quen, "queen")
clean_lyrics(tylr, "taylorswift")

clean_edges(arig, "arianagrande")
clean_edges(btls, "thebeatles")
clean_edges(bync, "beyonce")
clean_edges(drke, "drake")
clean_edges(quen, "queen")
clean_edges(tylr, "taylorswift")
