out = "";
fOp = "";
s = textread('teste.txt','%s');
m = cell2mat(s);
crt1 =  (zeros(1,length(s)));  
crt2 =  (zeros(1,length(s)));   
crt3 =  (zeros(1,length(s)));
crt4 =  (zeros(1,length(s)));
crt5 =  (zeros(1,length(s)));
crt6 =  (zeros(1,length(s)));
crt7 =  (zeros(1,length(s)));
crt8 =  (zeros(1,length(s)));
crt9 =  (zeros(1,length(s)));   
crt10 = (zeros(1,length(s)));
crt11 = (zeros(1,length(s)));
crt12 = (zeros(1,length(s)));
crt13 = (zeros(1,length(s)));
crt14 = (zeros(1,length(s)));
crt15 = (zeros(1,length(s)));
crt16 = (zeros(1,length(s)));

max1 = 0.0;
max2 = 0.0;
max3 = 0.0;
max4 = 0.0;
max5 = 0.0;
max6 = 0.0;
max7 = 0.0;
max8 = 0.0;
max9 = 0.0;
max10 = 0.0;
max11 = 0.0;
max12 = 0.0;
max13 = 0.0;
max14 = 0.0;
max15 = 0.0;
max16 = 0.0;

min1 = 0.0;
min2 = 0.0;
min3 = 0.0;
min4 = 0.0;
min5 = 0.0;
min6 = 0.0;
min7 = 0.0;
min8 = 0.0;
min9 = 0.0;
min10 = 0.0;
min11 = 0.0;
min12 = 0.0;
min13 = 0.0;
min14 = 0.0;
min15 = 0.0;
min16 = 0.0;


