#######################################
#
# Load CSV files from folder
#
######################################

library(data.table)
library(stringr)
# 
# I ran the below 18 times separately
f <- file.choose()  # open Finder, let me pick a file
name <- str_sub(f, -19, -8) #select a subset of the file name as string
x <- paste("df_", name, sep = "") #prefix df to the string to keep naming discipline
dfTemp <- read_csv(f, skip = 1) # open the selected CSV file, skip the first row, making second row column names
assign(x, dfTemp)  # assign dfTemp to the string name df
#   End of manual routine. Eventually, I'll make this a loop that determines number
#   of CSV in the folder and loops this routine for all of them.

#   Goal of this section is to bring all the CSV files/df's together into one
#   master df, which a row for each original df (year) and each df's data in the
#   appropriate column.  If multiple files share same column, then all rows should
#   put their data for that column in the same column. If any df introduces a new
#   column that was not in the first df, then that column should be added to the right
#   Repeat this until all df's are ingested with all their data lined up, where appropirate.
#
######  RESULTS as of this writing
#   Code below produces the combined df - one row for each df, but 2 ... 18 df data is misisng.
#   See df1880_1940 for the combined output table. Rows 2:18 are all "NA".
#

df1880_1940 <- dplyr::bind_rows(df_210_1920_nat, df_s16_1870_nat, df_s17_1870_nat, df_s22_1880_nat,
                 df_s23_1880_nat, df_s26_1890_nat, df_s27_1890_nat, df_s31_1900_nat,
                 df_s36_1910_nat, df_s37_1910_nat, df_s38_1910_nat, df_s43_1920_nat,
                 df_s43_1920_nat, df_s44_1920_nat, df_s54_1930_nat, df_s78_1940_nat)

