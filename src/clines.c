
#include <Rinternals.h>
#include <Rgraphics.h>
#include <R_ext/GraphicsDevice.h> 
#include <R_ext/GraphicsEngine.h> 
#include <R_ext/Rdynload.h>

SEXP clines(SEXP x, SEXP y, SEXP z, SEXP levels);

static const R_CallMethodDef callMethods[] = {
    {"clines", (DL_FUNC) &clines, 4},
    { "", NULL, 0 }
};


void R_init_clinespkg(DllInfo *info) 
{
    /* No .C, .Fortran, or .External routines => NULL
     */
    R_registerRoutines(info, NULL, callMethods, NULL, NULL);
}

SEXP clines(SEXP x, SEXP y, SEXP z, SEXP levels) {
  return GEcontourLines(REAL(x), LENGTH(x),
			REAL(y), LENGTH(y),
			REAL(z), 
			REAL(levels), LENGTH(levels),
			(GEDevDesc*) CurrentDevice());
}


