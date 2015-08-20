#!/bin/bash

gmt set PS_MEDIA letter
gmt set PROJ_LENGTH_UNIT p
gmt set PS_PAGE_ORIENTATION landscape
gmt set FONT_LABEL 09p
gmt set MAP_FRAME_WIDTH 4p
gmt set FONT_ANNOT_PRIMARY 12p
gmt set FONT_LABEL 12p
gmt set MAP_TICK_LENGTH_PRIMARY 0.05i

# make the color palette
gmt makecpt -Cseis -T0/1/0.01 > yr1map.cpt

########## WORLD MAP ##########
gmt pscoast -R-180/180/-60/60 -JM8i -Xc -Yc -B40g40 -Dl -Glightgrey -N1/0.1p,grey50 -A1000/0/0 -K > yr1map.ps
# add locations
gmt psxy noH_yr_one_to_gmt.xy -R -J -Sc5 -Cyr1map.cpt -W0.05p,black -V -K -O >> yr1map.ps
gmt psxy -R -J -Sa12 -Ggold -W0.5p,black -V -O << EOF >> yr1map.ps
-95.383056	29.762778	
EOF

########## USA ONLY ##########
gmt pscoast -R-130/-70/24/52 -JL-100/35/33/45/8i -Xc -Yc -B10a0 -Di -Glightgrey -N1/0.5p,red -N2/0.1p,grey50 -A1000/0/0 -K > us_map.ps
# add locations
gmt psxy noH_yr_one_to_gmt.xy -R -J -Sc6 -Cyr1map.cpt -W0.05p,black -V -K -O >> us_map.ps
gmt psxy -R -J -Sa12 -Ggold -W0.5p,black -V -O << EOF >> us_map.ps
-95.383056	29.762778	
EOF

########## GULF COAST ##########
gmt pscoast -R-105/-85/24/34 -JL-97/30/25/29/8i -Xc -Yc -B5 -Df -Glightgrey -Ia/0.1p,navyblue -Cnavyblue -N1/0.5p,red -N2/0.1p,grey50 -A0/0/4 -K > GC_map.ps
# add locations
gmt psxy noH_yr_one_to_gmt.xy -R -J -Sc7 -Cyr1map.cpt -W0.05p,black -V -K -O >> GC_map.ps
gmt psxy -R -J -Sa12 -Ggold -W0.5p,black -V -O << EOF >> GC_map.ps
-95.383056	29.762778	
EOF




