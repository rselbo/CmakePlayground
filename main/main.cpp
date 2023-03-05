#include "embedded/embedded.h"
#include <iostream>

auto main(int argc, char** argv) -> int
{
    EmbeddedSql sql;
    std::cout << "main()" << std::endl;
    return sql.embeddedSql();    
}