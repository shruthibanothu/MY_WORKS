#include<iostream>
#include<vector>
#include<algorithm>
using namespace std;

int main(){
    int n,a,b,c;

    vector<int> seg_cut(n + 1, -1000000000);

    seg_cut[0]=0;
    for(int i=1; i<=n; i++){
        if(i-a>=0) seg_cut[i]=max(seg_cut[i], seg_cut[i-a]+1);
        if(i-b>=0) seg_cut[i]=max(seg_cut[i], seg_cut[i-b]+1);
        if(i-c>=0) seg_cut[i]=max(seg_cut[i], seg_cut[i-c]+1);
    }
    return 0;
}