for k=1:length(s)    
    fOp = strcat('baseReal',m(k,1),m(k,2),m(k,3),m(k,4),m(k,5),m(k,6),m(k,7),m(k,8),m(k,9),m(k,10),m(k,11),m(k,12),m(k,13),m(k,14),m(k,15));
    #fileName=strcat(m(k,4),m(k,5),m(k,6),m(k,7),m(k,8),m(k,9),m(k,10),m(k,11),m(k,12),m(k,13),m(k,14),m(k,15));
    #arquivo=strcat('baseReal',m(k,1),m(k,2));
    class = m(k,2);
    img = imread(fOp);
    
    lineIndex = int32(zeros(1,4));   #Vetor com o range dos quadrantes em linhas 
    columnIndex = int32(zeros(1,4)); #Vetor com o range dos quadrantes em colunas
    dimensoes = size(img);
    linhas = int32(dimensoes(1));
    colunas = int32(dimensoes(2));

    acrescimoLinhas = int32(linhas/4); 
    acrescimoColunas = int32(colunas/4);

    #Vetores de zoneamento lineIndex e columnIndex
    lineIndex(1,1) = int32(acrescimoLinhas);
    lineIndex(1,2) = int32(acrescimoLinhas*2);
    lineIndex(1,3) = int32(acrescimoLinhas*3);
    lineIndex(1,4) = int32(linhas);

    columnIndex(1,1) = acrescimoColunas;
    columnIndex(1,2) = acrescimoColunas*2;
    columnIndex(1,3) = acrescimoColunas*3;
    columnIndex(1,4) = colunas;

    #Percorrer as 16 zonas e contar os pixels
    ic = int32(zeros(1,16));
    #Primeira zona 1 1
    for l = 1:lineIndex(1,1)
      for c = 1:columnIndex(1,1)
        if(int32(img(l,c)) == 1)
          ic(1,1) = ic(1,1)+1;
        end
      end
    end
    #Segunda zona 1 2
    for l = 1:lineIndex(1,1)
      for c = columnIndex(1,1)+1:columnIndex(1,2)
        if(img(l,c) == 1)
          ic(1,2) = ic(1,2)+1;
        end
      end
    end
    #Terceira zona 1 3
    for l = 1:lineIndex(1,1)
      for c = columnIndex(1,2)+1:columnIndex(1,3)
        if(img(l,c) == 1)
          ic(1,3) = ic(1,3)+1;
        end
      end
    end
    #Quarta zona 1 4
    for l = 1:lineIndex(1,1)
      for c = columnIndex(1,3)+1:columnIndex(1,4)
        if(img(l,c) == 1)
          ic(1,4) = ic(1,4)+1;
        end
      end
    end

    #Quinta zona 2 1
    for l = lineIndex(1,1)+1:lineIndex(1,2)
      for c = 1:columnIndex(1,1)
        if(img(l,c) == 1)
          ic(1,5) = ic(1,5)+1;
        end
      end
    end
    #Sexta zona 2 2
    for l = lineIndex(1,1)+1:lineIndex(1,2)
      for c = columnIndex(1,1)+1:columnIndex(1,2)
        if(img(l,c) == 1)
          ic(1,6) = ic(1,6)+1;
        end
      end
    end
    #Setima zona 2 3
    for l = lineIndex(1,1)+1:lineIndex(1,2)
      for c = columnIndex(1,2)+1:columnIndex(1,3)
        if(img(l,c) == 1)
          ic(1,7) = ic(1,7)+1;
        end
      end
    end
    #Oitava zona 2 4
    for l = lineIndex(1,1)+1:lineIndex(1,2)
      for c = columnIndex(1,3)+1:columnIndex(1,4)
        if(img(l,c) == 1)
          ic(1,8) = ic(1,8)+1;
        end
      end
    end

    #Nona zona 3 1
    for l = lineIndex(1,2)+1:lineIndex(1,3)
      for c = 1:columnIndex(1,1)
        if(img(l,c) == 1)
          ic(1,9) = ic(1,9)+1;
        end
      end
    end
    #Decima zona 3 2
    for l = lineIndex(1,2)+1:lineIndex(1,3)
      for c = columnIndex(1,1)+1:columnIndex(1,2)
        if(img(l,c) == 1)
          ic(1,10) = ic(1,10)+1;
        end
      end
    end
    #11 zona 3 3
    for l = lineIndex(1,2)+1:lineIndex(1,3)
      for c = columnIndex(1,2)+1:columnIndex(1,3)
        if(img(l,c) == 1)
          ic(1,11) = ic(1,11)+1;
        end
      end
    end
    #12 zona 3 4
    for l = lineIndex(1,2)+1:lineIndex(1,3)
      for c = columnIndex(1,3)+1:columnIndex(1,4)
        if(img(l,c) == 1)
          ic(1,12) = ic(1,12)+1;
        end
      end
    end

    #13 zona 4 1
    for l = lineIndex(1,3)+1:lineIndex(1,4)
      for c = 1:columnIndex(1,1)
        if(img(l,c) == 1)
          ic(1,13) = ic(1,13)+1;
        end
      end
    end
    #14 zona 4 2
    for l = lineIndex(1,3)+1:lineIndex(1,4)
      for c = columnIndex(1,1)+1:columnIndex(1,2)
        if(img(l,c) == 1)
          ic(1,14) = ic(1,14)+1;
        end
      end
    end
    #15 zona 4 3
    for l = lineIndex(1,3)+1:lineIndex(1,4)
      for c = columnIndex(1,2)+1:columnIndex(1,3)
        if(img(l,c) == 1)
          ic(1,15) = ic(1,15)+1;
        end
      end
    end
    #16 zona 4 4
    for l = lineIndex(1,3)+1:lineIndex(1,4)
      for c = columnIndex(1,3)+1:columnIndex(1,4)
        if(img(l,c) == 1)
          ic(1,16) = ic(1,16)+1;
        end
      end
    end

    #printf ("%d,%d,%d,%d,%d,%d,%d,%d,%d %d %d %d %d %d %d %d,%s\n",ic(1),ic(2),ic(3),ic(4),ic(5),ic(6),ic(7),ic(8),ic(9),ic(10),ic(11),ic(12),ic(13),ic(14),ic(15),ic(16),class);
                            
     crt1(k) =  ic(1);
     crt2(k) =  ic(2);
     crt3(k) =  ic(3);
     crt4(k) =  ic(4);
     crt5(k) =  ic(5);
     crt6(k) =  ic(6);
     crt7(k) =  ic(7);
     crt8(k) =  ic(8);
     crt9(k) =  ic(9);
     crt10(k) = ic(10);
     crt11(k) = ic(11);
     crt12(k) = ic(12);
     crt13(k) = ic(13);
     crt14(k) = ic(14);
     crt15(k) = ic(15);
     crt16(k) = ic(16); 
