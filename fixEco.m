clear;
clc;
tic;
popSize = 1000;
demand = 13000;
pPartikel = 42;

% Inisialisasi Kecepatan
arrV = zeros(popSize, pPartikel);

% Inisialisasi Individu / Partikel
arrIndiv = create_individu_baru(popSize, demand, pPartikel);
    
% arrIndiv



fitness = fitness_eco(arrIndiv, popSize, pPartikel);
% fitness

%Inisialisasi MAXFITNESS untuk reset Fitness
MAXFITNESS = 0;
for i = 1 : popSize
    if fitness(i,1) > MAXFITNESS
        MAXFITNESS = fitness(i, 1);
    end
end

% Inisialisasi PBest
arrPbest = zeros(popSize, pPartikel);
arrPbest = arrIndiv;

fitnessPbest = fitness;

% Insialisasi GBest
indexMin = 1;
fitnessMin = fitness(1,1);
for i = 1 :popSize
    if fitnessMin > fitness(i,1)
        fitnessMin = fitness(i,1);
        indexMin = i;
    end
end

arrGbest = zeros(1, pPartikel);

for i = 1 : pPartikel
    arrGbest(1, i) = arrIndiv(indexMin, i); % cek if BUG or Error
end

fitnessGbest = fitnessMin;

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
    
iterasi = 200;
w = 0.5; %0.4 - 0.9
c1 = 0.4 ; %2.5 - 0.5
c2 = 0.3;
r1 = rand();
r2 = rand();
% k = rand();
k = 0.7;
batasBawahEksplor = demand - 0;
batasAtasEksplor = demand + 10;


    
arrBatasV = zeros(2, pPartikel);

for i = 1 : pPartikel
    arrBatasV(1, i) = k * ((arrBatas(i, 2) - (arrBatas(i, 1))) / 2);
    arrBatasV(2, i) = -arrBatasV(1, i);
end


%% Proses Iterasi
fitnessSama = 0;
indexIterasi = 1;
while fitnessSama < 200 
    
%%    Update Kecepatan
    arrHitung = zeros(popSize);
    for j = 1 : popSize
        hitung = 0;
        for k = 1 : pPartikel
            tempUpdateV = (w * arrV(j,k)) + (c1 * r1 * (arrPbest(j,k) - arrIndiv(j,k))) + (c2 * r2 * (arrGbest(k) - arrIndiv(j,k)));

            if tempUpdateV > arrBatasV(1,k)
                tempUpdateV = arrBatasV(1,k);
            elseif tempUpdateV < arrBatasV(2,k)
                tempUpdateV = arrBatasV(2,k);
            end   
            hitung = hitung + tempUpdateV;
            arrV(j,k) =  tempUpdateV;     
        end

        arrHitung(j) = hitung;
    end
    

    
%% Update Posisi Partikel
    for j = 1 : popSize
        for k = 1 : pPartikel
            tempUpdateV = (w * arrV(j,k)) + (c1 * r1 * (arrPbest(j,k) - arrIndiv(j,k))) + (c2 * r2 * (arrGbest(k) - arrIndiv(j,k)));
            if tempUpdateV > arrBatasV(1,k)
                tempUpdateV = arrBatasV(1,k);
            elseif tempUpdateV < arrBatasV(2,k)
                tempUpdateV = arrBatasV(2,k);
            end   
            arrV(j,k) =  tempUpdateV;     
        end      
    end
    
    
    %% Update Posisi Partikel
    for j = 1 : popSize
        for k = 1 : pPartikel
            if arrIndiv(j,k) + arrV(j,k) >= arrBatas(k,1) && arrIndiv(j,k) + arrV(j,k) <= arrBatas(k,2)
            arrIndiv(j,k) = arrIndiv(j,k) + arrV(j,k);   
            end
        end      
    end
    
    %% Update Pbest dan GBest
    % Hitung fitness dulu
      fitness = fitness_eco(arrIndiv, popSize, pPartikel);
   
    %Cek Apakah Memenuhi Demand
    for j = 1 : popSize
        watIndiv = 0;
        for k = 1 : pPartikel
            watIndiv = watIndiv + arrIndiv(j,k); 
        end    
        if watIndiv < batasBawahEksplor || watIndiv > batasAtasEksplor
            fitness(j, 1) = MAXFITNESS;
        end  
    end
    
    %Update PBest
    for j = 1 : popSize
        if fitness(j,1) < fitnessPbest(j,1)
            fitnessPbest(j,1) = fitness(j,1);
            for k = 1 : pPartikel
                arrPbest(j,k) = arrIndiv(j,k);
            end   
        end     
    end
    
    %Update GBest
    fitnessGbestSebelum  = fitnessGbest;
    tempGbest = fitnessGbest;
    tempIndex = 0;
    for j = 1 : popSize
        if fitness(j,1) < tempGbest
            tempIndex = j;
            tempGbest = fitness(j,1);
        end
    end
    
%     fitnessGbest
    if tempIndex ~= 0
        fitnessGbest = tempGbest;
        for k = 1 : pPartikel
            arrGbest(1, k) = arrIndiv(tempIndex, k);
        end   
    end
    
    %% atur itersi dengan konvergensi dini
    if fitnessGbestSebelum == fitnessGbest
        fitnessSama = fitnessSama +1 ;
    else
        fitnessSama = 0;
    end


    fprintf("Iterasi: %d\n", indexIterasi);
    
    formatted_average = num2str(fitnessGbest, '%.2f, ');
    formatted_average = insertCommas(formatted_average);
    fprintf("Dengan Biaya Operasional  adalah : Rp %s\n", formatted_average);
    indexIterasi = indexIterasi + 1;

end

%% Cari Individu Terbaik 
waktu = toc;
totalBeban = 0;
fprintf("MAX FITNESS : %.2f\n", MAXFITNESS);
for k = 1 : pPartikel
    if arrGbest(1, k) ~= 0
        totalBeban = totalBeban + arrGbest(1,k);
        eco = num2str(hitungEco(k, arrGbest(1,k)), '%.2f, ');
        eco = insertCommas(eco);
        fprintf("Generator ke - %d : dengan Beban %.2f => Biaya : Rp %s \n", k, arrGbest(1,k), eco);
    end
end

fprintf("Total Beban yang dicover adalah : %.2f\n", totalBeban);

formatted_numbers = num2str(fitnessGbest, '%.2f, ');
formatted_numbers = insertCommas(formatted_numbers);
fprintf("Dengan Biaya Operasional adalah : Rp %s\n", formatted_numbers);
fprintf("Jumlah Interasi : %d Iterasi\n", indexIterasi - 1);
fprintf("Waktu Komputasi : %f detik\n", waktu);

 









