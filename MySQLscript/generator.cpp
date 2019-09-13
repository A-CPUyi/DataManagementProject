#include <iostream>
#include <string>
#include <vector>

using std::string;
using std::vector;
const string token = ".. ";

vector<int>* parse_index(std::string raw_seq){
    vector<int>* splited_str_v = new vector<int>; 
    const int head_index = 0;
    while(raw_seq.length() > 0){
        raw_seq.erase(head_index, token.length());
        int tk_point = raw_seq.find_first_of(token);
        splited_str_v->push_back(atoi(raw_seq.substr(head_index,tk_point).c_str()));
        raw_seq.erase(head_index, tk_point);
    }
    return splited_str_v;
}

int main(int argc, char const *argv[])
{
    const std::string raw_seq= ".. 5845.. 13471.. 27535.. 54081.. 121864.. 168755.. 179454.. 199250.. 255713.. 330173.. 340777.. 361604.. 417688.. 494439.. 506508.. 531618.. 598198.. 660850.. 675304.. 712440.. 805248.. 829015.. 849124.. 904173.. 986222.. 1000327.. 1034848.. 1126627.. 1156604.. 1179142.. 1241580.. 1315527.. 1332370.. 1382240.. 1475138.. 1489524.. 1527266.. 1620539.. 1637138";
    const std::string template_form = "insert into user (user_id, user_name, review_count, fans_count)\n\
        select jsonData->'$.user_id' , jsonData->'$.name', jsonData->'$.review_count',\n\
        jsonData->'$.fans', jsonData->'$.frineds'\n\
        from user_json_temp where id >= %d and id < %d;\n";
    int start = 0;
    for(int i:*parse_index(raw_seq)){
        printf(template_form.c_str(), start, i);
        start = i;
    }
    return 0;
}
