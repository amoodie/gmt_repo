#!/bin/bash

gmt set PS_MEDIA letter
gmt set PROJ_LENGTH_UNIT inch
gmt set PS_PAGE_ORIENTATION landscape
gmt set FONT_LABEL 09p
gmt set MAP_FRAME_WIDTH 4p
gmt set FONT_ANNOT_PRIMARY 12p
gmt set FONT_LABEL 12p
gmt set MAP_TICK_LENGTH_PRIMARY 0.05i

# make the map
gmt pscoast -R-126/16/-54/48r -JA-100/30/5i -Xc -Yc -B20a0g20 -Dl -Ggrey -A1000/0/0 -K > APP_con.ps

# make the coast outlines lakes
gmt pscoast -R-126/16/-54/48r -JA-100/30/5i -Xc -Yc -Dl -W -A1000/0/4 -K -O >> APP_con.ps

# make the box outline
gmt psxy -R -JA-100/30/5i -O -W1.0,black,-. -V -K << EOF >> APP_con.ps
-87	33
-87	41.5
-74	41.5
-74	33
-87	33
EOF

# draw red connection line
gmt psxy -R -JA-100/30/5i -O -W0.5p,red,.. -V -K << EOF >> APP_con.ps
-75.379		40.607167
-95.402778	29.716944
EOF

# add University stars
gmt psxy -R -JA-100/30/5i -O -Sa0.15 -Gred -W0.1p,black -V << EOF >> APP_con.ps
-75.379		40.607167
-95.402778	29.716944
EOF
