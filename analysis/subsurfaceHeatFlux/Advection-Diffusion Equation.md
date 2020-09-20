### Advection-Diffusion Equation

From https://en.wikipedia.org/wiki/Convection%E2%80%93diffusion_equation


$$ \frac{\partial \phi}{\partial t} = \bold{\nabla} \cdot (D \nabla \phi) - \bold{\nabla} \cdot (\vec{v} \phi) + R $$

Time rate of change of $\phi$ is equal to Diffusion - Advection + Sources. D is the diffusivity. In our case, it is the thermal diffusivity:

From https://en.wikipedia.org/wiki/Thermal_diffusivity

$$ \alpha = \frac{k}{\rho c_p} $$

where k is the thermal conductivity $(W m^{-1} K^{-1})$, $\rho$ is the density $(kg \space m^{-3})$ and $c_p$ is the specific heat capacity $(J \space kg^{-1} \space K^{-1})$. $\alpha$ is the thermal diffusivity and has units of $m^2 s^{-1}$, area per time.

### Application to Snow

$$ \phi = Temperature = T $$

Rearrange equation (like MST):

$$ \frac{\partial (\rho T)}{\partial t} + \bold{\nabla} \cdot (\vec{v} T) = \bold{\nabla} \cdot (\frac{k}{c_p} \nabla T) + \frac{S}{c_p} $$

where S is now the source term in $(W m^{-3})$.

MST defines

$$ \Gamma = \frac{k}{c_p} $$,

and he uses $\phi$ instead of T, to give

$$ \frac{\partial (\rho \phi)}{\partial t} + \bold{\nabla} \cdot (\vec{v} \phi) = \bold{\nabla} \cdot (\Gamma \nabla \phi) + \frac{S}{c_p} $$


### Thermal Properties of Snow

1. The surface skin temperature was measured by the ICECAPS-ACE KT15 instrument on the Flux Tower near TAWO from 29-31 July 2019. The temperatures ranged from about -15 to 0 C. The temperature at 6.5 meters will be at the annual mean temperature. I calculated this by taking the mean of 10 years worth of 2 m air temperature data obtained by NOAA ESRL at Summit Station; xx K.

2. The snow density profile down to about 1 meter was measured at Summit Station on 9 October by Heather Guy. The measurements ranged from 152 to 370 kg m-3. Tedesco and Marshall (2010) measured two snow pits down to 4 meters near Summit, which can be used to approximate the density profile below 1 meter. Their values don't increase much from 1 to 4 meters, so it might be appropriate to simply use the average value below 1 meter, which is 346 kg m-3. Another possibility is to use the values from Dalrymple et al (1966) of snow density measurements from South Pole down to 6.5 meters (under the not-so-great assumption that Summit snow is like South Pole snow...). Dalrymple et al's values increase monotonically from 377 to 478 kg m-3 from 1.5 to 6 meters.
   
3. Sturm et al (1997), J. Glac, 43(143), 26-41 published a formula to estimate the thermal conductivity of snow based on the snow density. So thermal conductivity can easily be calculated based on the density profile.

$$k_{eff} = 0.138 - 1.01 \rho + 3.233 \rho^2$$

4. Figure 12 in Yen's CRREL Report, Review of thermal properties of snow, ice and sea ice (1981) provides data on how the specific heat of ice varies with temperature. This figure shows that cp varies from about 33.5 to 37.5 J mol-1 K-1 (or 1861 to 2083 J kg-1 K-1) from 240 to 273 K. (Dalrymple et al's (1966) values from South Pole range from 1739 J kg-1 K-1 at the surface to 1716 J kg-1 K-1 at 6.5 meters depth.)