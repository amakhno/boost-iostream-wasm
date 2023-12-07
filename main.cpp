#include <iostream>
#include <boost/iostreams/stream.hpp>

using namespace boost::iostreams;

int main() {
    char buffer[16];
    array_sink sink{buffer};
    stream<array_sink> os{sink};
    os << "Boost" << std::flush;
}