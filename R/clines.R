
clines <- function(x, y, z, nlevels=10,
                   levels = pretty(range(z, na.rm=TRUE), nlevels)) {
  invisible(.Call("clines", as.double(x), as.double(y),
                  z, as.double(levels)))
}



