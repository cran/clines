\name{clines}
\alias{clines}
%- Also NEED an `\alias' for EACH other topic documented here.
\title{ Calculate Contour Lines }
\description{
  Produces a list of contours.  Each contour is a list of 3 elements:
  the contour level, the x-coordinates of the contour, and the
  y-coordinates of the contour.
}
\usage{
clines(x, y, z, nlevels = 10, levels = pretty(range(z, na.rm = TRUE), nlevels))
}
%- maybe also `usage' for other objects documented here.
\arguments{
  \item{x,y}{locations of grid lines at which the values in \code{z} are
    measured.  These must be in ascending order.  By default, equally
    spaced values from 0 to 1 are used.  If \code{x} is a \code{list},
    its components \code{x$x} and \code{x$y} are used for \code{x}
    and \code{y}, respectively. If the list has component \code{z} this
    is used for \code{z}.}
  \item{z}{a matrix containing the values to be plotted (\code{NA}s are
    allowed).  Note that \code{x} can be used instead of \code{z} for
    convenience.}
  \item{nlevels}{number of contour levels desired \bold{iff}
    \code{levels} is not supplied.}
  \item{levels}{numeric vector of levels at which to draw contour
    lines.}
}
\value{
  A list of contours.
  Each contour consists of:
  \item{1 }{The contour level.}
  \item{2 }{The x-coordinates of the contour.}
  \item{3 }{The y-coordinates of the contour.}
}
\section{Warning}{
  This function was just a temporary interface to the C code
  underlying the \code{contour} function.  There is now a base
  function called \code{contourLines} which should be used instead.
  }
\author{ Paul Murrell }
\examples{
# Mount Maungawhau
data("volcano")
rx <- range(x <- 10*1:nrow(volcano))
ry <- range(y <- 10*1:ncol(volcano))
ry <- ry + c(-1,1) * (diff(rx) - diff(ry))/2
tcol <- terrain.colors(12)
plot(x = 0, y = 0,type = "n", xlim = rx, ylim = ry, xlab = "", ylab = "")
u <- par("usr")
rect(u[1], u[3], u[2], u[4], col = tcol[8], border = "red")

line.list <- clines(x, y, volcano)

contour(x, y, volcano, col = tcol[2], lty = "solid", add = TRUE,
        vfont = c("sans serif", "plain"))

templines <- function(clines) {
  lines(clines[[2]], clines[[3]])
}  
invisible(lapply(line.list, templines))
}
\keyword{ dplot }% at least one, from doc/KEYWORDS
