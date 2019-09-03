clear all
clc
lamdashu=1;
%导入数据
name='submito2006';
fid=fopen(name);
string=fscanf(fid,'%s'); %文件输入
%匹配的字符串
% firstmatches=findstr(string,'M');%开始位置
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
%   strrep(str1,str2,str3) 
%   它把str1中所有的str2字串用str3来替换
% % %%%%%%物理化学性质1 
for i=1:firstnum-1
c= strrep(sequence(i,:),'A','8.100 ');
c1= strrep(c,'C','5.500 ');
c2= strrep(c1,'D','13.000 ');
c3= strrep(c2,'E','12.300 ');
c4= strrep(c3,'F','5.200 ');
c5= strrep(c4,'G','9.000 ');
c6= strrep(c5,'H','10.400 ');
c7=strrep(c6,'I','5.200 ');
c8=strrep(c7,'K','11.300 ');
 c9=strrep(c8,'L','4.900 ');
 c10=strrep(c9,'M','5.700 ');
 c11=strrep(c10,'N','11.600 ');
 c12=strrep(c11,'P','8.000 ');
 c13=strrep(c12,'Q','10.500 ');
 c14=strrep(c13,'R','10.500 ');
 c15=strrep(c14,'S','9.200 ');
c16= strrep(c15,'T','8.000 ');
c17= strrep(c16,'V','5.900 ');
c18= strrep(c17,'W','5.400 ');
c19= strrep(c18,'Y','6.200 ');
b{i}=c19;
clear c c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19
end
 xx=[];
acf=[];
for ii=1:firstnum-1
     shuzhi=str2num(b{ii});
     [hang,changdu]=size(shuzhi);
    for lamda=1:lamdashu;
       for j=1:changdu-lamda
       xx(ii,j)=shuzhi(1,j)*shuzhi(1,j+lamda);
     end
      acf(ii,lamda)=sum(xx(ii,1:changdu-lamda))/(changdu-lamda);
   end
   clear shuzhi 
