function [ xx, zz, ww, bb, uu, dp ,e_flux, ke_flux_t ] = series_half_sinusoid_plots_3_copy_no_checks2(HL_bar , HV_bar, Ht_bar, t, T, mmax, sigma, N1, N2 )

root2   = sqrt(2.0);
pi      = 3.141592653589793;
g       = 9.81;                              % ms^{-2}        
ratio   = Ht_bar / HL_bar;
scaleht1= g / N1 / N1 / 1e4;                 % units of Ht_bar
scaleht2= g / N2 / N2 / 1e4;
ratiop1 = Ht_bar  / scaleht1;
ratiop2 = Ht_bar  / scaleht2;
ratiopp1= scaleht1 / HL_bar;
ratiopp2= scaleht2 / HL_bar;

rhos1   = 1.0;
rhos2   = rhos1 * exp ( ratio*(1/ratiopp2 - 1/ratiopp1));
i       = complex(0,1);
x_0     = 0;                 % initial position of heating function, middle of box
s       = 0;             

% Debugging
% ratiop2  = ratiop1;
% ratiopp2 = ratiopp1;
% scaleht2 = scaleht1;
% rhos2    = rhos1;

dx      = 0.01;             % x-step
dz      = 0.01;             % z-step
x       = [-50:dx:50 ];        % x = 10 equivalent to 10 * \sigma (FWHM, PB F(x) )
z       = [0:dz:HV_bar ];
[xx,zz] = meshgrid( x, z);
d       = size(x);
region1 = z<=Ht_bar;         % Troposphere
region2 = z> Ht_bar;         % Stratosphere
rho_vert(region1) = rhos1 * exp ( - z(region1) ./ scaleht1);
rho_vert(region2) = rhos2 * exp ( - z(region2) ./ scaleht2);
rho_var           = rho_vert' * ones(d);

% Case 1
% precise number of these close to but not necessarily equal to mmax
[c1, Nroots1 ] = NR3(HL_bar,Ht_bar,mmax, N1, N2);
m1            = [1:1:Nroots1];
% Normalization coefficients
Hkn1    = ( N1 * N1 ./ c1 ./ c1 - 0.25 / ratiopp1 / ratiopp1 ) .^ 0.5;
Hknp1   = ( N2 * N2 ./ c1 ./ c1 - 0.25 / ratiopp2 / ratiopp2 ) .^ 0.5;
fac1    = sin ( Hkn1 * ratio ) ./ sin ( Hknp1 * ( ratio - 1) ) .* exp ( ratio/2/ratiopp1 - ratio/2/ratiopp2 );
A1      = 0.5 * N1 * N1 .* rhos1 * (     ratio - 0.5 * sin ( 2 * Hkn1  *  ratio      ) ./ Hkn1  )...
        + 0.5 * N2 * N2 .* rhos2 * ( 1 - ratio + 0.5 * sin ( 2 * Hknp1 * (ratio - 1) ) ./ Hknp1 ) .* fac1 .* fac1;
A1      = ( A1 .^ -0.5 ) / sqrt(HL_bar ); 
% Heating coefficients
t1      =   1 ./ (   i * pi / ratio + i * Hkn1 - 0.5 / ratiopp1 ) .* ( exp (   i * Hkn1 * ratio - 0.5 * ratiop1 ) + 1 );
t2      = - 1 ./ (   i * pi / ratio - i * Hkn1 - 0.5 / ratiopp1 ) .* ( exp ( - i * Hkn1 * ratio - 0.5 * ratiop1 ) + 1 );
t3      = - 1 ./ ( - i * pi / ratio + i * Hkn1 - 0.5 / ratiopp1 ) .* ( exp (   i * Hkn1 * ratio - 0.5 * ratiop1 ) + 1 );
t4      =   1 ./ ( - i * pi / ratio - i * Hkn1 - 0.5 / ratiopp1 ) .* ( exp ( - i * Hkn1 * ratio - 0.5 * ratiop1 ) + 1 );
s1      =   real( rhos1 * HL_bar * A1 / 4 .* ( t1 + t2 + t3 + t4 ) );

