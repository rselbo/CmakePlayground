#pragma once 

class EmbeddedSql
{
public:
    EmbeddedSql();

    int getMember() const;
    int embeddedSql();

private:
    int m_Member = 10;
};