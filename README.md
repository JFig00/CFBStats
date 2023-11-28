# CFBStats
## Description
CFBStats is a web application made using R Shiny with data from collegefootballdata.com
### First Module- "Stats"
The default landing page named "Stats" is a fun interactive table to view the stats of players/teams in a given year for the specific statistical category that you choose.
### Second Module- "Visualization"
Create a histogram for the specified statistic and conference
### Third Module- "Draft Predictor"
Predict what round and overall pick a player will be drafted in
## How to Run
### Method 1
Simply go to [jfig00.shinyapps.io/CFBStats/](https://jfig00.shinyapps.io/CFBStats/) and enjoy!
### Method 2
1. Go to [posit.co](https://posit.co/download/rstudio-desktop/)
2. Follow the steps to install <i>R</i> and <i>Rstudio</i> if not already installed
3. Open <i>Rstudio</i> and locate the console
4. Type the following code into the console and hit ENTER
```R
install.packages("shiny")
library(shiny)
runGitHub("CFBStats","JFig00")
```
