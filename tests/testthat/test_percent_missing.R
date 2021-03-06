test_that(desc="percent_missing warns",
                    code = {
                      skip_on_oldrel()
                      test <- data.frame(ID= c("A","B","A","B","A","B","A"),
                                         Vals = c(NA,25,34,NA,67,NA,45))
                    expect_equal(percent_missing(test,
                                          grouping_cols =
                                                 "ID")[[2]][1],
                                          25)
                    expect_error(percent_missing(airquality,
                                                 grouping_cols = "Nope"),
                       "All grouping columns should exist in the dataset",
                       fixed = TRUE)
                    expect_error(percent_missing(airquality,
                                                   exclude_cols = "nope"),
                      "Can only exclude columns that exist in the dataset.",
                      fixed=TRUE)
                    })

