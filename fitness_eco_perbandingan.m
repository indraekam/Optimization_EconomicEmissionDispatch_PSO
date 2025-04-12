function fitness = fitness_eco_perbandingan(arrIndiv, popSize, pPartikel)

    %Aray Fuel Costss Coefficient (Di tabel yang a,b,c)
    arrCost = [];
    arrCost(1, 1) = -9.16689;
    arrCost(1, 2) = 413479.4;
    arrCost(1, 3) = 40667795;
    
    arrCost(2, 1) = -49.9043;
    arrCost(2, 2) = 577947.3;
    arrCost(2, 3) = -14774223;
    
    arrCost(3, 1) = -696.988;
    arrCost(3, 2) = 3937191;
    arrCost(3, 3) = -2560000000;
    
    arrCost(4, 1) = 137.251;
    arrCost(4, 2) = 1254309.5;
    arrCost(4, 3) = 10961381;
    
    arrCost(5, 1) = 3.37162;
    arrCost(5, 2) = 284810.3;
    arrCost(5, 3) = 55581457;
    
    arrCost(6, 1) = 1412.58;
    arrCost(6, 2) = 1018922;
    arrCost(6, 3) = 57269598;
    
    arrCost(7, 1) = 0;
    arrCost(7, 2) = 12000;
    arrCost(7, 3) = 0;
    
    arrCost(8, 1) = 0;
    arrCost(8, 2) = 12000;
    arrCost(8, 3) = 0;


    % Hitung Fitnes berdasarkan Economic Dispatch
    fitness = zeros(popSize, 1, 'double');
    for i = 1 : popSize
        totalEco = 0;
        for j =1 : pPartikel
            if arrIndiv(i,j) == 0
                totalEco =  totalEco + 0;
            else
                totalEco =  totalEco + (arrCost(j, 1) + (arrCost(j,2) * arrIndiv(i,j)) + (arrCost(j, 3) * power(arrIndiv(i,j),2)));  
            end
        end

        fitness(i, 1) = totalEco / 1000;
    end

end