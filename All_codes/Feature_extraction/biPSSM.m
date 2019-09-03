clear all
clc
%读取蛋白质序列的pssm
%蛋白质序列个数
WEISHU=317;
for i=1:317
    nnn=num2str(i);
    name = strcat(nnn,'pssm.txt');
    fid{i}=importdata(name);
end
%所有蛋白质序列归一化
c=cell(WEISHU,1);
for t=1:WEISHU
    clear shu d
shu=fid{t}.data;
%知道每条蛋白质的数量，提取出来的矩阵，注意蛋白质的顺序
% shuju=shu(1:i,1:20);
[M,N]=size(shu);
shuju=shu(1:M-5,1:20);
d=[];

for i=1:M-5
   for j=1:20
       %%归一化
       %d(i,j)=1/(1+exp(-shuju(i,j)));
       %不归一化
       d(i,j)=shuju(i,j);
   end
end
c{t}=d(:,:);
end     
for t=1:WEISHU
  [MM,NN]=size(c{t});
  clear xx
   p=1;
   for  m=1:20
      for n=1:20
          for ii=1:MM-1
       xx(ii,p)=c{t}(ii,m)*c{t}(ii+1,n);
          end
          p=p+1;
      end
   end
B(t,:)=sum(xx);
end
bipssm=B;
 save 317bipssmbuguiyi 
xlswrite('317bipssmbuguiyi.xlsx',bipssm,'Sheet1','A1');
       