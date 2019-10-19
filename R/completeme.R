#borrowed main bits from https://github.com/jimhester/completeme (when it is put on CRAN will import directly from it)

the <- new.env(parent = emptyenv())
the$completions <- list()
complete_token <- get(".completeToken", asNamespace("utils"))

# Register completion functions
#
# Completion functions should take one parameter `env`, the completion
# environment, see `?rc.settings` for details of this environment. They should
# simply return any completions found or `return(NULL)` otherwise.
#
# If all registered completions do not have any completions for a given
# context, than R's standard completions are used.
# @param ... One or more completion functions specified as named parameters.
#' @importFrom utils modifyList
register_completion <- function(...) {
  funs <- list(...)

  nms <- names(funs)
  if (is.null(nms) || any(nms == "" | is.na(nms))) {
    wch <- if (is.null(nms)) 1 else which(nms == "" | is.na(nms))
    stop("All arguments must be named")
  }

  old <- the$completions
  the$completions <- utils::modifyList(the$completions, funs)

  invisible(old)
}

#' @importFrom utils rc.options
completeme <- function(env) {
  env$fileName <- FALSE
  for (fun in the$completions) {
    env$comps <- fun(env)
    if (length(env$comps) > 0) {
      attributes(env$comps) <- list(class = "completions", type = 15)
      # this_type <- attr(env$comps, "type") %||% 15
      return(invisible(env$comps))
    }
  }

  env$comps <- character()

  # if in the IDE, throw an error to fallback on normal completion
  if (rstudioapi::isAvailable()) {
    stop("No custom completions")
  }

  # If on the command line, fall back to using the default completer
  on.exit(rc.options(custom.completer = completeme))
  rc.options(custom.completer = NULL)
  complete_token()

  invisible(env$comps)
}

#' @importFrom rematch2 re_match
current_function <- function(env) {
  buffer <- env[["linebuffer"]]
  fun <- rematch2::re_match(buffer, "(?<fun>[^[:space:](]+)[(][^(]*$")$fun
  if (is.na(fun)) {
    return("")
  }
  fun
}

is_first_argument <- function(env) {
  buffer <- env[["linebuffer"]]
  !is.na(rematch2::re_match(buffer, "[^[:space:](]+[(][^[:space:]=,]*$")$.match)
}


populate <- function(env){

  fun <- current_function(env)

  this_ns <- find_the()

  this_fn <- lapply(this_ns,function(x) ls(envir = asNamespace(x), pattern = 'opts$'))

  nms <- lapply(this_fn,function(x) names(get(x)$get()))

  comp <- NULL

  if(length(fun) > 0){
    for(i in seq_along(this_ns)){
      if(fun %in% build_fields(ns = this_ns[i],fn = this_fn[[i]])){
        comp <- nms[[i]]
      }
    }
  }

  return(comp)

}

build_fields <- function(fields = c('set','append'),ns='ns',fn='fn'){
  c(
    sprintf('%s::%s$%s',ns,fn,fields),
    sprintf('%s$%s',fn,fields)
  )
}

find_the <- function(){
  names(which(sapply(loadedNamespaces(),function(x) any(grepl('^the$',ls(envir = asNamespace(x)))))))
}

paletteer_d_completer <- function(env) {

  c_funs <- c("paletteer_c", "scale_color_paletteer_c",
              "scale_colour_paletteer_c",  "scale_fill_paletteer_c")
  d_funs <- c("paletteer_d", "scale_color_paletteer_d",
              "scale_colour_paletteer_d", "scale_fill_paletteer_d")

  if (!(current_function(env) %in% c(c_funs, d_funs, "paletteer_dynamic") &&
                  is_first_argument(env))) {
    return(NULL)
  }

  if (current_function(env) %in% c_funs) {
    return(paste0('"', c_names, '"'))
  }
  if (current_function(env) %in% d_funs) {
    return(paste0('"', d_names, '"'))
  }
  if (current_function(env) == "paletteer_dynamic") {
    return(paste0('"', dym_names, '"'))
  }
}

.onLoad <- function(lib, pkg) {
  rc.options(custom.completer = completeme)
  register_completion(paletteer = paletteer_d_completer)
}

