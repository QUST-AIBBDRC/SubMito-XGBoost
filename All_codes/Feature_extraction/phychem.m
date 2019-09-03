%   strrep(str1,str2,str3) 
%   它把str1中所有的str2字串用str3来替换
function [c19] =phychen(c19)
for i=1:firstnum-1
c= strrep(sequence(i,:),'A','8.100');
c1= strrep(c,'C','5.500');
c2= strrep(c1,'D','13.000');
c3= strrep(c2,'E','12.300');
c4= strrep(c3,'I','5.200');
c5= strrep(c4,'K','21.29 ');
c6= strrep(c5,'L','18.78 ');
c7=strrep(c6,'M','21.64 ');
c8=strrep(c7,'N','13.28 ');
 c9=strrep(c8,'P','10.93 ');
 c10=strrep(c9,'Q','17.56 ');
 c11=strrep(c10,'R','26.66 ');
 c12=strrep(c11,'S','6.35 ');
 c13=strrep(c12,'T','11.01 ');
 c14=strrep(c13,'V','13.92 ');
 c15=strrep(c14,'W','42.53 ');
c16= strrep(c15,'Y','31.53 ');
c17= strrep(c16,'G','0 ');
c18= strrep(c17,'H','21.81 ');
c19= strrep(c18,'F','29.40 ');
b{i}=c19;
%li=[li;c19];
%name = strcat('','c19','');
clear c c1 c2 c3 c4 c5 c6 c7 c8 c9 c10 c11 c12 c13 c14 c15 c16 c17 c18 c19
end