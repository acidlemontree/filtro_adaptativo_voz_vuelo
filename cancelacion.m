% Trabajo final de Tratamiento Digital de Se�ales 

% Alumno 1 : Gabriela Guti�rrez Cruz
% Alumno 2 : Pablo L�pez Querol
% Alumno 3 : Alejandro Ramos Mart�n
% Alumno 4 : Ignacio Sardinero Meir�s
%% Cancelaci�n de ruido de la se�al

% Fs = frecuencia de muestreo de las se�ales
% N = n�mero de coeficientes del filtro
% h0 = coeficientes iniciales del filtro
% L = n�mero de llamadas a la funci�n lms
% delta = tama�o del escal�n

clear;

% Datos
load VOZ_RUIDO1.mat
load RUIDO1.mat
Fs=8000; 
L = 0; 
N=13; 
delta=1/3*(1/(10*N*sum(RUIDO1.^2)/length(RUIDO1))); 
h0=zeros(N,1); 

% Sonido de la se�al de voz con ruido
soundsc(VOZ_RUIDO1,Fs),pause 

% Primera llamada a la funci�n lms
[h,y]=lms(RUIDO1,VOZ_RUIDO1,delta,N,h0);
h0=h;
e=VOZ_RUIDO1-y;

% Inicializaci�n de la comparaci�n para entrar en el bucle
comp = 1; 

% Bucle
while(comp > 0.001)
    
pe1 = sumsqr(abs(e))/length(e);
[h,y]=lms(RUIDO1,VOZ_RUIDO1,delta,N,h0);
h0=h;
e=VOZ_RUIDO1-y;
pe2 = sumsqr(abs(e))/length(e);
comp = abs(pe2-pe1)/pe1;
L=L+1;
end
soundsc(e,8000)
