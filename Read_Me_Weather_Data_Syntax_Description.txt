Weather Datasets and Scripts

Below you can find the description of the weather-related datasets and Scripts used in the project.


Dataset name: GM_geocode_dist_weer.csv 
Description: Dataset with information about the distance in KM between each Municipailty in the Netherlands and each KNMI weather monitor (wind, sunshine, humidity monitors/ temperature monitors in a separate dataset).	
Information about KNMI monitor location and daily weather information is openly available at https://daggegevens.knmi.nl/klimatologie/daggegevens  	
	
Variable name --- > Explanation
Gemeente2020 --- > Municipality number as registered in CBS Open Data (leading zeroes were removed), see https://www.cbs.nl/nl-nl/onze-diensten/methoden/classificaties/overig/gemeentelijke-indelingen-per-jaar/indeling-per-jaar/gemeentelijke-indeling-op-1-januari-2020
Gemeentenaam2020 --- > Municipality name
text_to_geocode	--- > Text used to get latitude and longitude in R via sp package.
lat --- > Latitude Municipality
long --- > Longitude Municipality
Variables 240 to 391 --- > Distance in KM between monitor number, e.g., monitor 235 and Municipality centroid.
STN_min_dist --- > Variable with minimum distance to Municipality cenrtoid across all monitors.
STN_min_name --- > Name (number) of the closest monitor to each Municipality


Dataset name: GM_geocode_dist_temp.csv
Description: Dataset with information about the distance in KM between each Municipailty in the Netherlands and each KNMI temperature monitor.
Information about KNMI monitor location and daily weather information is openly available at https://daggegevens.knmi.nl/klimatologie/daggegevens  

Variable name --- > Explanation
Gemeente2020 --- > Municipality number as registered in CBS Open Data (leading zeroes were removed), see https://www.cbs.nl/nl-nl/onze-diensten/methoden/classificaties/overig/gemeentelijke-indelingen-per-jaar/indeling-per-jaar/gemeentelijke-indeling-op-1-januari-2020
Gemeentenaam2020 --- > Municipality name
text_to_geocode --- > Text used to get latitude and longitude in R via sp package.
lat --- > Latitude Municipality
long --- > Longitude Municipality
Variables 235 to 391 --- > Distance in KM between monitor number, e.g., monitor 235 and Municipality centroid.
STN_min_dist --- > Variable with minimum distance to Municipality cenrtoid across all monitors.
STN_min_name --- > Name (number) of the closest monitor to each Municipality


Dataset name: M_209_270_r.csv ; M_273_310_r.csv ; M_311_331_r.csv ; M_340_391_r.csv
Description:Datasets with weather variables from KNMI monitors. Downloaded directly from https://daggegevens.knmi.nl/klimatologie/daggegevens (openly available).
Downaloaded in 4 files as system does not permit to download several years for all monitors. Thus, it had to be splitted. 	

Datasets name: KNMI_monitors.csv
Description: Monitor coordinates as obtained from https://daggegevens.knmi.nl/klimatologie/daggegevens (openly available).

Variable name --- > Explanation
STN --- > Monitor Number 
long --- > longitude 
lat --- > latitude
alt --- > altitude

############################

Name Syntax File: Read_weather_data_GitHub.R
Description: Script to read and clean weather data downloaded from KNMI.

Name R environment File: temperatureWeather_R_GitHub.RData
Description: File resulting from running the script in Read_weather_data_GitHub.R
