% simple illustration
format long e
c = 299792458;
h_bar = 6,626 * 10^-34;
lambda12 = 393 *10^-9; %nm
w12 = c/lambda12;
lambda23 = 397 * 10^-9;
w23 = c/lambda23;

d12 = 1 + i;
d13 = 1 + 2i; 
d23 = 2 + i;

E1 = 2;
E2 = 3;

% Hamiltonian

H = [0 -d12*E1 0; -conj(d12)*E1 h_bar*w12 -d23*E2; 0 -conj(d23)*E2 h_bar*w23]


%% STEADY STATE USING MATRIX INVERSION

% because the system is overdetermened we replace the first row of the
% matrix by sum x_i = 1 or in other words a 1 row. The system changes from
% HX = 0 to H'X = V with V the unit matrix
d = size(H);
a = 1; % the row that we will replace
H(1,:) = ones(1,d(1)); % is this the right place to replace? I don't think so tbh 
V = zeros(d(1),1);
V(a) = 1;

% could change here 0's to O values functions (in this example not a
% problem because not that much 0's

% we try the 3 different methods to solve this:


%%  QUASI-MINIMAL RESIDUAL METHOD (QMR)

x = qmr(H,V)

%% BICONJUGATE GRADIENTS STABELISED METHOD  

x = bicgstab(H,V)


%% COMBINED METHOD

% we first aim for an accuracy of about 10^-6 for qmr because it is a
% rapidly converging method and than use bicgstab to achieve higher
% accuracy and a max of 5 itterations

x1 = qmr(H,V,10^-2) 
x2 = bicgstab(H,V,[],[],[],[],x1) % find solution from initial guess of qmr












