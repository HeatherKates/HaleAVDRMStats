URN <- read.csv("original_data/URN.csv")
# Initialize an empty data frame to store the summary
summary_df <- data.frame()

# Mapping between substances in 'data' and the corresponding columns in 'URN'
substance_to_urn_col <- list(
  "Marijuana" = "CANBND",       # Example: Column name for marijuana
  "Amphetamine" = "AMPHETM",    # Example: Column name for amphetamines
  "Cocaine" = "COCAINE",        # Example: Column name for cocaine
  "Sedatives" = "BENZDPN",      # Example: Column name for sedatives
  "Opiates" = "OPIATES",        # Example: Column name for opiates
  "Phencyclidine" = "PHNCYCL"   # Example: Column name for phencyclidine
)

# Loop over each substance
for (substance in names(substance_to_urn_col)) {
  # Get the corresponding column name in URN
  urn_col <- substance_to_urn_col[[substance]]
  
  # Filter for patients who are scored as "1" for the substance in 'data'
  positive_patients <- data[data[[substance]] == 1, "PATID"]
  
  # Ensure we only include PATIDs that are present in both 'data' and 'URN'
  positive_patients <- positive_patients[positive_patients %in% URN$PATID]
  
  # Create a placeholder for each patient
  for (patid in positive_patients) {
    # Filter URN data for the current patient
    patient_visits <- URN[URN$PATID == patid, ]
    total_visits <- nrow(patient_visits)
    
    # Count the number of positive visits for the substance
    if (!is.null(urn_col) && urn_col %in% colnames(URN)) {
      positive_visits <- sum(patient_visits[[urn_col]] > 0, na.rm = TRUE)
    } else {
      positive_visits <- NA
    }
    
    # Append the results to the summary data frame
    summary_df <- rbind(summary_df, data.frame(
      PATID = patid,
      Substance = substance,
      substance_score = 1,
      total_URN_visits = total_visits,
      num_of_positive_substance_URN = positive_visits
    ))
  }
}

# Load ggplot2 library
library(ggplot2)



# Create a scatter plot with jitter to avoid overlap
ggplot(summary_df, aes(x = num_of_positive_substance_URN / total_URN_visits, y = total_URN_visits)) +
  geom_jitter(aes(size = total_URN_visits, color = total_URN_visits), 
              width = 0.04, height = 0.7, alpha = 0.6) +
  facet_wrap(~ Substance, scales = "free") +
  scale_size_continuous(name = "Total Visits", range = c(2, 10)) + # Adjust size range for better visibility
  scale_color_viridis_c(name = "Total Visits", option = "viridis") + # Use a color scale from the viridis package
  labs(
    title = "Proportion of Positive Visits vs. Total Visits for Each Substance",
    x = "Proportion of Positive Visits",
    y = "Total Visits"
  ) +
  theme_minimal() +
  theme(legend.position = "bottom")