% Case 2
% [c2, Nroots2 ] = NR32(HL_bar,Ht_bar, N1, N2);
% m2      = [1:1:Nroots2];
% Hkn2    = ( N1 * N1 ./ c2 ./ c2 - 0.25 / ratiopp1 / ratiopp1  ) .^ 0.5;
% Hknp2   = ( 0.25 / ratiopp2 / ratiopp2 - N2 * N2 ./ c2 ./ c2  ) .^ 0.5;
% fac2    = sin ( Hkn2 * ratio ) ./ sinh ( Hknp2 * ( ratio - 1) ).* exp ( ratio/2/ratiopp1 - ratio/2/ratiopp2 );
% A2      = 0.5 * N1 * N1 * rhos1 .* ( ratio - 0.5 * sin ( 2 * Hkn2  *  ratio      ) ./ Hkn2  )...
%         + 0.5 * N2 * N2 * rhos2 .* ( ratio -1 - 0.5 * sinh  ( 2 * Hknp2 * (ratio - 1) ) ./ Hknp2 ) .* fac2 .* fac2;
% A2      = ( A2 .^ -0.5 ) / sqrt( HL_bar ); 
% Heating coefficients
% t1      =   1 ./ (   i * pi / ratio + i * Hkn2 - 0.5 / ratiopp1 ) .* ( exp (   i * Hkn2 * ratio - 0.5 * ratiop1 ) + 1 );
% t2      = - 1 ./ (   i * pi / ratio - i * Hkn2 - 0.5 / ratiopp1 ) .* ( exp ( - i * Hkn2 * ratio - 0.5 * ratiop1 ) + 1 );
% t3      = - 1 ./ ( - i * pi / ratio + i * Hkn2 - 0.5 / ratiopp1 ) .* ( exp (   i * Hkn2 * ratio - 0.5 * ratiop1 ) + 1 );
% t4      =   1 ./ ( - i * pi / ratio - i * Hkn2 - 0.5 / ratiopp1 ) .* ( exp ( - i * Hkn2 * ratio - 0.5 * ratiop1 ) + 1 );
% s2      =   real( rhos1 * HL_bar * A2 / 4 .* ( t1 + t2 + t3 + t4 ) );

% Case 3
% [c3, Nroots3 ] = NR33(HL_bar,Ht_bar, N1, N2);
% m3      = [1:1:Nroots3];
% Hkn3    = ( 0.25 / ratiopp1 / ratiopp1 - N1 * N1 ./ c3 ./ c3 ) .^ 0.5;
% Hknp3   = ( 0.25 / ratiopp2 / ratiopp2 - N2 * N2 ./ c3 ./ c3 ) .^ 0.5;
% fac3    = sinh ( Hkn3 * ratio ) ./ sinh ( Hknp3 * ( ratio - 1) ).* exp ( ratio/2/ratiopp1 - ratio/2/ratiopp2 );
% A3      = 0.5 * N1 * N1 * rhos1 .* ( - ratio + 0.5 * sinh ( 2 * Hkn3  *  ratio      ) ./ Hkn3  )...
%         + 0.5 * N2 * N2 * rhos2 .* ( ratio-1 - 0.5 * sinh ( 2 * Hknp3 * (ratio - 1) ) ./ Hknp3 ) .* fac3 .* fac3;
% A3      = ( A3 .^ -0.5 ) / sqrt( HL_bar ); 
% Heating coefficients
% t1      =   1 ./ (   i * pi / ratio + Hkn3 - 0.5 / ratiopp1 ) .* ( exp (   Hkn3 * ratio - 0.5 * ratiop1 ) + 1 );
% t2      = - 1 ./ (   i * pi / ratio - Hkn3 - 0.5 / ratiopp1 ) .* ( exp ( - Hkn3 * ratio - 0.5 * ratiop1 ) + 1 );
% t3      = - 1 ./ ( - i * pi / ratio + Hkn3 - 0.5 / ratiopp1 ) .* ( exp (   Hkn3 * ratio - 0.5 * ratiop1 ) + 1 );
% t4      =   1 ./ ( - i * pi / ratio - Hkn3 - 0.5 / ratiopp1 ) .* ( exp ( - Hkn3 * ratio - 0.5 * ratiop1 ) + 1 );
% s3      =   real( i * rhos1 * HL_bar * A3 / 4 .* ( t1 + t2 + t3 + t4 ) ); 

% figure(1)
% subplot(2,3,1)
% scatter(m1,c1,'c');
% grid on
% title('Case 1 wave speeds')
% subplot(2,3,2)
% scatter(m1,A1,'c');
% grid on
% title('Case 1 normalization')
% subplot(2,3,3)
% scatter(m1,real(s1),'c');
% grid on
% title('Case 1 heating coeffs')
% subplot(2,3,4)
% scatter(m3,c3,'r');
% grid on
% title('Case 3 wave speeds')
% subplot(2,3,5)
% scatter(m3,A3,'r');
% grid on
% title('Case 3 normalization')
% subplot(2,3,6)
% scatter(m3,real(s3),'r');
% grid on
% title('Case 3 heating coeffs')

