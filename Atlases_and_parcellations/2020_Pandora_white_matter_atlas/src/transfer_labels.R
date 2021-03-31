library( ANTsR )
library( ANTsRNet )
if ( ! exists( "t1" ) ) {
  t1 = antsImageRead( "T1/t1.nii.gz" )
  t1 = t1 * brainExtraction( t1, 't1')
}
if ( ! exists( "tracts" ) )
  tractsList = antsImageRead( "Tracula/Tracula.nii.gz" ) %>% splitNDImageToList()
if ( ! exists( "tfn" ) )
  stop( "Please define template filename - tfn" )
template = antsImageRead( tfn )
reg = antsRegistration( template, t1, 'SyN' )
tractdescrip = read.csv("Tracula/Tracula_info.csv")
txtr = antsApplyTransforms( template, tractsList[[6]], reg$fwdtransforms )
