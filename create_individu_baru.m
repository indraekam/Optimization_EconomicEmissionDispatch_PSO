function arrIndiv = create_individu_baru(popSize, demand, pPartikel)

    arrBatas = [];
    arrBatas(1,1) = 250;
    arrBatas(1,2) = 371.5;
    arrBatas(2,1)= 250;
    arrBatas(2,2)= 371.5;
    arrBatas(3,1)= 250;
    arrBatas(3,2) = 371.5;
    arrBatas(4,1)= 250;
    arrBatas(4,2) = 371.5;
    arrBatas(5,1) = 408;
    arrBatas(5,2) = 575;
    arrBatas(6,1) = 408;
    arrBatas(6,2) = 575;
    arrBatas(7,1) = 408;
    arrBatas(7,2) = 575;
    arrBatas(8,1) = 87.5;
    arrBatas(8,2) = 174.6;
    arrBatas(9,1) = 87.5;
    arrBatas(9,2) = 174.6;
    arrBatas(10,1) = 87.5;
    arrBatas(10,2) = 174.6;
    arrBatas(11,1) = 87.5;
    arrBatas(11,2) = 174.6;
    arrBatas(12,1) = 40;
    arrBatas(12,2) = 80;
    arrBatas(13,1) = 40;
    arrBatas(13,2) = 80;
    arrBatas(14,1) = 75;
    arrBatas(14,2) = 170;
    arrBatas(15,1) = 75;
    arrBatas(15,2) = 170;
    arrBatas(16,1) = 220;
    arrBatas(16,2) = 480;
    arrBatas(17,1) = 220;
    arrBatas(17,2) = 480;
    arrBatas(18,1) = 220;
    arrBatas(18,2) = 480;
    arrBatas(19,1) = 5;
    arrBatas(19,2) = 16;
    arrBatas(20,1) = 5;
    arrBatas(20,2) = 16;
    arrBatas(21,1) = 60;
    arrBatas(21,2) = 118.5;
    arrBatas(22,1) = 60;
    arrBatas(22,2) = 118.5;
    arrBatas(23,1) = 60;
    arrBatas(23,2) = 118.5;
    arrBatas(24,1) = 60;
    arrBatas(24,2) = 118.5;
    arrBatas(25,1) = 60;
    arrBatas(25,2) = 118.5;
    arrBatas(26,1) = 60;
    arrBatas(26,2) = 118.5;
    arrBatas(27,1) = 60;
    arrBatas(27,2) = 118.5;
    arrBatas(28,1) = 60;
    arrBatas(28,2) = 118.5;
    arrBatas(29,1) = 400;
    arrBatas(29,2) = 661;
    arrBatas(30,1) = 400;
    arrBatas(30,2) = 661;
    arrBatas(31,1) = 400;
    arrBatas(31,2) = 661;
    arrBatas(32,1) = 400;
    arrBatas(32,2) = 661;
    arrBatas(33,1) = 120;
    arrBatas(33,2) = 140;
    arrBatas(34,1) = 200;
    arrBatas(34,2) = 459;
    arrBatas(35,1) = 200;
    arrBatas(35,2) = 459;
    arrBatas(36,1) = 345;
    arrBatas(36,2) = 640;
    arrBatas(37,1) = 180;
    arrBatas(37,2) = 274;
    arrBatas(38,1) = 200;
    arrBatas(38,2) = 420;
    arrBatas(39,1) = 200;
    arrBatas(39,2) = 420;
    arrBatas(40,1) = 180;
    arrBatas(40,2) = 214;
    arrBatas(41,1) = 250;
    arrBatas(41,2) = 370;
    arrBatas(42,1) = 250;
    arrBatas(42,2) = 370;


    arrIndiv = zeros(popSize, pPartikel);
%     Isi Penuh Watt
    for i = 1 : popSize
        for j = 1 : pPartikel
            arrIndiv(i,j) = arrBatas(j,2);
        end
    end
    

    for i = 1 : popSize
        maxWat =  cekMax();
        totalWat = maxWat - demand;
%        fprintf("%.2f", totalWat);
        shuffle = test_shuffle();
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

            
            if indexShuffle > 42
                indexShuffle = 1;
            end
            

        end
    end
end