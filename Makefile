# Time-stamp: <2005-02-05 18:57:42 ralf> 
# Copyright 2005 Ralf Stubner
# See the file COPYING (GNU General Public License) for license
# conditions. 

SC_SOURCE=TeXPalladioL-SC.pe Palladio-SC.sfd pplrc9d-kern.afm
IT_SOURCE=TeXPalladioL-ItalicOsF.pe Palladio-ItalicOsF.sfd pplri9d-kern.afm
BD_SOURCE=TeXPalladioL-BoldOsF.pe Palladio-BoldOsF.sfd pplb9d-kern.afm
BI_SOURCE=TeXPalladioL-BoldItalicOsF.pe Palladio-BoldItalicOsF.sfd pplbi9d-kern.afm
SOURCE=$(SC_SOURCE) $(IT_SOURCE) $(BD_SOURCE) $(BI_SOURCE) URW-OtherSubrs.ps AddGPL AddException

all: fplrc8a.pfb fplrij8a.pfb fplbj8a.pfb fplbij8a.pfb

fplrc8a.pfb: $(SC_SOURCE)
	TeXPalladioL-SC.pe

fplrij8a.pfb: $(IT_SOURCE)
	TeXPalladioL-ItalicOsF.pe

fplbj8a.pfb: $(BD_SOURCE)
	TeXPalladioL-BoldOsF.pe

fplbij8a.pfb: $(BI_SOURCE) 
	TeXPalladioL-BoldItalicOsF.pe


dist: all
	rm -rf dist/
	mkdir -p dist/{type1,afm,pfm,source}
	cp README COPYING dist/ 
	cp fplrc8a.pfb fplrij8a.pfb fplbj8a.pfb fplbij8a.pfb dist/type1/
	cp fplrc8a.pfm fplrij8a.pfm fplbj8a.pfm fplbij8a.pfm dist/pfm/
	cp fplrc8a.afm fplrij8a.afm fplbj8a.afm fplbij8a.afm dist/afm/
	cp $(SOURCE) Makefile README.source dist/source/ 
	(cd dist; zip fpl.zip README COPYING {type1,afm,pfm,source}/*)

