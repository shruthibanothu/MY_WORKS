#include<bits/stdc++.h>
using namespace std;

class solution{
public:
    int reversenum(int n){
      int resn=0;

      while(n>0){
       int last_num= n%10;

       n=n/10;
       resn=(resn*10)+last_num;

      }
   return resn;
   }
};

int main(){
  solution sol;

  int n;
  cin>>n;

  int r = sol.reversenum(n);
  cout<<"the reversed digits are: "<<r;
}
