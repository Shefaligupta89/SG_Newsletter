library(readxl)
library(usethis)

# Load the Excel file from the working directory
outlays <- read_excel("outlays_functions.xlsx")

# Preview the data
head(outlays)

# Reshape the data into long format
interest_and_social_programs_long <- pivot_longer(interest_and_social_programs, 
                                                  cols = -`Function and Subfunction`, 
                                                  names_to = "Year", 
                                                  values_to = "Amount")

# Clean the "Amount" and "Year" columns by removing non-numeric values
interest_and_social_programs_long <- interest_and_social_programs_long %>%
  filter(!is.na(as.numeric(Amount))) %>%    # Remove rows where "Amount" cannot be converted to numeric
  mutate(Amount = as.numeric(Amount),       # Convert "Amount" to numeric
         Year = as.numeric(Year))  



# Ensure that you have cleaned outlay columns, including the years
outlays_long <- outlays_cleaned %>%
  pivot_longer(
    cols = matches("^19|^20"),  # Matches years starting with 19 or 20 (for 1900-2029)
    names_to = "Year", 
    values_to = "Amount"
  ) %>%
  filter(!is.na(Amount)) %>%
  mutate(Year = as.numeric(Year))  # Convert the year column to numeric




---
  
  
  ```{r}

# Ensure Year is numeric
# Adjust the combined_data_clean data as needed for ggalluvial
combined_data_clean$Year <- as.factor(combined_data_clean$Year)  # Convert Year to factor for better plotting

# Create the stacked area plot including all categories
p <- ggplot(combined_data_clean, aes(x = Year, y = Amount, fill = `Function and Subfunction`)) +
  geom_area(alpha = 0.8, size = 0.5, color = "black") +  # Stacked areas with black borders
  scale_fill_manual(values = c("red", "green", "blue")) +  # Assign colors to categories
  labs(title = "U.S. Government Spending: Social Security, Medicare, and Interest Payments",
       x = "Year",  # Explicitly label as 'Year'
       y = "Outlays (in millions)",
       fill = "Category") +
  theme_minimal() +
  theme(
    plot.title = element_text(hjust = 0.5, face = "bold"),
    axis.text.x = element_text(angle = 45, hjust = 1),  # Rotate x-axis labels for readability
    panel.grid.major = element_line(color = "gray80"),
    legend.position = "right"
  ) +
  scale_y_continuous(labels = scales::comma) +  # Add commas to Y-axis for better readability
  
  # Correct x-axis: Ensure actual years are displayed
  scale_x_continuous(breaks = seq(1960, 2030, by = 5))  # Set breaks for every 5 years

# Add the logo using cowplot
final_plot_3 <- ggdraw(p) +
  draw_image(logo, x = 0, y = -0.050, width = 0.14, height = 0.14, hjust = 0, vjust = 0)

# Save the final plot with the logo as a PDF
ggsave("stacked_area_plot_national_debt_chart.pdf", plot = final_plot_3, width = 6.2, height = 6)


```
