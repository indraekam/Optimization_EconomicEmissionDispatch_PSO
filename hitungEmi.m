function totalEmi = hitungEmi(indexGenerator, watt)
%HITUNGECO Summary of this function goes here

%Aray Fuel Costss Coefficient (Di tabel yang a,b,c)
    arrCost = [];
    arrCost(1, 1) = 23.0041;
    arrCost(1, 2) = -1.2414;
    arrCost(1, 3) = 0.0142;
    arrCost(2, 1) = 23.0041;
    arrCost(2, 2) = -1.2414;
    arrCost(2, 3) =  0.0142;
    arrCost(3, 1) = 23.0041;
    arrCost(3, 2) = -1.2414;
    arrCost(3, 3) =  0.0142;
    arrCost(4, 1) = 23.0041;
    arrCost(4, 2) = -1.2414;
    arrCost(4, 3) =  0.0142;
    
    arrCost(5, 1) = 331.0012;
    arrCost(5, 2) = -3.8812;
    arrCost(5, 3) = 0.0512;
    arrCost(6, 1) = 331.0012;
    arrCost(6, 2) = -3.8812;
    arrCost(6, 3) = 0.0512;
    arrCost(7, 1) = 331.0012;
    arrCost(7, 2) = -3.8812;
    arrCost(7, 3) = 0.0512;
    
    arrCost(8, 1) = 0;
    arrCost(8, 2) = 0;
    arrCost(8, 3) = 0;
    arrCost(9, 1) = 0;
    arrCost(9, 2) = 0;
    arrCost(9, 3) = 0;
    arrCost(10, 1) = 0;
    arrCost(10, 2) = 0;
    arrCost(10, 3) = 0;
    arrCost(11, 1) = 0;
    arrCost(11, 2) = 0;
    arrCost(11, 3) = 0;
    
    arrCost(12, 1) = 330.0021;
    arrCost(12, 2) = -3.7884;
    arrCost(12, 3) =0.04332;
    arrCost(13, 1) = 330.0021;
    arrCost(13, 2) = -3.7884;
    arrCost(13, 3) =0.04332;
    
    arrCost(14, 1) =14.9231;
    arrCost(14, 2) =-0.3277;
    arrCost(14, 3) =0.3485;
    arrCost(15, 1) =14.9231;
    arrCost(15, 2) =-0.3277;
    arrCost(15, 3) =0.3485;
    
    arrCost(16, 1) =49.823;
    arrCost(16, 2) =-0.2134;
    arrCost(16, 3) =0.0423;
    arrCost(17, 1) =49.823;
    arrCost(17, 2) =-0.2134;
    arrCost(17, 3) =0.0423;
    arrCost(18, 1) =49.823;
    arrCost(18, 2) =-0.2134;
    arrCost(18, 3) =0.0423;
    
    arrCost(19, 1) =387.121;
    arrCost(19, 2) =-0.3213;
    arrCost(19, 3) =0.0113;
    arrCost(20, 1) =387.121;
    arrCost(20, 2) =-0.3213;
    arrCost(20, 3) =0.0113;
    
    
    arrCost(21, 1) = 0;
    arrCost(21, 2) = 0;
    arrCost(21, 3) =0;
    arrCost(22, 1) = 0;
    arrCost(22, 2) = 0;
    arrCost(22, 3) =0;
    arrCost(23, 1) = 0;
    arrCost(23, 2) = 0;
    arrCost(23, 3) =0;
    arrCost(24, 1) = 0;
    arrCost(24, 2) = 0;
    arrCost(24, 3) =0;
    arrCost(25, 1) = 0;
    arrCost(25, 2) = 0;
    arrCost(25, 3) =0;
    arrCost(26, 1) = 0;
    arrCost(26, 2) = 0;
    arrCost(26, 3) =0;
    arrCost(27, 1) = 0;
    arrCost(27, 2) = 0;
    arrCost(27, 3) =0;
    arrCost(28, 1) = 0;
    arrCost(28, 2) = 0;
    arrCost(28, 3) =0;
    
    arrCost(29, 1) =44.0031;
    arrCost(29, 2) =-4.4123;
    arrCost(29, 3) =0.0556;
    arrCost(30, 1) =44.0031;
    arrCost(30, 2) =-4.4123;
    arrCost(30, 3) =0.0556;
    arrCost(31, 1) =44.0031;
    arrCost(31, 2) =-4.4123;
    arrCost(31, 3) =0.0556;
    arrCost(32, 1) =44.0031;
    arrCost(32, 2) =-4.4123;
    arrCost(32, 3) =0.0556;
    
    arrCost(33, 1) = 21.0334;
    arrCost(33, 2) = -0.6224;
    arrCost(33, 3) = 0.0345;
    
    arrCost(34, 1) = 559.441;
    arrCost(34, 2) = -0.9412;
    arrCost(34, 3) = 0.0553;
    arrCost(35, 1) = 559.441;
    arrCost(35, 2) = -0.9412;
    arrCost(35, 3) = 0.0553;
    
    arrCost(36, 1) = 12.9953;
    arrCost(36, 2) = -0.2339;
    arrCost(36, 3) = 0.0332;
    
    arrCost(37, 1) = 34.8343;
    arrCost(37, 2) = -0.1584;
    arrCost(37, 3) = 0.0848;
    
    arrCost(38, 1) = 55.0012;
    arrCost(38, 2) = -5.4332;
    arrCost(38, 3) = 0.0823;
    arrCost(39, 1) = 55.0012;
    arrCost(39, 2) = -5.4332;
    arrCost(39, 3) = 0.0823;
    
    arrCost(40, 1) = 32.4525;
    arrCost(40, 2) = -0.4123;
    arrCost(40, 3) = 0.04231;
    
    arrCost(41, 1) = 22.8831;
    arrCost(41, 2) = -1.2321;
    arrCost(41, 3) = 0.0112;
    arrCost(42, 1) = 22.8831;
    arrCost(42, 2) = -1.2321;
    arrCost(42, 3) = 0.0112;
    
%   Detailed explanation goes here
    totalEmi = 0;
    if indexGenerator == 0
        totalEmi =  totalEmi + 0;
    else
        totalEmi =  totalEmi + (arrCost(indexGenerator, 1) + (arrCost(indexGenerator,2) * watt) + (arrCost(indexGenerator, 3) * power(watt,2))); 
    end
        
        totalEmi = totalEmi / 1000;
end

