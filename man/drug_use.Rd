% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/data_albert.R
\docType{data}
\name{drug_use}
\alias{drug_use}
\title{How Baby Boomers Get High}
\format{A data frame with 17 rows representing age groups and 28 variables:
\describe{
  \item{age}{Age group}
  \item{n}{Number of people surveyed}
  \item{alcohol_use}{Percentage who used alcohol}
  \item{alcohol_freq}{Median number of times a user used alcohol}
  \item{marijuana_use}{Percentage who used marijuana}
  \item{marijuana_freq}{Median number of times a user used marijuana}
  \item{cocaine_use}{Percentage who used cocaine}
  \item{cocaine_freq}{Median number of times a user used cocaine}
  \item{crack_use}{Percentage who used crack}
  \item{crack_freq}{Median number of times a user used crack}
  \item{heroin_use}{Percentage who used heroin}
  \item{heroin_freq}{Median number of times a user used heroin}
  \item{hallucinogen_use}{Percentage who used hallucinogens}
  \item{hallucinogen_freq}{Median number of times a user used hallucinogens}
  \item{inhalant_use}{Percentage who used inhalants}
  \item{inhalant_freq}{Median number of times a user used inhalants}
  \item{pain_releiver_use}{Percentage who used pain relievers}
  \item{pain_releiver_freq}{Median number of times a user used pain relievers}
  \item{oxycontin_use}{Percentage who used oxycontin}
  \item{oxycontin_freq}{Median number of times a user used oxycontin}
  \item{tranquilizer_use}{Percentage who used tranquilizer}
  \item{tranquilizer_freq}{Median number of times a user used tranquilizer}
  \item{stimulant_use}{Percentage who used stimulants}
  \item{stimulant_freq}{Median number of times a user used stimulants}
  \item{meth_use}{Percentage who used meth}
  \item{meth_freq}{Median number of times a user used meth}
  \item{sedative_use}{Percentage who used sedatives}
  \item{sedative_freq}{Median number of times a user used sedatives}
}}
\source{
National Survey on Drug Use and Health from the Substance Abuse and
Mental Health Data Archive \url{http://www.icpsr.umich.edu/icpsrweb/content/SAMHDA/index.html}.
}
\usage{
drug_use
}
\description{
The raw data behind the story
"How Baby Boomers Get High"
\url{http://fivethirtyeight.com/datalab/how-baby-boomers-get-high/}.
It covers usage of 13 drugs in the past 12 months across 17 age groups.
}
\examples{
# To convert data frame to tidy data (long) format, run:
library(tidyverse)
library(stringr)
use <- drug_use \%>\%
  select(age, n, ends_with("_use")) \%>\%
  gather(drug, use, -c(age, n)) \%>\%
  mutate(drug = str_sub(drug, start=1, end=-5))
freq <- drug_use \%>\%
  select(age, n, ends_with("_freq")) \%>\%
  gather(drug, freq, -c(age, n)) \%>\%
  mutate(drug = str_sub(drug, start=1, end=-6))
drug_use_tidy <- left_join(x=use, y=freq, by = c("age", "n", "drug")) \%>\%
  arrange(age)
}
\keyword{datasets}
