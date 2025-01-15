#include <dlfcn.h>
#include <stddef.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

void* (*dlopen_)(const char*, int);
FILE* (*fopen_)(const char*, const char*);

void* dlopen(const char* file, int mode) {
  if (dlopen_ == NULL) dlopen_ = dlsym(RTLD_NEXT, "dlopen");

  if (strcmp(file, "/usr/lib/libcups.so") == 0)
    file = "@cups@/lib/libcups.so";
  else if (strcmp(file, "/usr/lib/libgs.so") == 0)
    file = "@ghostscript@/lib/libgs.so";
  else if (strcmp(file, "/usr/lib/L_H0JDJCZAZ.so") == 0)
    file = "@out@/lib/L_H0JDJCZAZ.so";
  else if (strcmp(file, "/usr/lib/L_H0JDJCZAZ_2.so") == 0)
    file = "@out@/lib/L_H0JDJCZAZ_2.so";

  return dlopen_(file, mode);
}

#define DATADIR "/usr/local/share/panasonic/printer/data"
#define DATADIR_REAL "@datadir@"

FILE* fopen(const char* pathname, const char* mode) {
  if (fopen_ == NULL) fopen_ = dlsym(RTLD_NEXT, "fopen");

  if (strncmp(pathname, DATADIR, strlen(DATADIR)) == 0) {
    char* buf =
        malloc(strlen(DATADIR_REAL) + strlen(pathname) - strlen(DATADIR) + 1);
    if (buf == NULL) return NULL;
    strcpy(buf, DATADIR_REAL);
    strcat(buf, pathname + strlen(DATADIR));
    pathname = buf;
  };

  return fopen_(pathname, mode);
}
