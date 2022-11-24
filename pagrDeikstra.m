clc; close all; clear 

V = [1 2 3 4 5 6 7 8]; % grafo virsuniu aibe
% Grafo briaunu ir ju svoriu aibe 
U = {[1 2 1],[2 3 2],[3 4 4],[3 5 1],[2 5 5],[5 4 1],[4 7 1],[1 6 2],[7 8 1],[5 6 3],[5 8 5], [1 8 15]};
% Grafo virsuniu koordinates nulinamos, pagal nutylejima virsunes bus isdestomos ratu.
Vkor = []; 

disp('Darbo pradzia')
% Pradiniai priskyrimai
kelioPradzia = 3;  
orgraf = 0;  % grafas neorientuotasis
% Pradinio grafo brezimas
arc = 0; poz = 0; Fontsize = 10; lstor = 1; spalva = 'b';
figure(1)
title('Duotasis grafas')
Vkor = plotGraphVU(V,U,orgraf,arc,Vkor,poz,Fontsize,lstor,spalva);
hold on; pause(1)

% Trumpiausio kelio braizymas pagal Deijksta algoritma
% d    - atstumai tarp virsuniu
% prec - ið kurios virsunes atejo
% UU   - trumpiausio kelio briaunu aibe
% zingNr - kelio zingsniu kiekis 
[d,prec,UU,zingNr] = deikstra(V,U,kelioPradzia,orgraf);

disp( ['Kelio pradzia: ',num2str(kelioPradzia), ' virsune']) ;

disp('Atstumai iki kitu virsuniu  (d masyvas)'); disp(d);
disp('Is kur atejo  (prec masyvas)'); disp(prec);

for i = 1:zingNr
    title(sprintf('Deikstros kelias:  %d  zingsnis ',i));
    V1 = UU{i}; 
    U1 = {V1}; 
    V1kor = [Vkor(V1(1),:);Vkor(V1(2),:)];
    plotGraphVU(V1,U1,1,0,V1kor,0,10,3,'r'); 
    pause(1)
end
disp('Darbo pabaiga')

  