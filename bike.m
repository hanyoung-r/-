%2019 11 

Data1 = table2array(bike19111); %각각 csv파일 열어서 순서/위도/경도 2행부터 가져옴
Data2 = table2array(bike19112);
%2019 10
%Data1 = table2array(bike19101); 
%Data2 = table2array(bike19102);
%Data3 = table2array(bike19103);
%2019 09
%Data1 = table2array(bike19091); 
%Data2 = table2array(bike19092);
%Data3 = table2array(bike19093);
%2019 08
%Data1 = table2array(bike19081); 
%Data2 = table2array(bike19082);
%Data3 = table2array(bike19083);
Data = [Data1; Data2];
%Data = [Data1; Data2; Data3];


n = Data(:,1); %순서값

    for k = 99264:102143 %순서값을 1씩 증가하면서

       [a,b] = find(n==k); %k와 n이 같은곳의 행렬값을 찾음
      Datax = Data(a,:);  %그중 행이 n과 같은곳의 열 전체만 가져와서 데이터를 만듬
       x = Datax(:, 2); %위도값
       y = Datax(:, 3); %경도값 
       
%25*25크기에 자전거 대여수 대입하기
    x1=floor(abs(((x-37.518)*10^3)./4.28)+1); %(위도값-위도 최소)*10^3/4.28해서 내림한값->세로위치
    y1=floor(abs(((y-126.879)*10^3)./7.88)+1);%(경도값-경도 최소)*10^3/7.88해서 내림한값->가로위치
    S=sparse(x1, y1, 1, 25, 25);   %위치에 +1 할당
    %B = reshape(S,[1,625]);
    %if k>90432
    %    load ('A.mat','A');
    %     A =vertcat(A,B);        
    %else
    %   A=B;
    %end
     %s=full(A);
    %filename='A';
    %save(filename,'s');
    filename = [pwd,'\',sprintf('%g',k)];
    save(filename,'S')
       
    end
    


