#include <iostream>
#include "one.hpp"
#include "two.hpp"

int main() {
  One one;
  Two two;

  std::cout << one.value() << " " << two.value() << "\n";

  return 0;
}