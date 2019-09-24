# Meetings for 2019 Melt Events at Summit

## 17 September 2019, Meeting with Neely
- Neely could install both an X-band radar (to measure precip) and perhaps the Super Lidar at the Climate Research Center in Nuuk
  - Forgot to mention this to Jen Mercer
- NERC does long-term monitoring at a couple of sites (including Azores? and UK)
  - So "monitoring" isn't necessarily a bad work to them
- Instrumentation costs
  - MMR = $200-300K
  - MPL = $150K
  - mini-MPL = $100-120K

---

## 17 September 2019, Meeting with Heather Guy at Summit
- I asked Heather to dig a couple of pits
  - Sam Dorsi responded that Zoe Courville dug some pits while she was at Summit in late August, so these might suffice for us
  - So email Zoe about this
- Nate Bowker was already on the Skype call
  - He mentioned Koni Steffen "snow radar" and the fact that there might be thermistor string installed with that instrument (near the TAWO tower)
    - However there were issues with the communications from the tower to the station
      - SRI was looking at this at the end of the season; not sure of current status
  - Zoe C. also took measurements with a ground-penetrating radar (GPR) during her trip, looking at sewage outfalls, but she also might have looked at undisturbed snow too
  - The Swiss radiometer data and sun tracker data are all being archive on the Summit FTP site and can easily be downloaded
- Email from Sam Dorsi today
```
Von and Heather,
 
Hello! Heather reports that you are interested in having her dig snow pits at Summit to gather information on the late July melt event. I wanted to mention that during her Summit visit in August, Zoe Courville did dig several pits to document these melt layers at Summit. Depending on what you’re looking for, she may already have the information on these melt layers that you need.
 
If you need something beyond Zoe’s observations, I would recommend Heather digging a pit in the wide open area well to the south of the MSF, but outside of the science sectors. That area is rarely disturbed and so quite suitable for near-surface pits (as this layer in question is probably still pretty shallow). And it would not generate a logged disturbance which requires approvals and a GPS survey.
 
Heather had also asked about snow temperature profiles from Koni Steffen. He does make sub-surface temperature measurements at the GC-Net sites (one of which you pass on the way to the ICESat Traverse). These data are handled through his own independent system, and can be requested directly from the PI. Information on the GC-Net sites, and a link to the data request form are at:
http://cires1.colorado.edu/steffen/gcnet/
I am not aware of sub-surface temperature measurements being made at the upGPR site, but you could certainly ask (Konrad Steffen <konrad.steffen@wsl.ch>).
 
Send any questions! Best,
 
Sam
```
---

## 17 September 2019, Meeting with Melt Event research group
- Attendees
  - Chris, Bill and Ian
  - Missing - Neely and Shupe
    - But I talked with Neely afterwards and filled him in
- Neff
  - Summarized his research on the large scale situations under which melt events are occurring in Greenland, with a focus on the effects of recent hurricanes
  - He contacted HC who indicated that the melt event did NOT occur at East GRIP this summer. Therefore, there is no interesting water isotope information from the snow. East GRIP was apparently under the influence of a different air mass.
  - Interested in pit information
    - Depth of any melt layers
    - Multiple melt layers from June vs. July
      - June layer may have inhibit heat from being transferred to the surface during the July event
- Chris
  - Chuck Long retired, so there is some confusion around the lab as to how to apply calibration coefficients to broadband radiometers
    - Chuck instituted some good changes, but NOAA personnel are unsure of what to do now
      - Chris is sorting this out
      - He'll send me an update before he leaves Tromso for MOSAiC
- Ian
  - He will ask Heather to start processing the flux data from the TAWO tower
    - Licor data might also be interesting to sort out water vapor transport during the melt events
- Von
  - I told them I would ask Heather about digging a pit or two
  - Also I want to get CLARRA working...

---

## 3 September 2019
- Attendees
  - Chris, Bill Neff, and Matt Shupe

- Links to Jupyter Notebooks
  - [12 June 2019](/Users/vonw/work/projects/icecaps/analysis/SummitMeltEvents/190612/SummitMelt2019Event.ipynb)
  - [29-31 July 2019](/Users/vonw/work/projects/icecaps/analysis/SummitMeltEvents/190729_190731/SummitMelt2019Event.ipynb)

---

### ToDo
- [ ] Contact Neely about his research and paper outline
  - [ ] Does he have separate radiation measurements?
  - [ ] When will you reemerge?
- [ ] Ask Heather to dig a shallow snow pit and photograph ice lens layers
  - [ ] Can we see both the June and July events?
  - [ ] Then ask her to estimate the density of both lenses.
    - [ ] Take a chunk of snow and estimate volume and weigh it for both lenses, if they exist.
- [ ] Temperature of base of cloud > 0 C?
  - [ ] Estimate using some grey-body emissivity for cloud

---

### Upcoming Travel
- Matt
  - 6-13 Sept - Germany
  - 13-20 Sept - Tromso
  - 20 Sept - Jan 2020 - MOSAiC (text email only)
- Chris
  - 12 Sept - 20 Sept Tromso
  - 20 Sept - 1 Nov MOSAiC (text email only)

---

### Chris
- Figures
  - [Net Radiation](FromChrisCox-1_20190903.png)
  - [CRF vs dT](FromChrisCox-2_20190903.png)
- Net radiation around 50 W m-2
  - Events are indistinguishable
  - Nothing special; 1 or 2 sigma event in net radiation
- CRF is VERY different; puzzling
- Surface Albedo
  - All albedos are reasonable
  - June - low albedos to start with, but not anomalously low
  - July - high to begin with, then drops 5%
    - Why was it so high in late July just before the melt event?
- But the conductive flux from the surface could be anomalous
  - If you remove LWU from EB, then normal June/July is different from events.
  - Calculation of energy to melt = to extra heat
- So the question is, what could precondition the sursurface?

- If none of the pieces are rare, then events must have just lined up in time to create a rare event.

- 2013 has great data b/c David Noone and Chris have subsurface temperatures
  - Look up Max Berkelhammer's papers

- What about the effect of TWO ICE LENSES, one from June and another in July?
  - Did the June event help set up the July event?

- Need a thermistor string at Summit ASAP