%let pgm=utl-load-infile-with-a-string-and-parse-the-string-mutiple-arbitrary-length-delimeters;

%stop_submission;

Load infile with a string and parse the string mutiple arbitrary length delimeters

github
https://tinyurl.com/np5pau2f
https://github.com/rogerjdeangelis/utl-load-infile-with-a-string-and-parse-the-string-mutiple-arbitrary-length-delimeters


related to (but not a solution)
https://tinyurl.com/3nx4rbch
https://communities.sas.com/t5/SAS-Programming/String-Parsing-how-to-extract-words-between-comma-and-dot/m-p/956861#M373573

/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/


INPUT
=====


WORK.HAVE                                        STR

data/dataflow/BPS.STQR/EZR/1.0/RER_QWE_MED.D.AUD.MED, RER_QWA_MED.D.CAD.WOW.WOW.OF00,  QWZ_PLO_WOW.D

Data have ;
    input str $100. ;
cards4;
data/dataflow/BPS.STQR/EZR/1.0/RER_QWE_MED.D.AUD.MED, RER_QWA_MED.D.CAD.WOW.WOW.OF00,  QWZ_PLO_WOW.D.POP
;;;;
Run;quit;


PROCESS
=======

data want;
  set have end=dne;
  %loadinfile(str);
  informat s1-s3 $11.;
  input  @'0/' s1 @;
  input  @','  s2 @
  input  @','  s3;
  keep s1 s2 s3;
  output;
run;quit;


OUTPUT
======

    S1             S2             S3

RER_QWE_MED    QWZ_PLO_WOW    RER_QWA_MED

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
