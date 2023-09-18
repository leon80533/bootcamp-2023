ny_school_data = read_csv("nys_schools.csv", stringAsFactors = FALSE)
nys_acs_data = read_csv("nys_acs.csv")

view(ny_school_data)
view(nys_acs_data)

summary(ny_school_data)
summary(nys_acs_data)

ny_school_data$total_enroll[ny_school_data$total_enroll ==-99] = NA
ny_school_data$per_free_lunch[ny_school_data$per_free_lunch ==-99] = NA
ny_school_data$per_reduced_lunch[ny_school_data$per_reduced_lunch ==-99] = NA
ny_school_data$per_lep[ny_school_data$per_lep ==-99] = NA
ny_school_data$mean_ela_score[ny_school_data$mean_ela_score ==-99] = NA
ny_school_data$mean_math_score[ny_school_data$mean_math_score ==-99] = NA

ny_school_data$total_enroll[ny_school_data$total_enroll == NA] = mean(ny_school_data$total_enroll)
ny_school_data$per_free_lunch[ny_school_data$per_free_lunch == NA] = mean(ny_school_data$per_free_lunch)
ny_school_data$per_reduced_lunch[ny_school_data$per_reduced_lunch == NA] = mean(ny_school_data$per_reduced_lunch)
ny_school_data$per_lep[ny_school_data$per_lep == NA] = mean(ny_school_data$per_lep)
ny_school_data$mean_ela_score[ny_school_data$mean_ela_score == NA] = mean(ny_school_data$mean_ela_score)
ny_school_data$mean_math_score[ny_school_data$mean_math_score == NA] = mean(ny_school_data$mean_math_score)

ny_school_data$total_enroll

nys_acs_data %>%
  mutate(poverty_rate = case_when(county_per_poverty < 0.10903 ~ "low",
                                  county_per_poverty < 0.14929 ~ "mid",
                                  county_per_poverty >= 0.14929 ~ "high"))

ny_school_data = ny_school_data %>%
  mutate(scale_math_score = scale(mean_math_score)* mean_math_score)


print(ny_school_data)
