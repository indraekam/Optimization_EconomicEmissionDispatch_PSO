function fitness = fitness_eco_emi(arrIndiv, popSize, pPartikel)
    %Aray Fuel Costss Coefficient (Di tabel yang a,b,c)
    arrCostEco = [];
    arrCostEco(1, 1) = 1.06;
    arrCostEco(1, 2) = -796.5;
    arrCostEco(1, 3) = 500770.41;
    arrCostEco(2, 1) = 1.06;
    arrCostEco(2, 2) = -796.5;
    arrCostEco(2, 3) = 500770.41;
    arrCostEco(3, 1) = 1.06;
    arrCostEco(3, 2) = -796.5;
    arrCostEco(3, 3) = 500770.41;
    arrCostEco(4, 1) = 1.06;
    arrCostEco(4, 2) = -796.5;
    arrCostEco(4, 3) = 500770.41;
    arrCostEco(5, 1) = 0.53;
    arrCostEco(5, 2) = -580.731;
    arrCostEco(5, 3) = 548169.063;
    arrCostEco(6, 1) = 0.53;
    arrCostEco(6, 2) = -580.731;
    arrCostEco(6, 3) = 548169.063;
    arrCostEco(7, 1) = 0.53;
    arrCostEco(7, 2) = -580.731;
    arrCostEco(7, 3) = 548169.063;
    arrCostEco(8, 1) = 0;
    arrCostEco(8, 2) = 0;
    arrCostEco(8, 3) = 10000;
    arrCostEco(9, 1) = 0;
    arrCostEco(9, 2) = 0;
    arrCostEco(9, 3) = 10000;
    arrCostEco(10, 1) = 0;
    arrCostEco(10, 2) = 0;
    arrCostEco(10, 3) = 10000;
    arrCostEco(11, 1) = 0;
    arrCostEco(11, 2) = 0;
    arrCostEco(11, 3) = 10000;
    arrCostEco(12, 1) = -29.86;
    arrCostEco(12, 2) = 2116.1058;
    arrCostEco(12, 3) = 578256.403;
    arrCostEco(13, 1) = -29.86;
    arrCostEco(13, 2) = 2116.1058;
    arrCostEco(13, 3) = 578256.403;
    arrCostEco(14, 1) = -1.88;
    arrCostEco(14, 2) = 253.0934;
    arrCostEco(14, 3) = 437774.976;
    arrCostEco(15, 1) = -1.88;
    arrCostEco(15, 2) = 253.0934;
    arrCostEco(15, 3) = 437774.976;
    arrCostEco(16, 1) = 1.661;
    arrCostEco(16, 2) = -1475.578;
    arrCostEco(16, 3) = 674957.404;
    arrCostEco(17, 1) = 1.661;
    arrCostEco(17, 2) = -1475.578;
    arrCostEco(17, 3) = 674957.404;
    arrCostEco(18, 1) = 1.661;
    arrCostEco(18, 2) = -1475.578;
    arrCostEco(18, 3) = 674957.404;
    arrCostEco(19, 1) = 967.659;
    arrCostEco(19, 2) = -26243.28;
    arrCostEco(19, 3) = 837352.902;
    arrCostEco(20, 1) = 967.659;
    arrCostEco(20, 2) = -26243.28;
    arrCostEco(20, 3) = 837352.902;
    arrCostEco(21, 1) = 0;
    arrCostEco(21, 2) = 0;
    arrCostEco(21, 3) = 15000;
    arrCostEco(22, 1) = 0;
    arrCostEco(22, 2) = 0;
    arrCostEco(22, 3) = 15000;
    arrCostEco(23, 1) = 0;
    arrCostEco(23, 2) = 0;
    arrCostEco(23, 3) = 15000;
    arrCostEco(24, 1) = 0;
    arrCostEco(24, 2) = 0;
    arrCostEco(24, 3) = 15000;
    arrCostEco(25, 1) = 0;
    arrCostEco(25, 2) = 0;
    arrCostEco(25, 3) = 15000;
    arrCostEco(26, 1) = 0;
    arrCostEco(26, 2) = 0;
    arrCostEco(26, 3) = 15000;
    arrCostEco(27, 1) = 0;
    arrCostEco(27, 2) = 0;
    arrCostEco(27, 3) = 15000;
    arrCostEco(28, 1) = 0;
    arrCostEco(28, 2) = 0;
    arrCostEco(28, 3) = 15000;
    arrCostEco(29, 1) = 0.67;
    arrCostEco(29, 2) = -803.4;
    arrCostEco(29, 3) = 664191.82;
    arrCostEco(30, 1) = 0.67;
    arrCostEco(30, 2) = -803.4;
    arrCostEco(30, 3) = 664191.82;
    arrCostEco(31, 1) = 0.67;
    arrCostEco(31, 2) = -803.4;
    arrCostEco(31, 3) = 664191.82;
    arrCostEco(32, 1) = 0.67;
    arrCostEco(32, 2) = -803.4;
    arrCostEco(32, 3) = 664191.82;
    arrCostEco(33, 1) = -5.98;
    arrCostEco(33, 2) = 61.9058;
    arrCostEco(33, 3) = 620176.752;
    arrCostEco(34, 1) = 2.429;
    arrCostEco(34, 2) = -2101.891;
    arrCostEco(34, 3) = 934134.238;
    arrCostEco(35, 1) = 2.429;
    arrCostEco(35, 2) = -2101.891;
    arrCostEco(35, 3) = 934134.238;
    arrCostEco(36, 1) = 0.536;
    arrCostEco(36, 2) = -727.78;
    arrCostEco(36, 3) = 828790.263;
    arrCostEco(37, 1) = 1.071;
    arrCostEco(37, 2) = -1494.774;
    arrCostEco(37, 3) = 1142590.01;
    arrCostEco(38, 1) = 4.045;
    arrCostEco(38, 2) = -3723.275;
    arrCostEco(38, 3) = 1659160.91;
    arrCostEco(39, 1) = 4.045;
    arrCostEco(39, 2) = -3723.275;
    arrCostEco(39, 3) = 1659160.91;
    arrCostEco(40, 1) = 13.045;
    arrCostEco(40, 2) = -5341.694;
    arrCostEco(40, 3) = 1068419.16;
    arrCostEco(41, 1) = 1.36;
    arrCostEco(41, 2) = -963.92;
    arrCostEco(41, 3) = 541408.16;
    arrCostEco(42, 1) = 1.36;
    arrCostEco(42, 2) = -963.92;
    arrCostEco(42, 3) = 541408.16;
    