end
save acf  
xlswrite('1_317phychen1.xlsx',acf,'Sheet1','A1');
% % % %%%%%%%%物理化学性质2
% for i=1:firstnum-1
% c= strrep(sequence(i,:),'A','-1.302 ');
% c1= strrep(c,'C','0.465 ');
% c2= strrep(c1,'D','0.302 ');
% c3= strrep(c2,'E','-1.453 ');
% c4= strrep(c3,'F','-0.59 ');
% c5= strrep(c4,'G','1.652 ');
% c6= strrep(c5,'H','-0.417 ');
% c7=strrep(c6,'I','-0.547 ');
% c8=strrep(c7,'K','-0.561 ');
%  c9=strrep(c8,'L','-0.987 ');
%  c10=strrep(c9,'M','-1.524 ');
%  c11=strrep(c10,'N','0.828 ');
%  c12=strrep(c11,'P','2.081 ');
%  c13=strrep(c12,'Q','-0.179 ');
%  c14=strrep(c13,'R','-0.055 ');
%  c15=strrep(c14,'S','1.399 ');
% c16= strrep(c15,'T','0.326 ');
% c17= strrep(c16,'V','-0.279 ');
% c18= strrep(c17,'W','0.009 ');
% c19= strrep(c18,'Y','0.830 ');
% b{i}=c19;
% clear c c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19
% end
%  xx=[];
% acf=[];
% for ii=1:firstnum-1
%      shuzhi=str2num(b{ii});
%      [hang,changdu]=size(shuzhi);
%     for lamda=1:lamdashu;
%        for j=1:changdu-lamda
%        xx(ii,j)=shuzhi(1,j)*shuzhi(1,j+lamda);
%      end
%       acf(ii,lamda)=sum(xx(ii,1:changdu-lamda))/(changdu-lamda);
%    end
%    clear shuzhi 
% end
% save acf  
% %导入数据
% A=xlsread('317phychen1.xlsx');
% A=[A,acf];
% xlswrite('317phychen2.xlsx',A,'Sheet1','A1');
% % %%%%%%%%物理化学性质3
% for i=1:firstnum-1
% c= strrep(sequence(i,:),'A','-0.733 ');
% c1= strrep(c,'C','-0.862 ');
% c2= strrep(c1,'D','-3.656 ');
% c3= strrep(c2,'E','1.477 ');
% c4= strrep(c3,'F','1.891 ');
% c5= strrep(c4,'G','1.330 ');
% c6= strrep(c5,'H','-1.673 ');
% c7=strrep(c6,'I','2.131 ');
% c8=strrep(c7,'K','0.533 ');
%  c9=strrep(c8,'L','-1.505 ');
%  c10=strrep(c9,'M','2.219 ');
%  c11=strrep(c10,'N','1.299 ');
%  c12=strrep(c11,'P','-1.628 ');
%  c13=strrep(c12,'Q','-3.005 ');
% c14=strrep(c13,'R','1.502 ');
% c15= strrep(c14,'S','-4.76 ');
% c16= strrep(c15,'T','2.213 ');
% c17= strrep(c16,'V','-0.544 ');
% c18= strrep(c17,'W','0.672 ');
% c19= strrep(c18,'Y','3.097 ');
% b{i}=c19;
% %li=[li;c19];
% %name = strcat('','c19','');
% clear c c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19
% end
%  xx=[];
% acf=[];
% for ii=1:firstnum-1
%      shuzhi=str2num(b{ii});
%      [hang,changdu]=size(shuzhi);
%     for lamda=1:lamdashu;
%        for j=1:changdu-lamda
%        xx(ii,j)=shuzhi(1,j)*shuzhi(1,j+lamda);
%      end
%       acf(ii,lamda)=sum(xx(ii,1:changdu-lamda))/(changdu-lamda);
%    end
%    clear shuzhi 
% end
% save acf  
% %导入数据
% A=xlsread('317phychen2.xlsx');
% A=[A,acf];
% xlswrite('317phychen3.xlsx',A,'Sheet1','A1');
% % %%%%%%%%物理化学性质4
% for i=1:firstnum-1
% c= strrep(sequence(i,:),'A','1.570 ');
% c1= strrep(c,'C','-1.02 ');
% c2= strrep(c1,'D','-0.259 ');
% c3= strrep(c2,'E','0.113 ');
% c4= strrep(c3,'F','-0.397 ');
% c5= strrep(c4,'G','1.045 ');
% c6= strrep(c5,'H','-1.474 ');
% c7=strrep(c6,'I','0.393 ');
% c8=strrep(c7,'K','-0.277 ');
%  c9=strrep(c8,'L','1.266 ');
%  c10=strrep(c9,'M','-1.005 ');
%  c11=strrep(c10,'N','-0.169 ');
%  c12=strrep(c11,'P','0.421 ');
%  c13=strrep(c12,'Q','-0.503 ');
% c14=strrep(c13,'R','0.440 ');
% c15= strrep(c14,'S','0.670 ');
% c16= strrep(c15,'T','0.908 ');
% c17= strrep(c16,'V','1.242 ');
% c18= strrep(c17,'W','-2.128 ');
% c19= strrep(c18,'Y','-0.838 ');
% b{i}=c19;
% %li=[li;c19];
% %name = strcat('','c19','');
% clear c c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19
% end
%   xx=[];
% acf=[];
% for ii=1:firstnum-1
%      shuzhi=str2num(b{ii});
%      [hang,changdu]=size(shuzhi);
%     for lamda=1:lamdashu;
%        for j=1:changdu-lamda
%        xx(ii,j)=shuzhi(1,j)*shuzhi(1,j+lamda);
%      end
%       acf(ii,lamda)=sum(xx(ii,1:changdu-lamda))/(changdu-lamda);
%    end
%    clear shuzhi 
% end
% save acf  
% %导入数据
% A=xlsread('317phychen3.xlsx');
% A=[A,acf];
% xlswrite('317phychen4.xlsx',A,'Sheet1','A1');
% % % %%%%%%%%物理化学性质5
% for i=1:firstnum-1
% c= strrep(sequence(i,:),'A','-0.146 ');
% c1= strrep(c,'C','-0.255 ');
% c2= strrep(c1,'D','-3.242 ');
% c3= strrep(c2,'E','-0.837 ');
% c4= strrep(c3,'F','0.412 ');
% c5= strrep(c4,'G','2.064 ');
% c6= strrep(c5,'H','-0.078 ');
% c7=strrep(c6,'I','0.816 ');
% c8=strrep(c7,'K','1.648 ');
%  c9=strrep(c8,'L','-0.912 ');
%  c10=strrep(c9,'M','1.212 ');
%  c11=strrep(c10,'N','0.933 ');
%  c12=strrep(c11,'P','-1.392 ');
%  c13=strrep(c12,'Q','-1.853 ');
% c14=strrep(c13,'R','2.897 ');
% c15= strrep(c14,'S','-2.647 ');
% c16= strrep(c15,'T','1.313 ');
% c17= strrep(c16,'V','-1.262 ');
% c18= strrep(c17,'W','-0.184 ');
% c19= strrep(c18,'Y','1.512 ');
% b{i}=c19;
% clear c c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19
% end
%   xx=[];
% acf=[];
% for ii=1:firstnum-1
%      shuzhi=str2num(b{ii});
%      [hang,changdu]=size(shuzhi);
%     for lamda=1:lamdashu;
%        for j=1:changdu-lamda
%        xx(ii,j)=shuzhi(1,j)*shuzhi(1,j+lamda);
%      end
%       acf(ii,lamda)=sum(xx(ii,1:changdu-lamda))/(changdu-lamda);
%    end
%    clear shuzhi 
% end
% save acf  
% %导入数据
% A=xlsread('317phychen4.xlsx');
% A=[A,acf];
% xlswrite('317phychen5.xlsx',A,'Sheet1','A1');
% % % %%%%%%%物理化学性质6
% for i=1:firstnum-1
% c= strrep(sequence(i,:),'A','0.620 ');
% c1= strrep(c,'C','0.290 ');
% c2= strrep(c1,'D','-0.900 ');
% c3= strrep(c2,'E','-0.740 ');
% c4= strrep(c3,'F','1.190 ');
% c5= strrep(c4,'G','0.480 ');
% c6= strrep(c5,'H','-0.400 ');
% c7=strrep(c6,'I','1.380 ');
% c8=strrep(c7,'K','-1.500 ');
%  c9=strrep(c8,'L','1.060 ');
%  c10=strrep(c9,'M','0.640 ');
%  c11=strrep(c10,'N','-0.780 ');
%  c12=strrep(c11,'P','0.120 ');
%  c13=strrep(c12,'Q','-0.850 ');
% c14=strrep(c13,'R','-2.530 ');
% c15= strrep(c14,'S','-0.180 ');
% c16= strrep(c15,'T','-0.050 ');
% c17= strrep(c16,'V','1.080 ');
% c18= strrep(c17,'W','0.810 ');
% c19= strrep(c18,'Y','0.260 ');
% b{i}=c19;
% clear c c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19
% end
% xx=[];
% acf=[];
% for ii=1:firstnum-1
%      shuzhi=str2num(b{ii});
%      [hang,changdu]=size(shuzhi);
%     for lamda=1:lamdashu;
%        for j=1:changdu-lamda
%        xx(ii,j)=shuzhi(1,j)*shuzhi(1,j+lamda);
%      end
%       acf(ii,lamda)=sum(xx(ii,1:changdu-lamda))/(changdu-lamda);
%    end
%    clear shuzhi 
% end
% save acf  
% %导入数据
% A=xlsread('317phychen5.xlsx');
% A=[A,acf];
% xlswrite('317phychen6.xlsx',A,'Sheet1','A1');
% % % %%%%%%%物理化学性质7
% for i=1:firstnum-1
% c= strrep(sequence(i,:),'A','-0.500 ');
% c1= strrep(c,'C','-1.000 ');
% c2= strrep(c1,'D','3.000 ');
% c3= strrep(c2,'E','3.000 ');
% c4= strrep(c3,'F','-2.500 ');
% c5= strrep(c4,'G','0.000 ');
% c6= strrep(c5,'H','-0.500 ');
% c7=strrep(c6,'I','-1.800 ');
% c8=strrep(c7,'K','3.000 ');
%  c9=strrep(c8,'L','-1.800 ');
%  c10=strrep(c9,'M','-1.300 ');
%  c11=strrep(c10,'N','2.000 ');
%  c12=strrep(c11,'P','0.000 ');
%  c13=strrep(c12,'Q','0.200 ');
% c14=strrep(c13,'R','3.000 ');
% c15= strrep(c14,'S','0.300 ');
% c16= strrep(c15,'T','-0.400 ');
% c17= strrep(c16,'V','-1.500 ');
% c18= strrep(c17,'W','-3.400 ');
% c19= strrep(c18,'Y','-2.300 ');
% b{i}=c19;
% clear c c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19
% end
% xx=[];
% acf=[];
% for ii=1:firstnum-1
%      shuzhi=str2num(b{ii});
%      [hang,changdu]=size(shuzhi);
%     for lamda=1:lamdashu;
%        for j=1:changdu-lamda
%        xx(ii,j)=shuzhi(1,j)*shuzhi(1,j+lamda);
%      end
%       acf(ii,lamda)=sum(xx(ii,1:changdu-lamda))/(changdu-lamda);
%    end
%    clear shuzhi 
% end
% save acf  
% %导入数据
% A=xlsread('317phychen6.xlsx');
% A=[A,acf];
% xlswrite('317phychen7.xlsx',A,'Sheet1','A1');
% % % %%%%%%%物理化学性质8
% for i=1:firstnum-1
% c= strrep(sequence(i,:),'A','27.500 ');
% c1= strrep(c,'C','44.600 ');
% c2= strrep(c1,'D','40.000 ');
% c3= strrep(c2,'E','62.000 ');
% c4= strrep(c3,'F','115.500 ');
% c5= strrep(c4,'G','0.000 ');
% c6= strrep(c5,'H','79.000 ');
% c7=strrep(c6,'I','93.500 ');
% c8=strrep(c7,'K','100.000 ');
%  c9=strrep(c8,'L','93.500 ');
%  c10=strrep(c9,'M','94.100 ');
%  c11=strrep(c10,'N','58.700 ');
%  c12=strrep(c11,'P','41.900 ');
%  c13=strrep(c12,'Q','80.700 ');
% c14=strrep(c13,'R','105.000 ');
% c15= strrep(c14,'S','29.300 ');
% c16= strrep(c15,'T','51.300 ');
% c17= strrep(c16,'V','71.500 ');
% c18= strrep(c17,'W','145.500 ');
% c19= strrep(c18,'Y','117.300 ');
% b{i}=c19;
% clear c c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19
% end
% xx=[];
% acf=[];
% for ii=1:firstnum-1
%      shuzhi=str2num(b{ii});
%      [hang,changdu]=size(shuzhi);
%     for lamda=1:lamdashu;
%        for j=1:changdu-lamda
%        xx(ii,j)=shuzhi(1,j)*shuzhi(1,j+lamda);
%      end
%       acf(ii,lamda)=sum(xx(ii,1:changdu-lamda))/(changdu-lamda);
%    end
%    clear shuzhi 
% end
% save acf  
% %导入数据
% A=xlsread('317phychen7.xlsx');
% A=[A,acf];
% xlswrite('317phychen8.xlsx',A,'Sheet1','A1');
% % % %%%%%%%物理化学性质9
% for i=1:firstnum-1
% c= strrep(sequence(i,:),'A','0.046 ');
% c1= strrep(c,'C','0.128 ');
% c2= strrep(c1,'D','0.105 ');
% c3= strrep(c2,'E','0.151 ');
% c4= strrep(c3,'F','0.290 ');
% c5= strrep(c4,'G','0.000 ');
% c6= strrep(c5,'H','0.230 ');
% c7=strrep(c6,'I','0.186 ');
% c8=strrep(c7,'K','0.219 ');
%  c9=strrep(c8,'L','0.186 ');
%  c10=strrep(c9,'M','0.221 ');
%  c11=strrep(c10,'N','0.134 ');
%  c12=strrep(c11,'P','0.131 ');
%  c13=strrep(c12,'Q','0.180 ');
% c14=strrep(c13,'R','0.291 ');
% c15= strrep(c14,'S','0.062 ');
% c16= strrep(c15,'T','0.108 ');
% c17= strrep(c16,'V','0.140 ');
% c18= strrep(c17,'W','0.409 ');
% c19= strrep(c18,'Y','0.298 ');
% b{i}=c19;
% clear c c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19
% end
% xx=[];
% acf=[];
% for ii=1:firstnum-1
%      shuzhi=str2num(b{ii});
%      [hang,changdu]=size(shuzhi);
%     for lamda=1:lamdashu;
%        for j=1:changdu-lamda
%        xx(ii,j)=shuzhi(1,j)*shuzhi(1,j+lamda);
%      end
%       acf(ii,lamda)=sum(xx(ii,1:changdu-lamda))/(changdu-lamda);
%    end
%    clear shuzhi 
% end
% save acf  
% %导入数据
% A=xlsread('317phychen8.xlsx');
% A=[A,acf];
% xlswrite('317phychen9.xlsx',A,'Sheet1','A1');
% % % % % % %%%%%%%物理化学性质10
% for i=1:firstnum-1
% c= strrep(sequence(i,:),'A','1.181 ');
% c1= strrep(c,'C','1.461 ');
% c2= strrep(c1,'D','1.587 ');
% c3= strrep(c2,'E','1.862 ');
% c4= strrep(c3,'F','2.228 ');
% c5= strrep(c4,'G','0.881 ');
% c6= strrep(c5,'H','2.025 ');
% c7=strrep(c6,'I','1.810 ');
% c8=strrep(c7,'K','2.258 ');
%  c9=strrep(c8,'L','1.931 ');
%  c10=strrep(c9,'M','2.034 ');
%  c11=strrep(c10,'N','1.655 ');
%  c12=strrep(c11,'P','1.468 ');
%  c13=strrep(c12,'Q','1.932 ');
% c14=strrep(c13,'R','2.560 ');
% c15= strrep(c14,'S','1.298 ');
% c16= strrep(c15,'T','1.525 ');
% c17= strrep(c16,'V','1.645 ');
% c18= strrep(c17,'W','2.663 ');
% c19= strrep(c18,'Y','2.368 ');
% b{i}=c19;
% clear c c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19
% end
%  xx=[];
% acf=[];
% for ii=1:firstnum-1
%      shuzhi=str2num(b{ii});
%      [hang,changdu]=size(shuzhi);
%     for lamda=1:lamdashu;
%        for j=1:changdu-lamda
%        xx(ii,j)=shuzhi(1,j)*shuzhi(1,j+lamda);
%      end
%       acf(ii,lamda)=sum(xx(ii,1:changdu-lamda))/(changdu-lamda);
%    end
%    clear shuzhi 
% end
% save acf  
% %导入数据
% A=xlsread('317phychen9.xlsx');
% A=[A,acf];
% xlswrite('317phychen10.xlsx',A,'Sheet1','A1');
