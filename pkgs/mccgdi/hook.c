#include <dlfcn.h>
#include <stddef.h>
#include <string.h>

void* (*dlopen_)(const char*, int);

void* dlopen(const char* file, int mode) {
  if (dlopen_ == NULL) dlopen_ = dlsym(RTLD_NEXT, "dlopen");

  if (strcmp(file, "/usr/lib/libcups.so") == 0)
    file = "@cups@/lib/libcups.so";
  else if (strcmp(file, "/usr/lib/libgs.so") == 0)
    file = "@ghostscript@/lib/libgs.so";

  return dlopen_(file, mode);
}
