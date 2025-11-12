## This code was meant to show relationship between the FC of patients with aphasia (PWA) and 
## controls during 5 language processing tasks: langloc, langlisten, movie, story and rest. 

library(ggplot2)


# Load the data
control_langloc <- list.files("control_langloc", pattern = "*.csv", full.names = TRUE)
control_langlisten <- list.files("control_langlisten", pattern = "*.csv", full.names = TRUE)
control_movie <- list.files("control_movie", pattern = "*.csv", full.names = TRUE)
control_rest <- list.files("control_rest", pattern = "*.csv", full.names = TRUE)
control_story <- list.files("control_story", pattern = "*.csv", full.names = TRUE)
pwa_langloc <- list.files("pwa_langloc", pattern = "*.csv", full.names = TRUE)
pwa_langlisten <- list.files("pwa_langlisten", pattern = "*.csv", full.names = TRUE)
pwa_movie <- list.files("pwa_movie", pattern = "*.csv", full.names = TRUE)
pwa_rest <- list.files("pwa_rest", pattern = "*.csv", full.names = TRUE)
pwa_story <- list.files("pwa_story", pattern = "*.csv", full.names = TRUE)

control_langloc_list <- lapply(control_langloc, function(file) {
  read.csv(file, header = FALSE)  # header = FALSE means no header row
  })
control_langlisten_list <- lapply(control_langlisten, function(file) {
  read.csv(file, header = FALSE)  # header = FALSE means no header row
  })
control_movie_list <- lapply(control_movie, function(file) {
  read.csv(file, header = FALSE)  # header = FALSE means no header row
  })
control_rest_list <- lapply(control_rest, function(file) {
  read.csv(file, header = FALSE)  # header = FALSE means no header row
  })
control_story_list <- lapply(control_story, function(file) {
  read.csv(file, header = FALSE)  # header = FALSE means no header row
  })
pwa_langloc_list <- lapply(pwa_langloc, function(file) {
  read.csv(file, header = FALSE)  # header = FALSE means no header row
  })
pwa_langlisten_list <- lapply(pwa_langlisten, function(file) {
  read.csv(file, header = FALSE)  # header = FALSE means no header row
  })
pwa_movie_list <- lapply(pwa_movie, function(file) {
  read.csv(file, header = FALSE)  # header = FALSE means no header row
  })
pwa_rest_list <- lapply(pwa_rest, function(file) {
  read.csv(file, header = FALSE)  # header = FALSE means no header row
  })
pwa_story_list <- lapply(pwa_story, function(file) {
  read.csv(file, header = FALSE)  # header = FALSE means no header row
  })


# Keep the original file names
names(control_langloc_list) <- basename(control_langloc)
names(control_langlisten_list) <- basename(control_langlisten)
names(control_movie_list) <- basename(control_movie)
names(control_rest_list) <- basename(control_rest)
names(control_story_list) <- basename(control_story)
names(pwa_langloc_list) <- basename(pwa_langloc)
names(pwa_langlisten_list) <- basename(pwa_langlisten)
names(pwa_movie_list) <- basename(pwa_movie)
names(pwa_rest_list) <- basename(pwa_rest)
names(pwa_story_list) <- basename(pwa_story)


# Replace NaN with 1
control_langloc_list <- lapply(control_langloc_list, function(df) {
  df[] <- lapply(df, function(col) {
    col[is.nan(col)] <- 1  # Replace NaN with 1 in each column
    return(col)
  })
  return(df)
})
control_langlisten_list <- lapply(control_langlisten_list, function(df) {
  df[] <- lapply(df, function(col) {
    col[is.nan(col)] <- 1  # Replace NaN with 1 in each column
    return(col)
  })
  return(df)
})
control_movie_list <- lapply(control_movie_list, function(df) {
  df[] <- lapply(df, function(col) {
    col[is.nan(col)] <- 1  # Replace NaN with 1 in each column
    return(col)
  })
  return(df)
})
control_rest_list <- lapply(control_rest_list, function(df) {
  df[] <- lapply(df, function(col) {
    col[is.nan(col)] <- 1  # Replace NaN with 1 in each column
    return(col)
  })
  return(df)
})
control_story_list <- lapply(control_story_list, function(df) {
  df[] <- lapply(df, function(col) {
    col[is.nan(col)] <- 1  # Replace NaN with 1 in each column
    return(col)
  })
  return(df)
})
pwa_langloc_list <- lapply(pwa_langloc_list, function(df) {
  df[] <- lapply(df, function(col) {
    col[is.nan(col)] <- 1  # Replace NaN with 1 in each column
    return(col)
  })
  return(df)
})
pwa_langlisten_list <- lapply(pwa_langlisten_list, function(df) {
  df[] <- lapply(df, function(col) {
    col[is.nan(col)] <- 1  # Replace NaN with 1 in each column
    return(col)
  })
  return(df)
})
pwa_movie_list <- lapply(pwa_movie_list, function(df) {
  df[] <- lapply(df, function(col) {
    col[is.nan(col)] <- 1  # Replace NaN with 1 in each column
    return(col)
  })
  return(df)
})
pwa_rest_list <- lapply(pwa_rest_list, function(df) {
  df[] <- lapply(df, function(col) {
    col[is.nan(col)] <- 1  # Replace NaN with 1 in each column
    return(col)
  })
  return(df)
})
pwa_story_list <- lapply(pwa_story_list, function(df) {
  df[] <- lapply(df, function(col) {
    col[is.nan(col)] <- 1  # Replace NaN with 1 in each column
    return(col)
  })
  return(df)
})


