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

