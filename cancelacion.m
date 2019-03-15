% Trabajo final de Tratamiento Digital de Señales 

% Alumno 1 : Gabriela Gutiérrez Cruz
% Alumno 2 : Pablo López Querol
% Alumno 3 : Alejandro Ramos Martín
% Alumno 4 : Ignacio Sardinero Meirás
%% Cancelación de ruido de la señal

% Fs = frecuencia de muestreo de las señales
% N = número de coeficientes del filtro
% h0 = coeficientes iniciales del filtro
% L = número de llamadas a la función lms
% delta = tamaño del escalón

clear;

% Datos
load VOZ_RUIDO1.mat
load RUIDO1.mat
Fs=8000; 
L = 0; 
N=13; 
delta=1/3*(1/(10*N*sum(RUIDO1.^2)/length(RUIDO1))); 
h0=zeros(N,1); 

% Sonido de la señal de voz con ruido
soundsc(VOZ_RUIDO1,Fs),pause 

% Primera llamada a la función lms
[h,y]=lms(RUIDO1,VOZ_RUIDO1,delta,N,h0);
h0=h;
e=VOZ_RUIDO1-y;

% Inicialización de la comparación para entrar en el bucle
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
