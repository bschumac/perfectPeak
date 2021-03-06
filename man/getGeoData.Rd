% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getGeoData.R
\name{getGeoData}
\alias{getGeoData}
\title{Retrieves online geodata and converts it to raster/sp objects}
\usage{
getGeoData(name, download=TRUE, path='', ...)
ccodes()
}
\arguments{
\item{name}{Data set name, currently supported are: 
\code{GADM}, \cr
\code{countries}, \cr
\code{SRTM}, \cr
\code{alt}, \cr
\code{worldclim},\cr
\code{schmatzPangea},\cr  
\code{harrylist}, \cr
\code{OSM}, \cr
\code{tiroldem}.\cr 
See Details for more info}

\item{download}{Logical \code{TRUE} data will be downloaded if not locally available}

\item{path}{Character Path name indicating where to store the data. Default is the current working directory}

\item{...}{Additional required (!) parameters. These are data set specific. See Details}
}
\value{
A spatial object (Raster* or Spatial*)
}
\description{
Robert J. Hijmans getData() from the raster package is well known and highly used. The only disadvantage is that it currently doesn't support a bunch of great additional and/or improved/newer data sets.  getGeoData provides some more actual or better choices for climate and DEM data as well as some easy to use interfaces to OSM and other crowd sourced data compilations. 
The main issue of the functionis to offer an easy to use access to a wider range of free to access data sets that may improve significantly the quality of typical ecological and other spatial analysis approaches by an straightforward utilization of data.
You may download the data individually but by default all data will be downloaded georeferenced and converted in \link{raster} or \link{sp} objects.
}
\details{
\code{GADM} is a database of global administrative boundaries. \cr 
\code{alt} stands for altitude (elevation); the data were aggregated from SRTM 90 m resolution data between -60 and 60 latitude. \cr
\code{countries} has polygons for all countries at a higher resolution than the 'wrld_simpl' data\cr in the maptools pacakge . \cr 
If  \code{name}='alt' or \code{name}='GADM' you must provide a 'country=' argument. Countries are specified by their 3 letter ISO codes. Use getData('ISO3') to see these codes. In the case of GADM you must also provide the level of administrative subdivision (0=country, 1=first level subdivision). In the case of alt you can set 'mask' to FALSE. If it is TRUE values for neighbouring countries are set to NA. For example:\cr \cr
    \code{getGeoData('GADM', country='FRA', level=1)}\cr
    \code{getGeoData('alt', country='FRA', mask=TRUE)}\cr
\cr
\code{SRTM} refers to the hole-filled CGIAR-SRTM (90 m resolution). \cr
If  \code{name}='SRTM' you must provide 'lon' and 'lat' arguments (longitude and latitude). These should be single numbers somewhere within the SRTM tile that you want.\cr
   \code{getGeoData('SRTM', lon=5, lat=45)}\cr
\cr

If \code{name}=CMIP5 for (projected) future climate data you must provide arguments var and res as above. Only resolutions 2.5, 5, and 10 are currently available. In addition, you need to provide model, rcp and year. 
For example:\cr
  \code{getData('CMIP5', var='tmin', res=10, rcp=85, model='AC', year=70)}\cr
  function (var, model, rcp, year, res, lon, lat, path, download = TRUE)\cr
  'model' should be one of "AC", "BC", "CC", "CE", "CN", "GF", "GD", "GS", "HD", "HG", "HE", "IN", "IP", "MI", "MR", "MC", "MP", "MG", or "NO".\cr
  'rcp' should be one of 26, 45, 60, or 85.\cr
  'year' should be 50 or 70\cr
Not all combinations are available. See www.worldclim.org for details.\cr
\cr

\code{worldclim} is a database of global interpolated climate data. \cr
If  \code{name}='worldclim' you must also provide a variable name 'var=', and a resolution 'res='. Valid variables names are 'tmin', 'tmax', 'prec' and 'bio'. Valid resolutions are 0.5, 2.5, 5, and 10 (minutes of a degree). In the case of res=0.5, you must also provide a lon and lat argument for a tile; for the lower resolutions global data will be downloaded. In all cases there are 12 (monthly) files for each variable except for 'bio' which contains 19 files.\cr
   \code{getGeoData('worldclim', var='tmin', res=0.5, lon=5, lat=45)} \cr
   \code{getGeoData('worldclim', var='bio', res=10)}\cr\cr

 +++ additional datasets +++ \cr\cr
 
\code{schmatzPangea} provides the Gridded climate data from 5 Global Climate Models (GCM) of the Last Glacial Maximum (LGM) downscaled to 30 arc seconds for Europe \url{http://doi.pangaea.de/10.1594/PANGAEA.845883}\cr
If  \code{name}='schmatzPangea' you have to specify the item of interest. Please note: The data download may take a long time!\cr
The list of allowd items is: \cr
  \itemize{
\item \code{prec_eu_wc_30s} baseline climate	precipitation, Worldclim LGM coastline, current, 30x30sec	,	http://hs.pangaea.de/model/schmatz/prec_eu_wc_30s 
\item \code{tave_eu_wcpi_30s} baseline climate	average surface air temperature, Worldclim LGM coastline, preindustrial, 30x30sec	,	http://hs.pangaea.de/model/schmatz/tave_eu_wcpi_30s	 
\item \code{tmax_eu_wcpi_30s} baseline climate	maximum surface air temperature, Worldclim LGM coastline, preindustrial, 30x30sec	,	http://hs.pangaea.de/model/schmatz/tmax_eu_wcpi_30s	
\item \code{tmin_eu_wcpi_30s} baseline climate	minimum surface air temperature, Worldclim LGM coastline, preindustrial, 30x30sec	,	http://hs.pangaea.de/model/schmatz/tmin_eu_wcpi_30s	
\itemize{
\item \code{prec_*,tave_*,tmax_*,tmin_*}: \code{startTime = 1}  is equivalent to LGM average Januar  \code{endTime = 12}  is equivalent to LGM average december
}
\item \code{bioclim_A_MO_pmip2_21k_oa_CCSM_eu_30s} bioclimatic variables	19 bioclimatic variables, CCSM, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/bioclim_A_MO_pmip2_21k_oa_CCSM_eu_30s	
\item \code{bioclim_A_MO_pmip2_21k_oa_CNRM_eu_30s} bioclimatic variables	19 bioclimatic variables, CNRM, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/bioclim_A_MO_pmip2_21k_oa_CNRM_eu_30s	
\item \code{bioclim_A_MO_pmip2_21k_oa_FGOALS_eu_30s} bioclimatic variables	19 bioclimatic variables, FGOALS, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/bioclim_A_MO_pmip2_21k_oa_FGOALS_eu_30s	
\item \code{bioclim_A_MO_pmip2_21k_oa_IPSL_eu_30s} bioclimatic variables	19 bioclimatic variables, IPSL, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/bioclim_A_MO_pmip2_21k_oa_IPSL_eu_30s	
\item \code{bioclim_A_MO_pmip2_21k_oa_MIROC3.2_eu_30s} bioclimatic variables	19 bioclimatic variables, MIROC3.2, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/bioclim_A_MO_pmip2_21k_oa_MIROC3.2_eu_30s	
\itemize{
\item \code{bioclim_*}: \code{startTime = 1}  is equivalent to LGM average year \code{endTime = 1}  is equvalent to LGM average year
#' \itemize{
\item \code{bio_1} Annual Mean Temperature ; units = "C*10" ; FillValue = -9999 ; missing_value = -9999
\item \code{bio_2} Mean Diurnal Range (Mean(period max-min))" ; units = "C*10" ; FillValue = -9999 ; missing_value = -9999
\item \code{bio_3} Isothermality (P2 / P7)" ; units = "C*10" ; FillValue = -9999 ; missing_value = -9999
\item \code{bio_4} Temperature Seasonality (standard deviation)" ; units = "C*10" ; FillValue = -9999 ; missing_value = -9999
\item \code{bio_5} Max Temperature of Warmest Period" ; units = "C*10" ; FillValue = -9999 ; missing_value = -9999
\item \code{bio_6} Min Temperature of Coldest Period" ; units = "C*10" ; FillValue = -9999 ; missing_value = -9999
\item \code{bio_7} Temperature Annual Range (P5-P6)" ; units = "C*10" ; FillValue = -9999 ; missing_value = -9999
\item \code{bio_8} Mean Temperature of Wettest Quarter" ; units = "C*10" ; FillValue = -9999 ; missing_value = -9999
\item \code{bio_9} Mean Temperature of Driest Quarter" ; units = "C*10" ; FillValue = -9999 ; missing_value = -9999
\item \code{bio_10} Mean Temperature of Warmest Quarter" ; units = "C*10" ; FillValue = -9999 ; missing_value = -9999
\item \code{bio_11} Mean Temperature of Coldest Quarter" ; units = "C*10" ; FillValue = -9999 ; missing_value = -9999
\item \code{bio_12} Annual Precipitation" ; units = "mm" ; FillValue = -9999 ; missing_value = -9999		
\item \code{bio_13} Precipitation of Wettest Period" ; units = "mm" ; FillValue = -9999 ; missing_value = -9999		
\item \code{bio_14} Precipitation of Driest Period" ; units = "mm" ; FillValue = -9999 ; missing_value = -9999		
\item \code{bio_15} Precipitation Seasonality (Coefficient of Variation)" ; units = "mm" ; FillValue = -9999 ; missing_value = -9999		
\item \code{bio_16} Precipitation of Wettest Quarter" ; units = "mm" ; FillValue = -9999 ; missing_value = -9999		
\item \code{bio_17} Precipitation of Driest Quarter" ; units = "mm" ; FillValue = -9999 ; missing_value = -9999		
\item \code{bio_18} Precipitation of Warmest Quarter" ; units = "mm" ; FillValue = -9999 ; missing_value = -9999		
\item \code{bio_19} Precipitation of Coldest Quarter" ; units = "mm" ; FillValue = -9999 ; missing_value = -9999		#' }
}
\item \code{pr_A_MO_pmip2_21k_oa_CCSM_eu_30s} downscaled GCM	precipitation, CCSM, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/pr_A_MO_pmip2_21k_oa_CCSM_eu_30s	
\item \code{pr_A_MO_pmip2_21k_oa_CNRM_eu_30s} downscaled GCM	precipitation, CNRM, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/pr_A_MO_pmip2_21k_oa_CNRM_eu_30s	
\item \code{pr_A_MO_pmip2_21k_oa_FGOALS_eu_30s} downscaled GCM	precipitation, FGOALS, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/pr_A_MO_pmip2_21k_oa_FGOALS_eu_30s	
\item \code{pr_A_MO_pmip2_21k_oa_IPSL_eu_30s} downscaled GCM	precipitation, IPSL, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/pr_A_MO_pmip2_21k_oa_IPSL_eu_30s	
\item \code{pr_A_MO_pmip2_21k_oa_MIROC3.2_eu_30s} downscaled GCM	precipitation, MIROC3.2, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/pr_A_MO_pmip2_21k_oa_MIROC3.2_eu_30s	
\item \code{tas_A_MO_pmip2_21k_oa_CCSM_eu_30s} downscaled GCM	average surface air temperature, CCSM, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/tas_A_MO_pmip2_21k_oa_CCSM_eu_30s	
\item \code{tas_A_MO_pmip2_21k_oa_CNRM_eu_30s} downscaled GCM	average surface air temperature, CNRM, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/tas_A_MO_pmip2_21k_oa_CNRM_eu_30s	
\item \code{tas_A_MO_pmip2_21k_oa_FGOALS_eu_30s} downscaled GCM	average surface air temperature, FGOALS, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/tas_A_MO_pmip2_21k_oa_FGOALS_eu_30s	
\item \code{tas_A_MO_pmip2_21k_oa_IPSL_eu_30s} downscaled GCM	average surface air temperature, IPSL, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/tas_A_MO_pmip2_21k_oa_IPSL_eu_30s	
\item \code{tas_A_MO_pmip2_21k_oa_MIROC3.2_eu_30s} downscaled GCM	average surface air temperature, MIROC3.2, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/tas_A_MO_pmip2_21k_oa_MIROC3.2_eu_30s	
\item \code{tasmax_A_MO_pmip2_21k_oa_CCSM_eu_30s} downscaled GCM	maximum surface air temperature, CCSM, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/tasmax_A_MO_pmip2_21k_oa_CCSM_eu_30s	
\item \code{tasmax_A_MO_pmip2_21k_oa_CNRM_eu_30s} downscaled GCM	maximum surface air temperature, CNRM, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/tasmax_A_MO_pmip2_21k_oa_CNRM_eu_30s	
\item \code{tasmax_A_MO_pmip2_21k_oa_FGOALS_eu_30s} downscaled GCM	maximum surface air temperature, FGOALS, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/tasmax_A_MO_pmip2_21k_oa_FGOALS_eu_30s
\item \code{tasmax_A_MO_pmip2_21k_oa_IPSL_eu_30s} downscaled GCM	maximum surface air temperature, IPSL, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/tasmax_A_MO_pmip2_21k_oa_IPSL_eu_30s	
\item \code{tasmax_A_MO_pmip2_21k_oa_MIROC3.2_eu_30s} downscaled GCM	maximum surface air temperature, MIROC3.2, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/tasmax_A_MO_pmip2_21k_oa_MIROC3.2_eu_30s	
\item \code{tasmin_A_MO_pmip2_21k_oa_CCSM_eu_30s} downscaled GCM	minimum surface air temperature, CCSM, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/tasmin_A_MO_pmip2_21k_oa_CCSM_eu_30s	
\item \code{tasmin_A_MO_pmip2_21k_oa_CNRM_eu_30s} downscaled GCM	minimum surface air temperature, CNRM, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/tasmin_A_MO_pmip2_21k_oa_CNRM_eu_30s	
\item \code{tasmin_A_MO_pmip2_21k_oa_FGOALS_eu_30s} downscaled GCM	minimum surface air temperature, FGOALS, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/tasmin_A_MO_pmip2_21k_oa_FGOALS_eu_30s
\item \code{tasmin_A_MO_pmip2_21k_oa_IPSL_eu_30s} downscaled GCM	minimum surface air temperature, IPSL, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/tasmin_A_MO_pmip2_21k_oa_IPSL_eu_30s
\item \code{tasmin_A_MO_pmip2_21k_oa_MIROC3.2_eu_30s} downscaled GCM	minimum surface air temperature, MIROC3.2, LGM, 30x30sec	,	http://hs.pangaea.de/model/schmatz/tasmin_A_MO_pmip2_21k_oa_MIROC3.2_eu_30s
\itemize{
\item \code{pre_*,tas_*,tasmax_*,tasmin_*}: \code{startTime = 1}  is equivalent to LGM average Januar  \code{endTime = 12}  is equivalent to LGM average december
}
\item \code{TT_Luterbacher_Xoplaki_1659-1998} reconstructed climate average surface air temperature, reconstructed+CRU, 1659-1998, 0.5x0.5 deg	,	http://hs.pangaea.de/model/schmatz/TT_Luterbacher_Xoplaki_1659-1998
#'   \itemize{
\item \code{TT}: \code{startTime = 1}  is equivalent to the Januar 1659 \code{endTime = 4080}  is equvalent to December 1998
}
}
\code{m<-getGeoData('schmatzPangea', item="tasmax_A_MO_pmip2_21k_oa_CCSM_eu_30s",startTime=1,endTime=3)}
\code{m<-getGeoData('schmatzPangea', item="bioclim_A_MO_pmip2_21k_oa_CCSM_eu_30s",data="bio_1")}
\code{TT<- getGeoData('schmaztLGMData', item='TT_Luterbacher_Xoplaki_1659-1998')}

\code{harrylist} is a list of world wide about 60.000 coordinates altitudes and names of summits \link{PeakList}\cr 
If  \code{name=}'harrylist' you will download and clean the complete list\cr
   \code{getGeoData('harrylist')}\cr \cr
   
\code{OSMp} is the OSM Point Data from the current OSM database\cr
If  \code{name}='OSMp' you must provide lat_min,lat_max,lon_min,lon_max for the boundig box. Additionally you must set  the switch 'all' to \code{FALSE} if you just want to download a specified item. Then you have to  provide the content of the desired items in the 'key' and 'val' argument. According to this combination you have to provide a tag list containing the Tags of the element c('name','ele').\cr\cr
   \code{getGeoData('OSMp', extent=c(11.35547,11.40009,47.10114,47.13512), key='natural',val='peak',taglist=c('name','ele'))}\cr \cr
   
\code{tiroldem} refers to the 10 m Lidar based DEM as provided by the Authorithy of Tirol. For Copyright and further information  see: \link{DEM}\cr \cr    
If  \code{name}='tiroldem' you must set the switch 'all' to \code{FALSE} if you just want to download a specified item you have to set data=item. 
The list of allowd items is: 
\itemize{
\item \code{ibk_10m} Innsbruck, 
\item \code{il_10m} Innsbruck Land, 
\item \code{im_10m} Imst, 
\item \code{kb_10m} Kitzbühl, 
\item \code{ku_10m} Kufstein, 
\item \code{la_10m} Landeck, 
\item \code{re_10m} Reutte, 
\item \code{sz_10m} Schwaz, 
\item \code{lz_10m} Lienz (Osttirol). 
}
For use in ArcGIS the data is correctly georeferenced. However for R you MUST use the following proj4 strings if you want to project other data acccording to the Austrian Datum. DO NOT USE the default EPSG Code string! All datasets except Lienz are projected with: ''+proj=tmerc +lat_0=0 +lon_0=10.33333333333333 +k=1 +x_0=0 +y_0=-5000000 +ellps=bessel +towgs84=577.326, 90.129, 463.919, 5.137, 1.474, 5.297, 2.4232 +units=m'. Item=lz_10m (Lienz) has an different Central_Meridian. You have to change it to 13.333333.\cr

\code{getGeoData('tiroldem', item = 'ku_10m')} \cr
}
\examples{
  
#### Example getGeoData
      
\dontrun{
getGeoData('schmatzPangea', item='tasmin_A_MO_pmip2_21k_oa_CNRM_eu_30s',endTime=12)
getGeoData('schmatzPangea', item="bioclim_A_MO_pmip2_21k_oa_CCSM_eu_30s", layer="bio_1")
getGeoData('tiroldem', item='ibk_10m', all=FALSE)
getGeoData('OSMp', extent=c(11.35547,11.40009,47.10114,47.13512), key='natural',val='saddle',taglist=c('name','ele','direction'))
getGeoData('harrylist', extent=c(11.35547,11.40009,47.10114,47.13512))
#
###
getGeoData('worldclim', var='tmin', res=0.5, lon=5, lat=45)
getGeoData('worldclim', var='bio', res=10)
getData('CMIP5', var='tmin', res=10, rcp=85, model='AC', year=70)
getGeoData('SRTM', lon=5, lat=45)
getGeoData('alt', country='FRA', mask=TRUE)
getGeoData('GADM', country='FRA', level=1) 
ccodes()
}
}
\author{
Robert J. Hijmans, Chris Reudenbach \email{giswerk@gis-ma.org}
}
\references{
\url{http://www.worldclim.org}\cr
\url{http://www.gadm.org}\cr
\url{http://srtm.csi.cgiar.org/}\cr
\url{http://diva-gis.org/gdata}\cr
\url{http://www.tourenwelt.info}\cr
\url{https://www.tirol.gv.at/data/datenkatalog/geographie-und-planung/digitales-gelaendemodell-tirol/}\cr
\url{http://www.openstreetmap.org}\cr
\url{http://doi.pangaea.de/10.1594/PANGAEA.845883}\cr
}

