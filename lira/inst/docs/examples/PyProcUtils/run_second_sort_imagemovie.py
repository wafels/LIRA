'''
@brief Runs routines that reads in MC "movie" file + moments in fits form.
@author A. Connors
'''
# @file run_sort_imagemovie.py
#
# This script is explicitly for reading in "output.txt" format files
# and writing them out in fits form compatible with
# CHASC imaging software.
#
import pyfits
from numpy import *
from sort_imagemovie import *

#
### New format for "ThirdSort ... requires Exposure file for nicer output.
##
wrkdir = '/Volumes/LaCie d2 195 GB/HandyEMC2Chandra2009PWNRuns_2/'
filestem1='do_emc2v10_on_img_1.5_7.256RBonRabbit1_modelcnts0_bkg_1.5_7.kev.090704c.2'
#filestem1 = 'do_emc2v10_on_pois_null_flat_pt_cnts0_bkg_1.5_7.256RBonRabbit1.090705abcdd_modelcnts0_bkg_1.5_7.kev.090706.2'
wrkdir1 = '/AstroCode/Chandra2009SNRPWN/MalloryRobertsRabbitData/'
expfile = 'rabbit_proc_images/expmap_1.5_7.256RBonRabbit1.fits'
infile_list = [(wrkdir+filestem1+'.chopmovies.fits', \
                wrkdir+filestem1+'.sort2.fits',      \
                wrkdir+filestem1+'.wrongconf.fits',  \
                wrkdir+filestem1+'.10perc.conf.fits',
                wrkdir1+expfile),           \
                   ]

#-----------------------------------------------------------------------#

wrkdir1 = '/Volumes/LaCie d2 195 GB/AstroStatStorage/AstroData/IC443All1stYearData100to300000MeV_Storage/RunFiles/'
wrkdir2 = '/Volumes/LaCie d2 195 GB/AstroStatStorage/AstroData/IC443All1stYearData100to300000MeV_Storage/Results/'
wrkdir3 = wrkdir2

filestemabde= 'ic443_1stYr_010to100GeV_0.05deg_cnts_vs_fewfit_model.100131abde'
filestem00to04= 'sim00to005_ic443_1stYr_010to100GeV_0.05deg_cnts_vs_fewfit_model.100130a'
expfile= 'WCSFlat_1.000000_256sq.fits'

infile_list = [(wrkdir2+filestemabde+'.chopmovies.fits', \
                wrkdir2+filestemabde+'.sort2.fits',      \
                wrkdir3+filestemabde+'.wrongconf.fits',  \
                wrkdir3+filestemabde+'.10perc.conf.fits',
                wrkdir1+expfile),           \
               (wrkdir2+filestem00to04+'.chopmovies.fits', \
                wrkdir2+filestem00to04+'.sort2.fits',      \
                wrkdir3+filestem00to04+'.wrongconf.fits',  \
                wrkdir3+filestem00to04+'.10perc.conf.fits',
                wrkdir1+expfile),           \
                   ]

#-----------------------------------------------------------------------#
#-----------------------------------------------------------------------#

wrkdir1 = '../exampledata/'
wrkdir2 = 'intermediatefiles/'
wrkdir3 = 'intermediatefiles/'

#filestemdat= 'Simple04_Gauss2d1.5_PoisDatons128x128testEvsNull_about0to2'
#filestemdat= 'Simple04_Gauss2d1.5_PoisDatons128x128testEvsNull_about3to5'
#filestemdat= 'Simple04_Gauss2d1.5_PoisDatons128x128testEvsNull_about6to8'
#filestemdat= 'Simple04_Gauss2dSig1.5_17x17PSF_SimPois0to3_128x128testEvsNullModel'
filestemdat = 'Simple04_Gauss2dSig1.5_17x17PSF_SimPois3to5_128x128testEvsNullModel'

expfile= 'FlatUnityExposure128sq.fits'

infile_list = [(wrkdir2+filestemdat+'.chopmovies.fits', \
                wrkdir3+filestemdat+'.sort2.fits',      \
                wrkdir3+filestemdat+'.wrongconf.fits',  \
                wrkdir3+filestemdat+'.05perc.conf.fits',
                wrkdir1+expfile),           
                   ]

#-----------------------------------------------------------------------#
#-----------------------------------------------------------------------#

num_burn_in = 0

for nametuple in infile_list:
    print ' File names:\n',nametuple, '\n'

# Now here is the new-fangled way:
#    Limits = [.10000, .5, .90000]
    Limits = [.050000, .5, .95000]
    print 'AT run_second_sort_imagemovie:  Limits requested: ', Limits, '\n'
    movieMCImageHDULst = pyfits.open(nametuple[0])
    print movieMCImageHDULst[0].header
    print movieMCImageHDULst[0].data[0][0][0]
    (naxis3,naxis2,naxis1) = movieMCImageHDULst[0].data.shape
    movieMCImageAfterBurninData = movieMCImageHDULst[0].data[num_burn_in:naxis3]

    outHDU = pyfits.PrimaryHDU(data=movieMCImageAfterBurninData)

    InExpHDULst = pyfits.open(nametuple[4])
    print InExpHDULst[0].header
    if   ( len(InExpHDULst[0].data.shape) >= 3 ):
        print InExpHDULst[0].shape
        print InExpHDULst[0].data[0][0][0]
        Exp2DData = InExpHDULst[0].data[0]
    elif ( len(InExpHDULst[0].data.shape) == 2):
        print InExpHDULst[0].data.shape
        print InExpHDULst[0].data[0][0]
        Exp2DData = InExpHDULst[0].data

    print 'AT run_second_sort_imagemovie:  Calling ThirdSimpleImageConfBands: \n \n \n'
#    tstconfbands = SecondSimpleImageConfBands(outHDU,nametuple[3],IntensConfidences=Limits)
    tstconfbands = ThirdSimpleImageConfBands(outHDU,Exp2DData,nametuple[3], \
                           IntensConfidences=Limits,InExpHDUheader=InExpHDULst[0].header)

## Put in a piece to tranfer the WCS from exposure to rest of files ##

# End!!

    