end
max1 = max(crt1);
max2 = max(crt2);
max3 = max(crt3);
max4 = max(crt4);
max5 = max(crt5);
max6 = max(crt6);
max7 = max(crt7);
max8 = max(crt8);
max9 = max(crt9);
max10 = max(crt10);
max11 = max(crt11);
max12 = max(crt12);
max13 = max(crt13);
max14 = max(crt14);
max15 = max(crt15);
max16 = max(crt16);

min1 = min(crt1);
min2 = min(crt2);
min3 = min(crt3);
min4 = min(crt4);
min5 = min(crt5);
min6 = min(crt6);
min7 = min(crt7);
min8 = min(crt8);
min9 = min(crt9);
min10 = min(crt10);
min11 = min(crt11);
min12 = min(crt12);
min13 = min(crt13);
min14 = min(crt14);
min15 = min(crt15);
min16 = min(crt16);

for k=1:length(s)
  class = m(k,2);
  crt1(k)=(crt1(k)-min1)/(max1-min1);
  crt2(k)=(crt2(k)-min2)/(max2-min2);
  crt3(k)=(crt3(k)-min3)/(max3-min3);
  crt4(k)=(crt4(k)-min4)/(max4-min4);
  crt5(k)=(crt5(k)-min5)/(max5-min5);
  crt6(k)=(crt6(k)-min6)/(max6-min6);
  crt7(k)=(crt7(k)-min7)/(max7-min7);
  crt8(k)=(crt8(k)-min8)/(max8-min8);
  crt9(k)=(crt9(k)-min9)/(max9-min9);  
  crt10(k)=(crt10(k)-min10)/(max10-min10);
  crt11(k)=(crt11(k)-min11)/(max11-min11);
  crt12(k)=(crt12(k)-min12)/(max12-min12);
  crt13(k)=(crt13(k)-min13)/(max13-min13);
  crt14(k)=(crt14(k)-min14)/(max14-min14);
  crt15(k)=(crt15(k)-min15)/(max15-min15);
  crt16(k)=(crt16(k)-min16)/(max16-min16);
  printf ("%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%f,%s\n",crt1(k),crt2(k),crt3(k),crt4(k),crt5(k),crt6(k),crt7(k),crt8(k),crt9(k),crt10(k),crt11(k),crt12(k),crt13(k),crt14(k),crt15(k),crt16(k),class);
  out = strcat(out,num2str(crt1(k))); out = strcat(out,',');
  out = strcat(out,num2str (crt2(k))); out = strcat(out,',');
  out = strcat(out,num2str (crt3(k))); out = strcat(out,',');
  out = strcat(out,num2str (crt4(k))); out = strcat(out,',');
  out = strcat(out,num2str (crt5(k))); out = strcat(out,',');
  out = strcat(out,num2str (crt6(k))); out = strcat(out,',');
  out = strcat(out,num2str (crt7(k))); out = strcat(out,',');
  out = strcat(out,num2str (crt8(k))); out = strcat(out,',');
  out = strcat(out,num2str (crt9(k))); out = strcat(out,',');  
  out = strcat(out,num2str (crt10(k))); out = strcat(out,',');
  out = strcat(out,num2str (crt11(k))); out = strcat(out,',');
  out = strcat(out,num2str (crt12(k))); out = strcat(out,',');
  out = strcat(out,num2str (crt13(k))); out = strcat(out,',');
  out = strcat(out,num2str (crt14(k))); out = strcat(out,',');
  out = strcat(out,num2str (crt15(k))); out = strcat(out,',');
  out = strcat(out,num2str (crt16(k))); out = strcat(out,',');
  out = strcat(out,class); out = strcat(out,toascii("\n"));
end

filename = "testeSaida16.txt";
fid = fopen (filename, "w");
fputs(fid, out);