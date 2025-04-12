clear;
clc;
tic;

popSize = 1000;
demand = 11363.4;
pPartikel = 8;

% Inisialisasi Kecepatan
arrV = zeros(popSize, pPartikel);

% Inisialisasi Individu / Partikel
arrIndiv = create_individu_perbandingan(popSize, demand, pPartikel);
    
% arrIndiv



fitness = fitness_eco_perbandingan(arrIndiv, popSize, pPartikel);
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

    arrBatas = [];    arrBatas(1,1) = 1703;
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
      fitness = fitness_eco_perbandingan(arrIndiv, popSize, pPartikel);
   
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
        eco = num2str(hitungEcoPerbandingan(k, arrGbest(1,k)), '%.2f, ');
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

 









