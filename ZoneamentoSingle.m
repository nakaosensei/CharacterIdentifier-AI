#Ideia:
# Bem, pensei em utilizar contagem de pixel 1, com um zoneamento
# de 9 sobre as imagens, gerando 9 caracteristicas para cada instancia.
# Para fazer o zoneamento, irei criar dois vetores, indicando os limites
# de cada zona em cada dimensao, sendo o vetor coluna:
# [ x1, x2, x3 ]
# A ideia e que o valor do x1 delimite a ultima coluna 
# do primeiro bloco das colunas, exemplo:
# Para a matriz:
# A ideia e que x1=2, x2=4 e x3=6, pois para as colunas,
# as posicoes menores ou iguais a 2 serao da primeira zona,
# as posicoes maiores que 2 e menores ou igual a 4 da segunda,
#e as maiores que 4 e menores que 6 serao da terceira zona.
# 1 1 0 0 1 1 
# 1 1 1 1 1 1
# 0 0 0 0 0 0
# 1 1 1 1 1 1
# 0 0 0 0 0 0
# O vetor linha = [ y1, y2, y3 ]
# y1=1, y2=2, y3=6
# Umas vez tendo os vetores linha e coluna, deve-se percorrer todas as zonas
# da imagem usando os vetores, para cada zona, contar quantos pixels existem, e salvar.

class = "i";
img = imread("i1.bmp");


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

    disp(img);
    printf ("%d,%d,%d,%d,%d,%d,%d,%d,%d %d %d %d %d %d %d %d,%s\n",ic(1),ic(2),ic(3),ic(4),ic(5),ic(6),ic(7),ic(8),ic(9),ic(10),ic(11),ic(12),ic(13),ic(14),ic(15),ic(16),class);






