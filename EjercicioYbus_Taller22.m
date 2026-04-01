clear variables
% Se tiene la Ybus original
Ybus=[-25.526*1i -15*1i 0 0 0 0;
    -15*1i 3.8151-1i*81.93398 -1.9557+1i*43.2851 0 -1.8594+42.2088*1i 0;
    0 -1.9557+1i*43.2851 1.9557-1i*43.2851 1i*6.6667 0 0;
    0 0 6.6667*1i -6.6667*1i 0 0;
    0 -1.8594+42.2088*1i 0 0 1.8594-1i*52.41168 12*1i;
    0 0 0 0 12*1i -12*1i];
% Se calcula Zbus original
Zbus=inv(Ybus);

% Se escribe la matriz de cambio de Ybus
deltaY=zeros(6);
deltaY(2,2)=1j*1.6128+1.9557-1i*43.2851;
deltaY(3,3)=deltaY(2,2);
deltaY(2,3)=-(1.9557-1i*43.2851);
deltaY(3,2)=deltaY(2,3);

% Se calcula la Ybus nueva
Ybusp=Ybus+deltaY;

% Se calcula la Zbus nueva (Zbusp)
Zbusp=inv(Ybusp);

% Se calcula la Zbus nueva (Zbus_3) usando las operaciones de modificación
Zbus_1=Zbus-Zbus(:,2)*Zbus(2,:)/(Zbus(2,2)+1/(1i*1.6128));
Zbus_2=Zbus_1-Zbus_1(:,3)*Zbus_1(3,:)/(Zbus_1(3,3)+1/(1i*1.6128));
Zx=Zbus_2(2,2)+Zbus_2(3,3)-2*Zbus_2(2,3)+1/(1.9557-1i*43.2851);
Zbus_3=Zbus_2-(Zbus_2(:,2)-Zbus_2(:,3))*(Zbus_2(2,:)-Zbus_2(3,:))/Zx;
