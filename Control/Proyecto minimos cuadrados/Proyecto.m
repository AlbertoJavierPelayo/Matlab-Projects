clear all
%filename = 'Data.txt';
filename = 'ComodinData.txt';
%filename = 'Prueba.txt';
delimiterIn = '	';
A = importdata(filename,delimiterIn);
Y=A(:,1);
U=A(:,2);
coeficientesA=[1,1,1,1,1];
coeficientesB=[1,1];
tam=size(Y,1);
lotes=50;
recursivo=tam-lotes;
tam_CA=size(coeficientesA,2);
tam_CB=size(coeficientesB,2);
Total_coeficientes=tam_CB+tam_CA;


PhiN=zeros(lotes,Total_coeficientes);
% 
% for i=1:1:Total_coeficientes
%     for j=1:1:lotes
%         PhiN(j,i)=0;
%     end
% 
% end

for i=2:1:lotes
    for j=1:1:tam_CA
        if(coeficientesA(j)==1)
            if(i-j<1)
                PhiN(i,j)=0;
            else
                PhiN(i,j)=Y(i-j);
            end
        end
    end

end
for i=1:1:lotes
    for k=0:1:tam_CB-1
        if(coeficientesB(k+1)==1)
            %i
            %ggg=i-k
            if(i-k<=0)
                PhiN(i,tam_CA+k+1)=0;
            else
                PhiN(i,tam_CA+k+1)=U(i-k);
               
            end
        end
    end

end
%PhiN
x=0;
for i=1:1:tam_CA
    if(coeficientesA(1,i)==0)
        PhiN(:,i-x) = [];
        x=x+1;
    else
        cof_A(1,i-x)=i;
    end
end
z=0;
for i=1:1:tam_CB
    if(coeficientesB(1,i)==0)
        h=tam_CA+i-x;
        PhiN(:,tam_CA+i-x) = [];
        x=x+1;
        z=z+1;
    else
        z;
        cof_B(1,i-z)=i-1;
    end
end
%PhiN

Y_lotes=Y(1:lotes);

thetagorrito = inv(PhiN.'*PhiN)*PhiN.'*Y_lotes;
coeficientes_finales=size(thetagorrito,1);
Y_gorrito=zeros(lotes,coeficientes_finales);
% for i:1:1:lotes
%     for j:1:1:tam_CA
%         if(coeficientesA(1,j)==1)
%         end
%     end
%     Y_gorrito(i,1)=thetagorrito(1,1)
% end
% PhiN
 %cof_A
 %cof_B
T_A=size(cof_A,2);
T_B=size(cof_B,2);
for i=1:1:lotes
    for j=1:1:T_A
        w=i-cof_A(j);
        if(w<1)
            Y_gorrito(i,j)=0;
        else
            Y_gorrito(i,j)=thetagorrito(j)*Y(w);
        end
    end
end
for i=1:1:lotes
    for j=1:1:T_B
        w=i-cof_B(j);
        if(w<1)
            Y_gorrito(i,T_A+j)=0;
        else
            Y_gorrito(i,T_A+j)=thetagorrito(T_A+j)*U(w);
        end
    end
end

y_estimada=zeros(tam,1);

for i=1:1:lotes
    for j=1:1:coeficientes_finales
        y_estimada(i)=y_estimada(i)+Y_gorrito(i,j);
    end
end

% 
% 
%PhiN
 %thetagorrito
 %Y_gorrito
%y_estimada
%empezamos recursivos

PN=inv(PhiN.'*PhiN);
Chi_Nmas1=zeros(coeficientes_finales,1);
theta_Nmas1=zeros(coeficientes_finales,recursivo+1);
theta_Nmas1(:,1)=thetagorrito;
for i=lotes+1:1:tam
    aux=zeros(1,coeficientes_finales);
    for j=1:1:T_A
        w=i-cof_A(j);
        if(w<1)
            aux(1,j)=0;
        else
            aux(1,j)=Y(w);
        end
    end
    for j=1:1:T_B
        w=i-cof_B(j);
        if(w<1)
            aux(1,T_A+j)=0;
        else
            aux(1,T_A+j)=U(w);
        end
    end
   
    Chi_Nmas1=aux.';
    PN_mas1=PN-(PN*Chi_Nmas1*Chi_Nmas1.'*PN)/(1+Chi_Nmas1.'*PN*Chi_Nmas1);
    n_mas1=i-lotes+1;
    n=i-lotes;
    theta_Nmas1(:,n_mas1)=theta_Nmas1(:,n)-(PN_mas1*Chi_Nmas1*(Chi_Nmas1.'*theta_Nmas1(:,n)-Y(i)));
    PN=PN_mas1;
    for j=1:1:T_A
        w=i-cof_A(j);
        
        %hhhh=theta_Nmas1(j,n_mas1)
        if(w<1)
            Y_gorrito(i,j)=0;
        else
            Y_gorrito(i,j)=theta_Nmas1(j,n_mas1)*Y(w);
        end
    end
    for j=1:1:T_B
        w=i-cof_B(j);
        %hhhh=theta_Nmas1(T_A+j,n_mas1)
        if(w<1)
            Y_gorrito(i,T_A+j)=0;
        else
            Y_gorrito(i,T_A+j)=theta_Nmas1(T_A+j,n_mas1)*U(w);
        end
    end
    for j=1:1:coeficientes_finales
        y_estimada(i)=y_estimada(i)+Y_gorrito(i,j);
    end
end

EN=zeros(tam,1);
for i=1:1:tam
 
    EN(i)=Y(i)-y_estimada(i);
end
J=0.5*(EN.'*EN);%ERROR
Y_gorrito;
y_estimada;
theta_Nmas1(1,recursivo+1)%COEFICIENTES % en donde esta el 1 es el coeficiente que quieres
theta_Nmas1(1,:)%valores a graficar coeficiente 1 %%%%theta_Nmas1(numero_coeficiente,iteraciones)
theta_final=zeros(12,1);
for i=1:1:12
    
    if (i<=coeficientes_finales)
        theta_final(i,1)=theta_Nmas1(i,recursivo+1);
    else
        theta_final(i,1)=0;
    end
end
theta_final
% plot(theta_Nmas1(1,:))


