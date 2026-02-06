#include<iostream>
#include<string>
using namespace std;

int main(){
    string S,T;
    cin>>S>>T;

    if(S.find(T) != string::npos){
        cout<<"YES";
    }
    else{
        cout<<"NO";
    }
  return 0;
}