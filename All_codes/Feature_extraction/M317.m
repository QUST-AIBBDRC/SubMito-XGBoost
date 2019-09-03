clear all
clc
g=15;
%导入数据
name='submito2006';
fid=fopen(name);
string=fscanf(fid,'%s'); %文件输入
%匹配的字符串
firstmatches=findstr(string,'>')-1;%开始位置
endmatches=findstr(string,'>')+7;%结束位置
firstnum=length(firstmatches); %firstnum=endnum序列的条数
endnum=length(endmatches);
 for k=1:firstnum-1
    j=1;
    lensec(k)=firstmatches(k+1)-endmatches(k)+1;%每条序列的长度
   for mm=endmatches(k):firstmatches(k+1)
  % for mm=firstmatches(k):endmatches(k)
        sequence(k,j)=string(mm); %字符序列
        j=j+1;
    end
 end
input=sequence;
output1=[];
for i=1:firstnum-1
   %i=2
    protein=input(i,:);
    output =Dipeptide(protein,lensec(i),g);%计算每一条序列的g-gap的数值信号
    output1=[output1;output];
    
end
save output1
xlswrite('15_317g_gapdc.xlsx',output1,'Sheet1','A1');