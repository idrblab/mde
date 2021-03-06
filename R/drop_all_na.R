#' Drop columns for which all values are NA
#' @inheritParams percent_missing
#' @examples
#' test <- data.frame(ID= c("A","A","B","A","B"), Vals = c(rep(NA,4),2))
#' test2 <- data.frame(ID= c("A","A","B","A","B"), Vals = rep(NA, 5))
#' # drop columns where all values are NA
#' drop_all_na(test2)
#' # drop NAs only if all are NA for a given group, drops group too.
#' drop_all_na(test, "ID")
#' @export

drop_all_na <- function(df, grouping_cols=NULL){
  UseMethod("drop_all_na")
}

#' @export

drop_all_na.data.frame <- function(df, grouping_cols = NULL){
  if(!is.null(grouping_cols)){
    if(!all(grouping_cols %in% names(df))){
      stop("All grouping columns should exist in the dataset.")
    }
   df %>%
         dplyr::group_by(!!!dplyr::syms(grouping_cols)) %>%
     dplyr::filter(dplyr::across(everything(),~!all(is.na(.)))) %>%
     dplyr::ungroup()


  }
else{

  Filter(function(x) !all(is.na(x)), df)

}



}