% Case 1 wave speeds
ww = M2_2(s1(1), HL_bar, c1(1), A1(1), fac1(1), s, x, x_0, z, t, T, Ht_bar, sigma, N1, N2 );
bb = M3_2(s1(1), HL_bar, c1(1), A1(1), fac1(1), s, x, x_0, z, t, T, Ht_bar, sigma, N1, N2 );
Sz = S2_2(s1(1), HL_bar, c1(1), A1(1), fac1(1), s, x, x_0, z, t, T, Ht_bar, N1, N2 );
for mz = 2: Nroots1
   ww = ww + M2_2(s1(mz), HL_bar, c1(mz), A1(mz), fac1(mz), s, x, x_0, z, t, T, Ht_bar, sigma, N1, N2 );
   bb = bb + M3_2(s1(mz), HL_bar, c1(mz), A1(mz), fac1(mz), s, x, x_0, z, t, T, Ht_bar, sigma, N1, N2 );
   Sz = Sz + S2_2(s1(mz), HL_bar, c1(mz), A1(mz), fac1(mz), s, x, x_0, z, t, T, Ht_bar, N1, N2);
end
% Case 2 wave speeds
% for mz = 1: Nroots2
%    ww = ww + M2p(s2(mz), HL_bar, c2(mz), A2(mz), fac2(mz), s, x, x_0, z, t, T, Ht_bar, sigma, N1, N2 );
%    bb = bb + M3p(s2(mz), HL_bar, c2(mz), A2(mz), fac2(mz), s, x, x_0, z, t, T, Ht_bar, sigma, N1, N2 );
%    Sz = Sz + S2p(s2(mz), HL_bar, c2(mz), A2(mz), fac2(mz), s, x, x_0, z, t, T, Ht_bar, N1, N2);
% end 
% Case 3 wave speeds
% for mz = 1: Nroots3
%    ww = ww + M2p(s3(mz), HL_bar, c3(mz), A3(mz), fac3(mz), s, x, x_0, z, t, T, Ht_bar, sigma, N1, N2 );
%    bb = bb + M3p(s3(mz), HL_bar, c3(mz), A3(mz), fac3(mz), s, x, x_0, z, t, T, Ht_bar, sigma, N1, N2 );
%    Sz = Sz + S2p(s3(mz), HL_bar, c3(mz), A3(mz), fac3(mz), s, x, x_0, z, t, T, Ht_bar, N1, N2);
% end 

% Compute u
dwdz = diff ( ww ) / dz;                                                % dwrt z the w component of velocity - looses row.
dwdz( length( ww(:,1) ), : ) = dwdz ( length( dwdz(:,1) ), : );         % replace lost row with dummy data
uu    = dwdz;                                                           % Trapezium rule integration for w(x,z,t)
x_max = length( uu(1,:));                                               % Symmetry condition u = 0, x = 0 assumed to allow integratation l->r
z_max = length( uu(:,1));
for i=1: z_max
    uu(i,1) = 0.0;
end
for i = 2 : x_max
    for j = 1 : z_max
        uu(j,i) = uu(j,i-1) + dx * ( - dwdz(j,i) - dwdz(j,i-1) );
    end
end

Q_0       = 10^3;                                                         % based upon setting the PT and velocity into correct range.   
bb        = bb  / Q_0;                                                    % Value same as 1 layer code: resulting ranges agree well
ww        = ww  / Q_0;
uu        = uu  / Q_0;
dpt       = bb * 273 / 9.81;
R_spec    = 8.314 / 28.0013E-3;                                           % SPECIFIC gas constant based upon nitrogen
dp        = rho_var .*  dpt * R_spec;                                     % perturbation pressure : see below
ke_flux   = 0.5 * ( uu .* uu + ww .* ww ) .* rho_var .* ww;
p_flux    =  dp                                      .* ww;
e_flux    = ke_flux + p_flux;                                             % equ (4.6.4) of Gill
ke_flux_t = ke_flux( round(Ht_bar / dz), : ); 
e_flux_t  = e_flux ( round(Ht_bar / dz), : ); 
p_flux_t  = p_flux ( round(Ht_bar / dz), : );

e_fluxSDG = dp .* ww;
e_fluxSDGt= e_fluxSDG( round(Ht_bar / dz), : );
N2 / N1;
mean(e_fluxSDGt);

% Reconstruct heating profile as check of closure of set of wave speeds
% figure(2)
% plot(z,Sz);
% xlim([0 HV_bar]);
% grid on;
% title('Reconstructed heating function');

% Display flux of e, ke and p at the tropopause
% figure(3)
% plot( x,e_flux_t,'r' );
% grid on;
% hold on
% title('Fluxes of e, p and ke density at tropopause : computation based upon Gill (4.6.4)');
% plot( x,p_flux_t,'b' );
% grid on;
% plot( x,ke_flux_t,'g' );
% grid on;
% legend('energy','pressure','ke');

return 