##-- Library ----
library(dplyr)
library(dbplyr)
library(data.table)
library(reshape2)
library(tidyr)
library(lubridate)
library(shiny)
library(shinydashboard)
library(shinyWidgets)
library(shinycssloaders)
library(ggthemes)
library(RColorBrewer)
library(scales)
library(plotly)
library(highcharter)
library(DT)

source("functions/utils.R")
cores <- c("#098ebb", "#008000", "#e96449", "#818286")

load("data/data.Rdata")

tab_files <- list.files(path = "tabs", full.names = T, recursive = T)
tab_files <- tab_files[-grep(x = tab_files, pattern = "server")]

suppressMessages(lapply(tab_files, source))