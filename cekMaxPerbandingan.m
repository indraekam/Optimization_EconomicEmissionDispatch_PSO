   function total = cekMaxPerbandingan()

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
    
    total = 0;
    for i = 1 : 8
        total =  total + arrBatas(i, 2);
    end
    
%     fprintf("%.2f", total);
   end
