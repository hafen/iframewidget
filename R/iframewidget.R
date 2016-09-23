#' Create an iframe widget
#'
#' Take a specified URL and render it in an iframe
#'
#' @param src URL to render in an iframe
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param elementId optional ID to be assigned to element enclosing the iframe
#'
#' @import htmlwidgets
#'
#' @export
iframewidget <- function(src, width = NULL, height = NULL, elementId = NULL) {

  x <- list(
    src = src
  )

  htmlwidgets::createWidget(
    name = "iframewidget",
    x,
    width = width,
    height = height,
    package = "iframewidget",
    elementId = elementId
  )
}

#' Shiny bindings for iframewidget
#'
#' Output and render functions for using iframewidget within Shiny
#' applications and interactive Rmd documents.
#'
#' @param outputId output variable to read from
#' @param width,height Must be a valid CSS unit (like \code{'100\%'},
#'   \code{'400px'}, \code{'auto'}) or a number, which will be coerced to a
#'   string and have \code{'px'} appended.
#' @param expr An expression that generates a iframewidget
#' @param env The environment in which to evaluate \code{expr}.
#' @param quoted Is \code{expr} a quoted expression (with \code{quote()})? This
#'   is useful if you want to save an expression in a variable.
#'
#' @name iframewidget-shiny
#'
#' @export
iframewidgetOutput <- function(outputId, width = "100%", height = "400px"){
  htmlwidgets::shinyWidgetOutput(outputId, "iframewidget", width, height,
    package = "iframewidget")
}

#' @rdname iframewidget-shiny
#' @export
renderIframewidget <- function(expr, env = parent.frame(), quoted = FALSE) {
  if (!quoted) {
    expr <- substitute(expr)
  } # force quoted
  htmlwidgets::shinyRenderWidget(expr, iframewidgetOutput, env, quoted = TRUE)
}
