%% Initialization
addpath '/Users/vonw/work/projects/icecaps/analysis/Summit-Melt-Events/analysis/subsurfaceHeatFlux/mfiles'
addpath '/Users/vonw/work/projects/icecaps/analysis/Summit-Melt-Events/analysis/subsurfaceHeatFlux/mfiles/G_programs'
addpath '/Users/vonw/work/projects/icecaps/analysis/Summit-Melt-Events/analysis/subsurfaceHeatFlux/mfiles/G_programs/glaciology590Dcode'

%% Case 1 - Test from Town's surfaceEnergyBalanceNotebook.m
cd /Users/vonw/work/projects/icecaps/analysis/Summit-Melt-Events/analysis/subsurfaceHeatFlux
Lz = [0:0.1:1 1.5:0.5:6.5]';
year = 2001;
month = 01;
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
[phi1,z_P_vec] = subsurfaceHeatFluxAdvDiffTransBdry2D(year,month,jday,Tsfc,phi_0_temp,Lz,c_z);
h = figure; contourf(jday,-z_P_vec,phi1(:,2:end),[-45:0.1:-20]); title('upper = -30, lower = seasonal heat flux, snowpack = -40, irregular grid');


%% Case 2 - Test from Town's surfaceEnergyBalanceNotebook.m
cd /Users/vonw/work/projects/icecaps/analysis/Summit-Melt-Events/analysis/subsurfaceHeatFlux
Lz = [0:0.1:1 1.5:0.5:6.5]';
year = 2001;
month = 01;
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
[phi1,z_P_vec] = subsurfaceHeatFluxAdvDiffTransBdry2D(year,month,jday,Tsfc,phi_0_temp,Lz,c_z);
h = figure; contourf(jday,-z_P_vec,phi1(:,2:end),[-45:0.1:-20]); title('upper = -30, lower = seasonal heat flux, snowpack = -40, irregular grid');


