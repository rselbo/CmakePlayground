#include "embedded.h"
#include <iostream>

extern "C" int myfunc();

EmbeddedSql::EmbeddedSql()
{
    std::cout << "EmbeddedSql::EmbeddedSql()" << std::endl;
}

int EmbeddedSql::getMember() const 
{
    return m_Member;
}

int EmbeddedSql::embeddedSql()
{
    std::cout << "EmbeddedSql::embeddedSql()" << std::endl;
    return myfunc();
}