#include <iostream>
#include <stdexcept>
#include <jsapi.h>
#include <js/Initialization.h>
#include <mozilla/TimeStamp.h>


int main(int argc, const char *argv[]) {
  (void) argc;
  (void) argv;

  setenv("MOZ_APP_RESTART", "0", 1); // prevent jsapi from creating a new thread at startup

  if (!JS_Init()) {
    return 1;
  }

  JS_ShutDown();

  return 0;
}
