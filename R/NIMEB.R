#' Detect differential expression genes for RNA-seq data
#' @description Use a normalization-invariant minimum enclosing ball (NIMEB) 
#' method to discriminate differential expression (DE) genes in the same or 
#' different species.
#' @usage NIMEB(countsTable, train_id, gamma, nu = 0.01, reject_rate = 0.1,
#' ds = FALSE)
#' @param countsTable Matrix or data.frame of short read counts for each genes
#' in the same or different species.
#' @param train_id A vector shows the position of housekeeping genes or
#' conserved genes in countsTable.
#' @param gamma A parameter needed for all kernels except linear.
#' @param nu parameter needed for one-classification.
#' @param reject_rate A value used in controling the scale of ball, default is
#' 0.01.
#' @param ds A value to show the data is for the same species or different
#' species. If ds is FALSE, the data is the same species, else the data is the
#' different species.
#' @return list(.) A list of results, "model" represents the model of NIMEB,
#' which could be used to discriminate a new gene, "gamma" represents the
#' selected gamma parameters in model NIMEB, "train_error" represents the
#' corresponding train_error when the value of gamma changed.
#' @examples
#' ## Simulation data for the same species.
#' library(SummarizedExperiment)
#' data(sim_data_sp)
#' gamma <- seq(1e-06,5e-05,1e-06)
#' sim_model_sp <- NIMEB(countsTable = assay(sim_data_sp), train_id=1:1000,
#' gamma, nu = 0.01, reject_rate = 0.05, ds = FALSE)
#'
#' ## Real data for the same species.
#' data(real_data_sp)
#' gamma <- seq(1e-06,5e-05,1e-06)
#' real_model_sp <- NIMEB(countsTable = assay(real_data_sp), train_id=1:530,
#' gamma, nu = 0.01, reject_rate = 0.1, ds = FALSE)
#'
#' ## Simulation data for the different species.
#' data(sim_data_dsp)
#' gamma <- seq(1e-07,2e-05,1e-06)
#' sim_model_dsp <- NIMEB(countsTable = assay(sim_data_dsp), train_id=1:1000,
#' gamma, nu = 0.01, reject_rate = 0.1, ds = TRUE)
#'
#' ## Real data for the different species.
#' data(real_data_dsp)
#' gamma <- seq(5e-08,5e-07,1e-08)
#' real_model_dsp <- NIMEB(countsTable = assay(real_data_dsp), train_id=1:143,
#' gamma, nu = 0.01, reject_rate = 0.1, ds = TRUE)
#' @export
#' @importFrom e1071 svm
#' @import SummarizedExperiment


NIMEB <- function(countsTable, train_id, gamma, nu = 0.01, reject_rate = 0.1,
                ds = FALSE){

  if (all(!is.na(countsTable)) == FALSE) {
    stop("The dataset of genes has NA values.", call.=TRUE)
  } else if (all(train_id %in% (seq_len(nrow(countsTable)))) == FALSE){
    stop("The housekeeping or conserved genes are not included in dataset",
         call.=TRUE)
  }

  trainData <- countsTable[train_id,]
  train_error <- numeric(length(gamma))

  if (ds == TRUE){
    ad_scale <- countsTable[,1]/countsTable[,3]
    exchange_data <- cbind(countsTable[,2],round(countsTable[,4]*ad_scale))
    trainData <- exchange_data[train_id,]
  }

  for(k in seq_len(length(gamma))){
    model <- e1071::svm(trainData, y = NULL, scale = FALSE,
                 type = "one-classification", kernel = "radial",
                 gamma = gamma[k], nu = nu, tolerance = 0.001,
                 shrinking = TRUE, cross = 5, probability = FALSE,
                 fitted = TRUE)
    train_error[k] <- 1 - model$tot.accuracy / 100
  }

  gamma_num_new <- which.min(abs(train_error - reject_rate))
  model_new <- e1071::svm(trainData, y = NULL, scale = FALSE,
                   type = "one-classification", kernel = "radial",
                   gamma = gamma[gamma_num_new], nu = nu, tolerance = 0.001,
                   shrinking = TRUE, cross = 5, probability = FALSE,
                   fitted = TRUE)

  list(model=model_new, gamma = gamma[gamma_num_new], train_error = train_error)
}