%     Emi
        arrCostEmi = [];
    arrCostEmi(1, 1) = 23.0041;
    arrCostEmi(1, 2) = -1.2414;
    arrCostEmi(1, 3) = 0.0142;
    arrCostEmi(2, 1) = 23.0041;
    arrCostEmi(2, 2) = -1.2414;
    arrCostEmi(2, 3) =  0.0142;
    arrCostEmi(3, 1) = 23.0041;
    arrCostEmi(3, 2) = -1.2414;
    arrCostEmi(3, 3) =  0.0142;
    arrCostEmi(4, 1) = 23.0041;
    arrCostEmi(4, 2) = -1.2414;
    arrCostEmi(4, 3) =  0.0142;
    
    arrCostEmi(5, 1) = 331.0012;
    arrCostEmi(5, 2) = -3.8812;
    arrCostEmi(5, 3) = 0.0512;
    arrCostEmi(6, 1) = 331.0012;
    arrCostEmi(6, 2) = -3.8812;
    arrCostEmi(6, 3) = 0.0512;
    arrCostEmi(7, 1) = 331.0012;
    arrCostEmi(7, 2) = -3.8812;
    arrCostEmi(7, 3) = 0.0512;
    
    arrCostEmi(8, 1) = 0;
    arrCostEmi(8, 2) = 0;
    arrCostEmi(8, 3) = 0;
    arrCostEmi(9, 1) = 0;
    arrCostEmi(9, 2) = 0;
    arrCostEmi(9, 3) = 0;
    arrCostEmi(10, 1) = 0;
    arrCostEmi(10, 2) = 0;
    arrCostEmi(10, 3) = 0;
    arrCostEmi(11, 1) = 0;
    arrCostEmi(11, 2) = 0;
    arrCostEmi(11, 3) = 0;
    
    arrCostEmi(12, 1) = 330.0021;
    arrCostEmi(12, 2) = -3.7884;
    arrCostEmi(12, 3) =0.04332;
    arrCostEmi(13, 1) = 330.0021;
    arrCostEmi(13, 2) = -3.7884;
    arrCostEmi(13, 3) =0.04332;
    
    arrCostEmi(14, 1) =14.9231;
    arrCostEmi(14, 2) =-0.3277;
    arrCostEmi(14, 3) =0.3485;
    arrCostEmi(15, 1) =14.9231;
    arrCostEmi(15, 2) =-0.3277;
    arrCostEmi(15, 3) =0.3485;
    
    arrCostEmi(16, 1) =49.823;
    arrCostEmi(16, 2) =-0.2134;
    arrCostEmi(16, 3) =0.0423;
    arrCostEmi(17, 1) =49.823;
    arrCostEmi(17, 2) =-0.2134;
    arrCostEmi(17, 3) =0.0423;
    arrCostEmi(18, 1) =49.823;
    arrCostEmi(18, 2) =-0.2134;
    arrCostEmi(18, 3) =0.0423;
    
    arrCostEmi(19, 1) =387.121;
    arrCostEmi(19, 2) =-0.3213;
    arrCostEmi(19, 3) =0.0113;
    arrCostEmi(20, 1) =387.121;
    arrCostEmi(20, 2) =-0.3213;
    arrCostEmi(20, 3) =0.0113;
    
    
    arrCostEmi(21, 1) = 0;
    arrCostEmi(21, 2) = 0;
    arrCostEmi(21, 3) =0;
    arrCostEmi(22, 1) = 0;
    arrCostEmi(22, 2) = 0;
    arrCostEmi(22, 3) =0;
    arrCostEmi(23, 1) = 0;
    arrCostEmi(23, 2) = 0;
    arrCostEmi(23, 3) =0;
    arrCostEmi(24, 1) = 0;
    arrCostEmi(24, 2) = 0;
    arrCostEmi(24, 3) =0;
    arrCostEmi(25, 1) = 0;
    arrCostEmi(25, 2) = 0;
    arrCostEmi(25, 3) =0;
    arrCostEmi(26, 1) = 0;
    arrCostEmi(26, 2) = 0;
    arrCostEmi(26, 3) =0;
    arrCostEmi(27, 1) = 0;
    arrCostEmi(27, 2) = 0;
    arrCostEmi(27, 3) =0;
    arrCostEmi(28, 1) = 0;
    arrCostEmi(28, 2) = 0;
    arrCostEmi(28, 3) =0;
    
    arrCostEmi(29, 1) =44.0031;
    arrCostEmi(29, 2) =-4.4123;
    arrCostEmi(29, 3) =0.0556;
    arrCostEmi(30, 1) =44.0031;
    arrCostEmi(30, 2) =-4.4123;
    arrCostEmi(30, 3) =0.0556;
    arrCostEmi(31, 1) =44.0031;
    arrCostEmi(31, 2) =-4.4123;
    arrCostEmi(31, 3) =0.0556;
    arrCostEmi(32, 1) =44.0031;
    arrCostEmi(32, 2) =-4.4123;
    arrCostEmi(32, 3) =0.0556;
    
    arrCostEmi(33, 1) = 21.0334;
    arrCostEmi(33, 2) = -0.6224;
    arrCostEmi(33, 3) = 0.0345;
    
    arrCostEmi(34, 1) = 559.441;
    arrCostEmi(34, 2) = -0.9412;
    arrCostEmi(34, 3) = 0.0553;
    arrCostEmi(35, 1) = 559.441;
    arrCostEmi(35, 2) = -0.9412;
    arrCostEmi(35, 3) = 0.0553;
    
    arrCostEmi(36, 1) = 12.9953;
    arrCostEmi(36, 2) = -0.2339;
    arrCostEmi(36, 3) = 0.0332;
    
    arrCostEmi(37, 1) = 34.8343;
    arrCostEmi(37, 2) = -0.1584;
    arrCostEmi(37, 3) = 0.0848;
    
    arrCostEmi(38, 1) = 55.0012;
    arrCostEmi(38, 2) = -5.4332;
    arrCostEmi(38, 3) = 0.0823;
    arrCostEmi(39, 1) = 55.0012;
    arrCostEmi(39, 2) = -5.4332;
    arrCostEmi(39, 3) = 0.0823;
    
    arrCostEmi(40, 1) = 32.4525;
    arrCostEmi(40, 2) = -0.4123;
    arrCostEmi(40, 3) = 0.04231;
    
    arrCostEmi(41, 1) = 22.8831;
    arrCostEmi(41, 2) = -1.2321;
    arrCostEmi(41, 3) = 0.0112;
    arrCostEmi(42, 1) = 22.8831;
    arrCostEmi(42, 2) = -1.2321;
    arrCostEmi(42, 3) = 0.0112;


    % Hitung Fitnes berdasarkan Economic Dispatch
    fitness = zeros(popSize, 1, 'double');
    for i = 1 : popSize
        totalEcoEmi = 0;
        for j =1 : pPartikel
            if arrIndiv(i,j) == 0
                totalEcoEmi =  totalEcoEmi + 0;
            else
                totalEcoEmi =  totalEcoEmi + ((arrCostEco(j, 1) + (arrCostEco(j,2) * arrIndiv(i,j)) + (arrCostEco(j, 3) * power(arrIndiv(i,j),2))) + (arrCostEmi(j, 1) + (arrCostEmi(j,2) * arrIndiv(i,j)) + (arrCostEmi(j, 3) * power(arrIndiv(i,j),2))));  
            end
        end

        fitness(i, 1) = totalEcoEmi;
    end
end

