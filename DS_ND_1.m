%Justinas Adomaitis IFA-0/1
%B-23 Patikrinti, ar du duoti grafai yra izomorfiniai.

clc; clear all;



%1 bandymas
%  A = [1 1 1 2 2 3 3 4; % pirmasis grafas aprasytas briaunu matrica
%       2 4 5 3 4 4 6 5];
%  B = [1 1 1 2 2 3 3 4; % antrasis grafas aprasytas briaunu matrica
%       2 3 5 3 6 4 5 5];
  
%2 bandymas
%  A=[1 2 2 3 5;2 3 5 4 6];
%  B=[1 2 2 4 5;2 3 4 5 6];


%3 bandymas
% A=[1 2 2 3;2 3 5 4];
% B=[1 2 2 2;2 3 4 5];

%4 bandymas
% A=[1 2 2 3 4 4 4 7;
%    2 3 7 4 5 6 7 8];
% 
% B=[1 2 2 2 4 4 6 7;
%    2 3 4 6 5 7 7 8];

A=[1 2;2 3];
An=4;
B=[2 3;3 4];
Bn=4;

 Am = length(A(1,:)); % A grafo briaunu sk.
 
 Av = 1:An; % A grafo virsuniu sarasas
 Ad(1:An) = 0; % A grafo virsuniu laipsniu masyvas
 % virsuniu laipsniu skaiciavimas
 for i = 1:2
     for j= 1:Am
         k=A(i,j);
         Ad(k)= Ad(k)+1;
     end
 end
 Ads=sort(Ad);
 Au=[]; % I U struktura perrasoma briaunu A matrica
 for BrNr = 1:Am
     Au{BrNr} = A(:,BrNr);
 end
 
 Bm = length(B(1,:)); % B grafo briaunu sk.
 
 Bv = 1:Bn; % B grafo virsuniu sarasas
 Bd(1:Bn) = 0; % B grafo virsuniu laipsniu masyvas
 % virsuniu laipsniu skaiciavimas
 
 for i = 1:2
     for j= 1:Bm
         k=B(i,j);
         Bd(k)= Bd(k)+1;
     end
 end
 
 Bds=sort(Bd);
 
 Bu=[]; % I U struktura perrasoma briaunu B matrica
 for BrNr = 1:Bm
     Bu{BrNr} = B(:,BrNr);
 end
 
 Vkor = [];
 
 orgrafas=0; arc=0;poz=0;font=10;storis=2;spalva='b';
 figure(1)
 % A grafas pavaizduojamas grafiskai
 title('Pirmasis grafas')
 Vkor = plotGraphVU(Av,Au,orgrafas,arc,Vkor,poz,font,storis,spalva);
 
 orgrafas=0; arc=0;poz=0;font=10;storis=2;spalva='r';
 figure(2)
 % B grafas pavaizduojamas grafiskai
 title('Antrasis grafas')
 Vkor = plotGraphVU(Bv,Bu,orgrafas,arc,Vkor,poz,font,storis,spalva);
 
 tic
 
 ArIzomorfiniai=false;
 
 Ind=0;
 ArLygino=false;
 
 if Am==Bm && An==Bn && isequal(Ads,Bds)
     fprintf('Duoti grafai gali būti izomorfiniai, nes sutampa jų viršūnių\n');
     fprintf('ar briaunų skai�?ius arba viršūnių laipsnių seka.\n');
     fprintf('Tam kad įsitikintume ar grafai tikrai izomorfiniai, palyginsime\n');
     fprintf('A grafo gretimumo matricą su grafo B visomis gretimumo matricos variacijomis.');
     ArLygino=true;
 GretMatrica = zeros(An);
 GretMatricaB = zeros(Bn);
 
P = perms(1:An);

% for ElemNr = (n-1):-1:1
%     if (Junginys(ElemNr) < Junginys(ElemNr+1))
%         DidinamasisElemNr = ElemNr;
%         break;
%     end
% end
%  
% for ElemNr = n:-1:(DidinamasisElemNr+1)
%     if (Junginys(ElemNr) > Junginys(DidinamasisElemNr))
%         SukeitimoElemNr = ElemNr;
%         break;
%     end
% end
%Suranda A grafo gretimumo matrica
 for EilNr = 1:An
     for BrNr=1:Am
         
          if A(1,BrNr)==EilNr
             GretMatrica(A(2,BrNr),EilNr)=1;
          end
         
     end
 end
GretMatrica=GretMatrica+tril(GretMatrica,-1).';
fprintf('\n\nGrafo A gretimumo matrica:\n');
disp(GretMatrica);
[eiles,stulpeliai]=size(P);
%suranda B grafo gretimumo matricas
 for eil =1:eiles
     EileP=P(eil,:);
     for EilNr = 1:Bn
         for BrNr=1:Bm

              if B(1,BrNr)==P(eil,EilNr)
                  index=find(EileP==B(2,BrNr));
                  
                      GretMatricaB(index,EilNr)=1;
              
              end

         end
     end
     
     
     
     GretMatricaB;
     GretMatricaB=GretMatricaB+tril(GretMatricaB,-1).';
     
     for i=1:Bn
         for j=1:Bn
             if GretMatricaB(i,j)==1
                 GretMatricaB(j,i)=1;
             end
         end
     end
     
     if GretMatrica==GretMatricaB
         Ind=eil;
         ArIzomorfiniai=true;
         fprintf('\nGrafo A gretimumo matrica ir Grafo B gretimumo matrica sutapo.');
         fprintf('\nSutapusios matricos eilės numeris:');
         disp(Ind);
         fprintf('B grafo atitikusi viršūnių seka:');
         disp(P(eil,:));
         break;
     else GretMatricaB=zeros(Bn);
         
     end
 end
  else fprintf('Grafai nėra izomorfiniai, nes nesutampa jų viršūnių skai�?ius,\n')
      fprintf('briaunų skai�?ius arba viršūnių laipsnių seka.');
 end
 
 if ArIzomorfiniai==true
     fprintf('Išvada:\nDuoti grafai yra izomorfiniai.\n');
 else
     if ArLygino == false 
         fprintf('\nIšvada:\nDuoti grafai nėra izomorfiniai.');
     else fprintf('Grafo A gretimumo matrica nesutapo su nei viena grafo B.\n');
         fprintf('Išvada:\nGrafai nėra izomorfiniai.\n');
     end
 end
 SkaiciavimuTrukme = toc;
 fprintf("\nSkai�?iavimų trukmė:");
 disp(SkaiciavimuTrukme);
 