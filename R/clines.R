
clines <- function(x, y, z, nlevels=10,
                   levels = pretty(range(z, na.rm=TRUE), nlevels)) {
  warning("The clines package is no longer required.\nYou should use the function contourLines() in the graphics package instead.\nThis package will no longer be maintained after R version 2.2\n")
  invisible(.Call("clines", as.double(x), as.double(y),
                  z, as.double(levels), PACKAGE="clines"))
}



