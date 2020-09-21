%% Initialization
addpath '/Users/vonw/work/projects/icecaps/analysis/Summit-Melt-Events/analysis/subsurfaceHeatFlux/mfiles'
addpath '/Users/vonw/work/projects/icecaps/analysis/Summit-Melt-Events/analysis/subsurfaceHeatFlux/mfiles/G_programs'
addpath '/Users/vonw/work/projects/icecaps/analysis/Summit-Melt-Events/analysis/subsurfaceHeatFlux/mfiles/G_programs/glaciology590Dcode'

%% Test from Town's surfaceEnergyBalanceNotebook.m
cd /Users/vonw/work/projects/icecaps/analysis/Summit-Melt-Events/analysis/subsurfaceHeatFlux
Lz = [0:0.1:1 1.5:0.5:6.5]';
year = 2001;
%jday = 0:10:360;
jday = 0:360;
%phi_0_temp = ones(size(Lz)+1,1)*-40;
phi_0_temp = ones(length(Lz)+1,1)*-40;
c_z = 0;

c1 = 0:0.1:255/255;
b = [c1' c1' c1'];

%Tsfc = ones(1,length(jday))*-30;
%[phi1,z_P_vec] = subsurfaceHeatFluxAdvDiffTransBdry2D(year,month,jday,Tsfc,phi_0_temp,Lz,c_z);
%h = figure; contourf(jday,-z_P_vec,phi1(:,2:end),[-45:0.1:-30]); title('upper = -30, lower = seasonal heat flux, snowpack = -40, irregular grid');
%shading flat; colormap(b); colorbar; myXlabel('day of year'); myYlabel('depth into snowpack');
%%mySave(h,'G_testcase1','rgb',0);


Tsfc = interp1(0:361:361,-30:10:-20,jday)
[phi1,z_P_vec] = subsurfaceHeatFluxAdvDiffTransBdry2D(year,jday,Tsfc,phi_0_temp,Lz,c_z);
h = figure; contourf(jday,-z_P_vec,phi1(:,2:end),[-45:0.1:-20]); title('upper = -30, lower = seasonal heat flux, snowpack = -40, irregular grid');


%% Case 1 - Constant snow density profile of 260 kg m-3 (Summit snowpit average)
cd /Users/vonw/work/projects/icecaps/analysis/Summit-Melt-Events/analysis/subsurfaceHeatFlux
Lz = [0:0.1:1 1.5:0.5:6.5]';
year = 2019;
jday = 152:244;
%phi_0_temp = ones(length(Lz)+1,1)*-28.8;
phi_0_temp = [-14; interp1([0 6.5], [-14, -28.8], Lz)]; 
c_z = 0;

c1 = 0:0.1:255/255;
b = [c1' c1' c1'];

z_vpw   = [0.0 6.5];	                      % m 
rho_vpw = [260 260]; 	                      % kg/m^3
cp_vpw  = [2040 2040] * 0.85;                 % converted from J K^-1 kg to specific heat capacity;

Tsfc = ones(size(jday))*-14
Tsfc(40:49) = +1
[phi1,z_P_vec] = subsurfaceHeatFluxAdvDiffTransBdry2D(year,jday,Tsfc,phi_0_temp,Lz,c_z,z_vpw,rho_vpw,cp_vpw);
case1 = phi1;

h = figure; 
contourf(jday,-z_P_vec(1:12),case1(1:12,2:end),[-30:+5]); 
title('Case 1: Constant snow density profile (260 kg m-3)');
colorbar;

%% Case 2 - Linear snow density profile from 258 to 478 kg m-3 (Summit snowpit surface to Dalrymple at 6.5 m)
cd /Users/vonw/work/projects/icecaps/analysis/Summit-Melt-Events/analysis/subsurfaceHeatFlux
Lz = [0:0.1:1 1.5:0.5:6.5]';
year = 2019;
jday = 152:244;
%phi_0_temp = ones(length(Lz)+1,1)*-28.8;
phi_0_temp = [-14; interp1([0 6.5], [-14, -28.8], Lz)]; 
c_z = 0;

c1 = 0:0.1:255/255;
b = [c1' c1' c1'];

z_vpw   = [0.0 6.5];	                      % m 
rho_vpw = [478 478]; 	                      % kg/m^3
cp_vpw  = [2040 2040] * 0.85;                 % converted from J K^-1 kg to specific heat capacity;

Tsfc = ones(size(jday))*-14
Tsfc(40:49) = +1
[phi1,z_P_vec] = subsurfaceHeatFluxAdvDiffTransBdry2D(year,jday,Tsfc,phi_0_temp,Lz,c_z,z_vpw,rho_vpw,cp_vpw);
case2 = phi1;

h = figure; 
contourf(jday,-z_P_vec(1:12),case2(1:12,2:end),[-30:+5]); 
title('Case 2: Constant snow density profile (478 kg m-3)');
colorbar;

%figure;
%contourf(jday,-z_P_vec(1:12),case1(1:12,2:end)-case2(1:12,2:end)); 
%title('Case1 - Case2; Constant density (260) minus Constant density (478)')
%colorbar;

%% Case 3 - Linear snow density profile from 258 to 478 kg m-3 (Summit snowpit surface to Dalrymple at 6.5 m)
cd /Users/vonw/work/projects/icecaps/analysis/Summit-Melt-Events/analysis/subsurfaceHeatFlux
Lz = [0:0.1:1 1.5:0.5:6.5]';
year = 2019;
jday = 152:244;
%phi_0_temp = ones(length(Lz)+1,1)*-28.8;
phi_0_temp = [-14; interp1([0 6.5], [-14, -28.8], Lz)]; 
c_z = 0;

c1 = 0:0.1:255/255;
b = [c1' c1' c1'];

z_vpw   = [0.0 6.5];	                      % m 
rho_vpw = [258 478]; 	                      % kg/m^3
cp_vpw  = [2040 2040] * 0.85;                 % converted from J K^-1 kg to specific heat capacity;

Tsfc = ones(size(jday))*-14
Tsfc(40:49) = +1
[phi1,z_P_vec] = subsurfaceHeatFluxAdvDiffTransBdry2D(year,jday,Tsfc,phi_0_temp,Lz,c_z,z_vpw,rho_vpw,cp_vpw);
case3 = phi1;

h = figure; 
contourf(jday,-z_P_vec(1:12),case3(1:12,2:end),[-30:+5]); 
title('Case 3: Linear snow density profile (258-478 kg m-3)');
colorbar;

%% Case 4 - Linear snow density profile from 258 to 478 kg m-3 (Summit snowpit surface to Dalrymple at 6.5 m)
%           with high-density ice layer from 10 to 20 cm (920 kg m-3)
cd /Users/vonw/work/projects/icecaps/analysis/Summit-Melt-Events/analysis/subsurfaceHeatFlux
Lz = [0:0.1:1 1.5:0.5:6.5]';
year = 2019;
jday = 152:244;                 % daily (every 24 hours)
%jday = linspace(152,244,93*2-1) % twice per day (every 12 hours)
%jday = linspace(152,244,93*4-3) % four per day (every 6 hours)
%phi_0_temp = ones(length(Lz)+1,1)*-28.8;
phi_0_temp = [-14; interp1([0 6.5], [-14, -28.8], Lz)]; 
c_z = 0;

c1 = 0:0.1:255/255;
b = [c1' c1' c1'];

z_vpw   = [0.0 0.1 0.2 0.3 6.5];	              % m 
rho_vpw = [258 920 920 266 478]; 	              % kg/m^3
cp_vpw  = [2040 2040 2040 2040 2040] * 0.85;       % converted from J K^-1 kg to specific heat capacity;

Tsfc = ones(size(jday))*-14
Tsfc(40:49) = +1
[phi1,z_P_vec] = subsurfaceHeatFluxAdvDiffTransBdry2D(year,jday,Tsfc,phi_0_temp,Lz,c_z,z_vpw,rho_vpw,cp_vpw);
case4 = phi1;

h = figure; 
contourf(jday,-z_P_vec(1:12),case4(1:12,2:end),[-30:+5]); 
title('Case 4: Linear snow density profile (258-478 kg m-3) with high-density ice layer (920 kg m-3)');
colorbar;

%figure;
%contourf(jday,-z_P_vec(1:12),case4(1:12,2:end)-case3(1:12,2:end)); 
%title('Case4 - Case3; High-Density Ice Layer minus No Ice Layer')
%colorbar;

%% Case 5 - Linear snow density profile from 258 to 478 kg m-3 (Summit snowpit surface to Dalrymple at 6.5 m)
%           with medium-density ice layer from 10 to 20 cm
cd /Users/vonw/work/projects/icecaps/analysis/Summit-Melt-Events/analysis/subsurfaceHeatFlux
Lz = [0:0.1:1 1.5:0.5:6.5]';
year = 2019;
jday = 152:244;                 % daily (every 24 hours)
%jday = linspace(152,244,93*2-1) % twice per day (every 12 hours)
%jday = linspace(152,244,93*4-3) % four per day (every 6 hours)
%phi_0_temp = ones(length(Lz)+1,1)*-28.8;
phi_0_temp = [-14; interp1([0 6.5], [-14, -28.8], Lz)]; 
c_z = 0;

c1 = 0:0.1:255/255;
b = [c1' c1' c1'];

z_vpw   = [0.0 0.1 0.2 0.3 6.5];	              % m 
rho_vpw = [258 460 460 266 478]; 	              % kg/m^3
cp_vpw  = [2040 2040 2040 2040 2040] * 0.85;       % converted from J K^-1 kg to specific heat capacity;

Tsfc = ones(size(jday))*-14
Tsfc(40:49) = +1
[phi1,z_P_vec] = subsurfaceHeatFluxAdvDiffTransBdry2D(year,jday,Tsfc,phi_0_temp,Lz,c_z,z_vpw,rho_vpw,cp_vpw);
case5 = phi1;

h = figure; 
contourf(jday,-z_P_vec(1:12),case5(1:12,2:end),[-30:+5]); 
title('Case 5: Linear snow density profile (258-478 kg m-3) with medium-density ice layer (xxx kg m-3)');
colorbar;

figure;
contourf(jday,-z_P_vec(1:16),case5(1:16,2:end)-case3(1:16,2:end)); 
title('Case5 - Case3; Medium-density Ice Layer minus No Ice Layer')
colorbar;


%% Case 6 - Actual snow density profile to 1 m (2019-10-09), then Dalrymple to 6.5 m
%           Actual skin temperature from KT15 on ICECAPS-ACE Fluxtower
cd /Users/vonw/work/projects/icecaps/analysis/Summit-Melt-Events/analysis/subsurfaceHeatFlux
%Lz = [0:0.1:1 1.1:0.5:6.5]';
Lz = [0:0.01:0.2 0.25:0.05:0.5 0.6:0.1:1.0 1.5:0.5:6.5]';
year = 2019;
%jday = 152:244;                 % daily (every 24 hours)
%jday = linspace(152,244,93*2-1) % twice per day (every 12 hours)
jday = linspace(152.125,243.875,92*4); % four per day (every 6 hours)
%phi_0_temp = ones(length(Lz)+1,1)*-28.8;
phi_0_temp = [-14; interp1([0 6.5], [-14, -28.8], Lz)]; 
c_z = 0;

c1 = 0:0.1:255/255;
b = [c1' c1' c1'];

%z_vpw   = [0.0 6.5];	              % m 
%rho_vpw = [258 478]; 	              % kg/m^3
%cp_vpw  = [2040 2040] * 0.85;       % converted from J K^-1 kg to specific heat capacity;

z_vpw   = [0.000 0.090 0.160 0.180 0.205 0.230 0.240 0.270 0.300 0.360 0.390 0.435 0.460 0.525 0.630 0.680 0.755 0.910 0.940 1.020 1.5 2.0 2.5 3.0 3.5 4.0 4.5 5.0 5.5 6.0 6.5];
rho_vpw = [258.3 258.3 230.6 252.8 227.8 172.2 152.8 241.7 283.3 291.7 222.2 280.6 366.7 183.3 300.0 327.8 216.7 369.4 244.4 308.3 377 381 393 406 413 420 422 430 446 462 478];
cp_vpw  = ones(size(rho_vpw))*2040*0.85;       % converted from J K^-1 kg to specific heat capacity;

Tsfc = load('/Users/vonw/data/summit/ACE/fluxtower/KT15_6hr_201906-201908.csv', 'ascii')';
[phi1,z_P_vec] = subsurfaceHeatFluxAdvDiffTransBdry2D(year,jday,Tsfc,phi_0_temp,Lz,c_z,z_vpw,rho_vpw,cp_vpw);
case6 = phi1;

h = figure; 
contourf(jday,-z_P_vec(1:12),case6(1:12,2:end),[-30:+5]); 
title('Case 6: Linear snow density profile and actual KT15 surface skin temperature');
colorbar;

%% Case 7 - Effect of Vertical Resolution (compare to Case 3)
cd /Users/vonw/work/projects/icecaps/analysis/Summit-Melt-Events/analysis/subsurfaceHeatFlux
%Lz = [0:0.1:1 1.5:0.5:6.5]';
Lz = [0:0.01:0.2 0.25:0.05:0.5 0.6:0.1:1.0 1.5:0.5:6.5]';
year = 2019;
jday = 152:244;
%phi_0_temp = ones(length(Lz)+1,1)*-28.8;
phi_0_temp = [-14; interp1([0 6.5], [-14, -28.8], Lz)]; 
c_z = 0;

c1 = 0:0.1:255/255;
b = [c1' c1' c1'];

z_vpw   = [0.0 6.5];	                      % m 
rho_vpw = [258 478]; 	                      % kg/m^3
cp_vpw  = [2040 2040] * 0.85;                 % converted from J K^-1 kg to specific heat capacity;

Tsfc = ones(size(jday))*-14
Tsfc(40:49) = +1
[phi1,z_P_vec] = subsurfaceHeatFluxAdvDiffTransBdry2D(year,jday,Tsfc,phi_0_temp,Lz,c_z,z_vpw,rho_vpw,cp_vpw);
case7 = phi1;

h = figure; 
contourf(jday,-z_P_vec(1:12),case7(1:12,2:end),[-30:+5]); 
%title('Case 3: Linear snow density profile (258-478 kg m-3)');
colorbar;


%% Case 8 - High-density layer over low-density layer
cd /Users/vonw/work/projects/icecaps/analysis/Summit-Melt-Events/analysis/subsurfaceHeatFlux

%Lz = [0:0.1:1 1.5:0.5:6.5]';
Lz = [0:0.01:0.2 0.25:0.05:0.5 0.6:0.1:1.0 1.5:0.5:6.5]';

year = 2019;
jday = 152:244;                 % daily (every 24 hours)
%jday = linspace(152,244,93*2-1) % twice per day (every 12 hours)
%jday = linspace(152,244,93*4-3) % four per day (every 6 hours)
%phi_0_temp = ones(length(Lz)+1,1)*-28.8;
phi_0_temp = [-14; interp1([0 6.5], [-14, -28.8], Lz)]; 
c_z = 0;

c1 = 0:0.1:255/255;
b = [c1' c1' c1'];

z_vpw   = [0.0 0.04 0.05 0.1 0.11 0.16 0.17 6.5];	              % m 
rho_vpw = [258 258  460  460 180  180  260  478]; 	              % kg/m^3
cp_vpw  = ones(size(rho_vpw))*2040*0.85;       % converted from J K^-1 kg to specific heat capacity;

Tsfc = ones(size(jday))*-14
Tsfc(40:49) = +1
[phi1,z_P_vec] = subsurfaceHeatFluxAdvDiffTransBdry2D(year,jday,Tsfc,phi_0_temp,Lz,c_z,z_vpw,rho_vpw,cp_vpw);
case8 = phi1;

h = figure; 
contourf(jday,-z_P_vec(1:12),case8(1:12,2:end),[-30:+5]); 
%title('Case 5: Linear snow density profile (258-478 kg m-3) with medium-density ice layer (xxx kg m-3)');
colorbar;

%% Validation - Actual snow density profile to 1 m (2019-10-09), then Dalrymple to 6.5 m
%           Actual skin temperature from KT15 on ICECAPS-ACE Fluxtower
cd /Users/vonw/work/projects/icecaps/analysis/Summit-Melt-Events/analysis/subsurfaceHeatFlux
%Lz = [0:0.1:1 1.1:0.5:6.5]';
Lz = [0:0.01:0.2 0.25:0.05:0.5 0.6:0.1:1.0 1.5:0.5:6.5]';
year = 2014;
%jday = 152:244;                 % daily (every 24 hours)
%jday = linspace(152,244,93*2-1) % twice per day (every 12 hours)
jday = linspace(122,152,(30*4)+1); % four per day (every 6 hours)
%phi_0_temp = ones(length(Lz)+1,1)*-28.8;
phi_0_temp = [-30.9; interp1([0 6.5], [-30.9, -28.8], Lz)]; 
c_z = 0;

c1 = 0:0.1:255/255;
b = [c1' c1' c1'];

%z_vpw   = [0.0 6.5];	              % m 
%rho_vpw = [258 478]; 	              % kg/m^3
%cp_vpw  = [2040 2040] * 0.85;       % converted from J K^-1 kg to specific heat capacity;

z_vpw   = [0, 0.01, 0.02, 0.03, 0.04, 0.05, 0.06, 0.07, 0.08, 0.09, 0.1, 0.11, 0.12, 0.13, 0.14, 0.15, 0.16, 0.17, 0.18, 0.19, 0.2 , 0.21, 0.22, 0.23, 0.24, 0.25, 0.26, 0.27, 0.28, 0.29, 0.3 , 0.31, 0.32, 0.33, 0.34, 0.35, 0.36, 0.37, 0.38, 0.39, 0.4 , 0.41, 0.42, 0.43, 0.44, 0.45, 0.46, 0.47, 0.48, 0.49, 0.5 , 0.51, 0.52, 0.53, 0.54, 0.55, 0.56, 0.57, 0.58, 0.59, 0.6 , 0.61, 0.62, 0.63, 0.64, 0.65, 0.66, 0.67, 0.68, 0.69, 0.7 , 0.71, 0.72, 0.73, 0.74, 0.75, 0.76, 0.77, 0.78, 0.79, 0.8 , 0.81, 0.82, 0.83, 0.84, 0.85, 0.86, 0.87, 0.88, 0.89, 0.9 , 0.91, 0.92, 0.93, 0.94, 0.95, 0.96, 0.97, 0.98, 0.99, 1.  , 1.01, 1.02, 1.03, 1.04, 1.05, 1.06, 1.07, 1.08, 1.09, 1.1 , 1.11, 1.12, 1.13, 1.14, 1.15, 1.16, 1.17, 1.18, 1.19, 1.2 , 1.21, 1.22, 1.23, 1.24, 1.25, 1.26, 1.27, 1.28, 1.29, 1.3 , 1.31, 1.32, 1.33, 1.34, 1.35, 1.36, 1.37, 1.38, 1.39, 1.4 , 1.41, 1.42, 1.43, 1.44, 1.45, 1.46, 1.47, 1.48, 1.49, 1.5 , 1.51, 1.52, 1.53, 1.54, 1.55, 1.56, 1.57, 1.58, 1.59, 1.6 , 1.61, 1.62, 1.63, 1.64, 1.65, 1.66, 1.67, 1.68, 1.69, 1.7 , 1.71, 1.72, 1.73, 1.74, 1.75, 1.76, 1.77, 1.78, 1.79, 1.8 , 1.81, 1.82, 1.83, 1.84, 1.85, 1.86, 1.87, 1.88, 1.89, 1.9 , 1.91, 1.92, 1.93, 1.94, 1.95, 1.96, 1.97, 1.98, 1.99, 2.  , 2.01, 2.02, 2.03, 2.04, 2.05, 2.06, 2.07, 2.08, 2.09, 2.1 , 2.11, 2.12, 2.13, 2.14, 2.15, 2.16, 2.17, 2.18, 2.19, 2.2 , 2.21, 2.22, 2.23, 2.24, 2.25, 2.26, 2.27, 2.28, 2.29, 2.3 , 2.31, 2.32, 2.33, 2.34, 2.35, 2.36, 2.37, 2.38, 2.39, 2.4 , 2.41, 2.42, 2.43, 2.44, 2.45, 2.46, 2.47, 2.48, 2.49, 2.5 , 2.51, 2.52, 2.53, 2.54, 2.55, 2.56, 2.57, 2.58, 3., 3.5, 4.0, 4.5, 5.0, 5.5, 6.0, 6.5];
rho_vpw = [465.30909091, 465.30909091, 481.2034632 , 509.63116883,        494.82341427, 503.76525503, 503.15324675, 513.66753247,        523.40606061, 518.61991342, 517.8055336 , 503.42714097,        496.77299078, 508.1969697 , 526.18787879, 538.34202899,        529.85142104, 568.38787879, 568.25454545, 561.84822134,        574.60274798, 578.61095426, 570.81991342, 577.43116883,        582.56969697, 571.45454545, 578.72938076, 561.95091286,        550.11948052, 540.03463203, 540.48658009, 531.23568605,        524.09215133, 556.79393939, 591.74112554, 579.5012987 ,        559.85194805, 570.02964427, 563.26785244, 578.72727273,        571.34545455, 553.45367965, 533.97839262, 528.02281197,        535.08225108, 549.74891775, 568.74199134, 527.98354978,        539.98716356, 521.02371542, 459.50021959, 423.35353535,        409.91040843, 405.82608696, 423.85507246, 446.68511199,        452.2345191 , 455.27536232, 455.56521739, 438.95388669,        456.91172596, 501.35309618, 543.32981994, 566.3030303 ,        560.02898551, 548.51119895, 542.13275613, 520.12698413,        505.15942029, 530.68115942, 549.15942029, 524.7826087 ,        499.82608696, 508.08695652, 516.17918314, 527.66666667,        538.54545455, 550.39130435, 559.1884058 , 534.36231884,        508.14492754, 516.56521739, 560.89855072, 599.98550725,        603.73386034, 593.91699605, 579.37801932, 573.94082126,        573.14130435, 563.73913043, 554.32938076, 566.15019763,        585.10144928, 593.92753623, 590.23188406, 575.75362319,        566.23188406, 555.20289855, 541.91304348, 536.34650856,        562.02564103, 580.51748252, 567.37296037, 551.26599327,        532.23939882, 501.32742888, 493.7979798 , 510.35465769,        524.00673401, 481.37373737, 438.74074074, 405.67748918,        369.42640693, 408.53896104, 469.35353535, 507.38164251,        546.86956522, 530.41209193, 498.24842629, 493.90286634,        503.07473967, 500.86661299, 475.92109501, 458.33789587,        477.63392378, 523.3747412 , 424.51777088, 441.97920021,        450.01999463, 449.64774557, 454.81602254, 478.90499195,        503.67149758, 516.15351583, 525.41009125, 534.66666667,        532.12353347, 529.58040028, 516.74396135, 497.42028986,        489.48792271, 509.87439614, 531.99033816, 512.17149758,        489.17364466, 487.52657005, 505.74127751, 525.14439077,        547.58132045, 568.29059829, 581.93979933, 594.23634337,        599.02777778, 597.91666667, 597.75      , 601.08333333,        604.41666667, 597.30434783, 589.1884058 , 583.97222222,        574.52777778, 562.33333333, 537.05555556, 511.77777778,        544.88768116, 606.22826087, 630.58333333, 594.19444444,        560.20048309, 568.76086957, 579.65458937, 577.8647343 ,        563.92753623, 556.66666667, 568.61111111, 580.55555556,        585.63768116, 589.76811594, 567.61111111, 525.66666667,        494.44202899, 519.15217391, 543.86231884, 547.5615942 ,        545.10990338, 541.72222222, 536.16666667, 527.05555556,        497.05555556, 467.05555556, 462.99396135, 470.25241546,        472.63043478, 463.62077295, 454.61111111, 473.94444444,        495.61111111, 514.62318841, 533.53623188, 589.49666667,        556.98      , 524.46333333, 529.12820513, 542.94230769,        551.48148148, 551.2962963 , 551.11111111, 581.97993311,        620.19063545, 630.75641026, 617.47435897, 606.94230769,        609.19444444, 608.91666667, 602.26388889, 595.71474359,        582.89423077, 562.99038462, 547.32274247, 554.39632107,        558.73913043, 532.        , 499.08333333, 501.01282051,        537.00641026, 573.        , 566.94230769, 560.88461538,        560.48148148, 564.18518519, 571.19323671, 594.21070234,        618.42474916, 624.13461538, 628.81410256, 631.82692308,        620.97222222, 600.33333333, 601.44444444, 610.38461538,        591.53205128, 556.77564103, 519.11036789, 504.09364548,        518.        , 529.66666667, 541.33333333, 512.81730769,        487.96153846, 518.75      , 537.5       , 556.25      ,        534.        , 501.5       , 482.        , 482.        ,        482.        , 508.95652174, 535.91304348,          616.96, 616.96, 616.96, 616.96, 616.96, 616.96, 616.96, 616.96];
cp_vpw  = ones(size(rho_vpw))*2040*0.85;       % converted from J K^-1 kg to specific heat capacity;

Tsfc = load('/Users/vonw/data/summit/MeltEvents2019/NooneEtAl/IRtemp_6hr_20140501-20150531.csv', 'ascii')';
[phi1,z_P_vec] = subsurfaceHeatFluxAdvDiffTransBdry2D(year,jday,Tsfc,phi_0_temp,Lz,c_z,z_vpw,rho_vpw,cp_vpw);
validation2014 = phi1;

h = figure; 
contourf(jday,-z_P_vec(1:12),validation2014(1:12,2:end),[-40:+5]); 
title('Validation Case for May 2014: Snow Density Profile from July 2014 and IR Skin Temperature from May 2014');
colorbar;
