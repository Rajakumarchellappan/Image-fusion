function R = fusionrule(Y1, Y2,B1,B2)
Y1=SFR(Y1);
Y2=SFR(Y2);       
[m,n]=size(B1);
      for i=1:m
          for j=1:n             
                if abs(Y1(i,j)-Y2(i,j))<=0.015  % This also can be changed to get good results
                   R(i,j)=(B1(i,j)+B2(i,j))/2;      
                end 
                if abs(Y1(i,j)-Y2(i,j))>0.015&&Y1(i,j)>Y2(i,j)
                    R(i,j)=B1(i,j);
                end
                if abs(Y1(i,j)-Y2(i,j))>0.015&& Y1(i,j)<Y2(i,j)
                    R(i,j)=B2(i,j);
                end 
       end
      end