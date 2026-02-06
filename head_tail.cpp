#include<iostream>
#include<string>
using namespace std;

int main(){
    string s;
    cout<<"enter the string: ";
    cin>>s;

    int n=s.length();
    if(n==1){
        cout<< -1;
    }else{
        cout<<"First and last character of the string"<<" "<<s[0]<<s[n-1];
    }
    return 0;
}