# Compute the average of all values in each data frame (the whole brain average)
control_langloc_wb_averages <- lapply(control_langloc_list, function(df) {
  mean(as.numeric(unlist(df)), na.rm = TRUE)
})
control_langlisten_wb_averages <- lapply(control_langlisten_list, function(df) {
  mean(as.numeric(unlist(df)), na.rm = TRUE)
})
control_movie_wb_averages <- lapply(control_movie_list, function(df) {
  mean(as.numeric(unlist(df)), na.rm = TRUE)
})
control_rest_wb_averages <- lapply(control_rest_list, function(df) {
  mean(as.numeric(unlist(df)), na.rm = TRUE)
})
control_story_wb_averages <- lapply(control_story_list, function(df) {
  mean(as.numeric(unlist(df)), na.rm = TRUE)
})
pwa_langloc_wb_averages <- lapply(pwa_langloc_list, function(df) {
  mean(as.numeric(unlist(df)), na.rm = TRUE)
})
pwa_langlisten_wb_averages <- lapply(pwa_langlisten_list, function(df) {
  mean(as.numeric(unlist(df)), na.rm = TRUE)
})
pwa_movie_wb_averages <- lapply(pwa_movie_list, function(df) {
  mean(as.numeric(unlist(df)), na.rm = TRUE)
})
pwa_rest_wb_averages <- lapply(pwa_rest_list, function(df) {
  mean(as.numeric(unlist(df)), na.rm = TRUE)
})
pwa_story_wb_averages <- lapply(pwa_story_list, function(df) {
  mean(as.numeric(unlist(df)), na.rm = TRUE)
})


# Make dataframes for wholebrain averages
control_langloc_wb <- unlist(lapply(control_langloc_wb_averages, function(df) {
  as.numeric(unlist(df))
}))
control_langlisten_wb <- unlist(lapply(control_langlisten_wb_averages, function(df) {
  as.numeric(unlist(df))
}))
control_movie_wb <- unlist(lapply(control_movie_wb_averages, function(df) {
  as.numeric(unlist(df))
}))
control_rest_wb <- unlist(lapply(control_rest_wb_averages, function(df) {
  as.numeric(unlist(df))
}))
control_story_wb <- unlist(lapply(control_story_wb_averages, function(df) {
  as.numeric(unlist(df))
}))
pwa_langloc_wb <- unlist(lapply(pwa_langloc_wb_averages, function(df) {
  as.numeric(unlist(df))
}))
pwa_langlisten_wb <- unlist(lapply(pwa_langlisten_wb_averages, function(df) {
  as.numeric(unlist(df))
}))
pwa_movie_wb <- unlist(lapply(pwa_movie_wb_averages, function(df) {
  as.numeric(unlist(df))
}))
pwa_rest_wb <- unlist(lapply(pwa_rest_wb_averages, function(df) {
  as.numeric(unlist(df))
}))
pwa_story_wb <- unlist(lapply(pwa_story_wb_averages, function(df) {
  as.numeric(unlist(df))
}))

control <- rep("Control", 180)
pwa <- rep("PWA", 160)
group <- c(control,pwa)

control_langloc <- rep("langloc", 36)
control_langlisten <- rep("langlisten", 36)
control_movie <- rep("movie", 36)
control_rest <- rep("rest", 36)
control_story <- rep("story", 36)
pwa_langloc <- rep("langloc", 32)
pwa_langlisten <- rep("langlisten", 32)
pwa_movie <- rep("movie", 32)
pwa_rest <- rep("rest", 32)
pwa_story <- rep("story", 32)
task <- c(control_langloc,control_langlisten,control_movie,control_rest,control_story,
          pwa_langloc,pwa_langlisten,pwa_movie,pwa_rest,pwa_story)

wholebrain_fc <- c(control_langloc_wb,control_langlisten_wb,control_movie_wb,control_rest_wb,
                   control_story_wb,pwa_langloc_wb,pwa_langlisten_wb,pwa_movie_wb,pwa_rest_wb,
                   pwa_story_wb)

wholebrain <- data.frame(wholebrain_fc,task,group)


# Run whole brain models
wholebrain$task <- factor(wholebrain$task, ordered = FALSE)
wholebrain$task <- relevel(wholebrain$task, ref = "langloc") 

wholebrain_lm <- lm(formula = wholebrain_fc ~ group * task, data = wholebrain)
summary(wholebrain_lm)


# Plot the data
ggplot(wholebrain, aes(task, wholebrain_fc)) +
  geom_boxplot(aes(fill = group)) +
  ylim(0,2) +
  labs(x = 'Task', y = 'Average FC', title = 'Whole Brain Average FC') +
  scale_x_discrete(labels = c(langloc = 'Vis. Struct. Language', 
                                langlisten = 'Aud. Struct. Language', 
                                movie = 'Movie Watching', rest = 'Resting State',
                                story = 'Story Listening')) +
  theme_bw() + theme(axis.text.x = element_text(angle = 30, hjust = .9))