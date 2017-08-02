who = "World"
input = commandArgs(trailingOnly = TRUE)

if(length(input))
    who = paste(input, collapse = " ")

message("Hello ", who, "!")