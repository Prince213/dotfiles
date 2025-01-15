#include <dlfcn.h>
#include <stddef.h>

void* (*dlopen_)(const char*, int);

void* dlopen(const char* file, int mode) {
  if (dlopen_ == NULL) dlopen_ = dlsym(RTLD_NEXT, "dlopen");
  return dlopen_(file, mode);
}
