#include<stdio.h>

void swap_array(int arr[],int sz)
{
    int p1=0,p2=1,temp;
    if(sz>=2)
    {
        temp =arr[p1];
        arr[p1]=arr[p2];
        arr[p2]=temp;
    }
}

int main()
{
    int sz;
    printf("enter the size of  array:",sz);
    scanf("%d",&sz);
  int arr[sz];
  printf("enter the elements of array: ");
  for(int i=0;i<sz;i++)
   {
       scanf("%d",&arr[i]);
   }
   swap_array(arr,sz);
    printf("after swaping the array  is:\n");
   for(int i=0;i<sz;i++)
   {
       printf("%d ",arr[i]);
   }
   printf("\n");
   return 0;
  }
