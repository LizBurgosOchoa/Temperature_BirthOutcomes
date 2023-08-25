
#--------------------------#
#    Read weather data
#--------------------------#


Monitors_1 <- read.table("M_209_270_r.txt", header = TRUE, sep= ",",colClasses = "character", strip.white = TRUE, na.strings = "") # strip.white = REMOVE WHITE SPACE, na.string set NA in empty spaces
Monitors_2 <- read.table("M_273_310_r.txt", header = TRUE, sep= ",",colClasses = "character", strip.white = TRUE, na.strings = "") # strip.white = REMOVE WHITE SPACE, na.string set NA in empty spaces
Monitors_3 <- read.table("M_311_331_r.txt", header = TRUE, sep= ",",colClasses = "character", strip.white = TRUE, na.strings = "") # strip.white = REMOVE WHITE SPACE, na.string set NA in empty spaces
Monitors_4 <- read.table("M_340_391_r.txt", header = TRUE, sep= ",",colClasses = "character", strip.white = TRUE, na.strings = "") # strip.white = REMOVE WHITE SPACE, na.string set NA in empty spaces

# Combine datasets 
WeatherData <- rbind(Monitors_1, Monitors_2, Monitors_3, Monitors_4)


#---------------------------------------#
#    Data manipulation  
#---------------------------------------#

# Separate temperature and other weather characteristics.
TemperatureData <- WeatherData %>% dplyr::select(., -FG, -SQ, -RH, -UG) # Keep temperature only TX, TG, TN
WeerData <- WeatherData %>% dplyr::select(., STN, YYYYMMDD,  FG, SQ, RH, UG) # Keep FG=wind, UG=humidity, SQ=sun, RH=precipitation


#--- Temperature data ---#

# Create temperature variables that are in Celsius instead of 0.1 Celsius. 
TemperatureData <- TemperatureData %>%  
  mutate_at(vars(-c("STN", "YYYYMMDD")), list(~as.numeric(.))) %>% mutate(MTemp1 = TG/10, MinTemp1 = TN/10, MaxTemp1 = TX/10)

# Turn  date variable into date vector.
TemperatureData <- TemperatureData %>% mutate(Date1 = as.Date(YYYYMMDD, format = "%Y%m%d")) 



#--- Weather data ---#

# Create weather variables in normal scale of 0.1. 
WeerData <- WeerData %>%  
  mutate_at(vars(-c("STN", "YYYYMMDD")), list(~as.numeric(.))) %>% mutate(Wind1 = FG/10, Humidity1 = UG, Precipt1 = RH/10, SunHours1 = SQ/10)

# Turn  date variable into date vector.
WeerData <- WeerData %>% mutate(Date1 = as.Date(YYYYMMDD, format = "%Y%m%d")) 
NumRecords_w <- WeerData %>% group_by(STN) %>% summarise(NumRecords= sum(STN==STN))


#-------------------------------------#
# Save weather and temperature files
#-------------------------------------#
save(TemperatureData, WeerData,file="~/Working from home/Heat/Heat/temperatureWeather_R.RData")

