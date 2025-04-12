function arrIndiv = create_individu_perbandingan(popSize, demand, pPartikel)

    arrBatas = [];
    arrBatas(1,1) = 1703;
    arrBatas(1,2) = 3247;
    arrBatas(2,1)= 1954;
    arrBatas(2,2)= 2900;
    arrBatas(3,1)= 1401;
    arrBatas(3,2) = 2955;
    arrBatas(4,1)= 529;
    arrBatas(4,2) = 955;
    arrBatas(5,1) = 1221;
    arrBatas(5,2) = 1979;
    arrBatas(6,1) = 320;
    arrBatas(6,2) = 795.6;
    arrBatas(7,1) = 500;
    arrBatas(7,2) = 1000;
    arrBatas(8,1) = 350;
    arrBatas(8,2) = 700;


    arrIndiv = zeros(popSize, pPartikel);
%     Isi Penuh Watt
    for i = 1 : popSize
        for j = 1 : pPartikel
            arrIndiv(i,j) = arrBatas(j,2);
        end
    end
    

    for i = 1 : popSize
        maxWat =  cekMaxPerbandingan();
        totalWat = maxWat - demand;
%        fprintf("%.2f", totalWat);
        shuffle = test_shuffle_perbandingan();
        indexShuffle = 1 ;
        while totalWat > 0
%             fprintf("%.2f\n", totalWat);
            pilihGenerator = shuffle(indexShuffle);     
            jumlahWat = arrBatas(pilihGenerator, 2);
            
%             totalWat = totalWat + jumlahWat;
            if  jumlahWat > totalWat  
%                 totalWat = totalWat - jumlahWat;
                jumlahWat =  randi(floor(arrBatas(pilihGenerator, 2) - arrBatas(pilihGenerator, 1)));
%                 jumlahWat = totalWat;
%                 totalWat = totalWat + jumlahWat;
            end
            
            if  jumlahWat > totalWat  
%                 totalWat = totalWat - jumlahWat;
%                 jumlahWat =  randi(floor(arrBatas(pilihGenerator, 2) - arrBatas(pilihGenerator, 1)));
                jumlahWat = totalWat;
%                 totalWat = totalWat + jumlahWat;
            end
%             fprintf("jumlah watt : %.2f\n", jumlahWat);
            indexShuffle = indexShuffle + 1;
            if (arrIndiv(i, pilihGenerator) - jumlahWat) >= arrBatas(pilihGenerator, 1) || (arrIndiv(i, pilihGenerator) - jumlahWat) == 0
%                 disp("masuk");
                 arrIndiv(i, pilihGenerator) = arrIndiv(i, pilihGenerator) - jumlahWat;
                 totalWat = totalWat - jumlahWat;
            end

            
            if indexShuffle > pPartikel
                indexShuffle = 1;
            end
            

        end
    end
end