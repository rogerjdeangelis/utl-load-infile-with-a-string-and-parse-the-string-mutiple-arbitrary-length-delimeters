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


















  input x1 $60. ;
cards ;
RER_QWE_MED , RER_QWA_MED , QWZ_PLO_WOW
;
Run ;

We would like to extract X1 from the data according to the following rules for Type A and




Data have ;
input str $100. ;
cards4;
data/dataflow/BPS.STQR/EZR/1.0/RER_QWE_MED.D.AUD.MED, RER_QWA_MED.D.CAD.WOW.WOW.OF00,  QWZ_PLO_WOW.D.POP
;;;;
Run;quit;

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










 RER_QWE_MED , RER_QWA_MED , QWZ_PLO_WOW

































%let pgm=utl-find-the-last-non-missing-value-in-columns-col1-to-col9-reverse-coalesce-col9-to-col1;

%stop_submission;

I did not know that.
A querstion is worth a thousand answers.
Park this in the back of your brain.

Find the last non missing value in columns col1 to col9 reverse coalesce col9 to col1

  TWO SOLUTIONS

        1 coalesce(of c9-c1)
          Tom
          https://communities.sas.com/t5/user/viewprofilepage/user-id/159

        2 coalesce(of c9-c5,of c3-c1)  c4 is missing


github
https://tinyurl.com/mr387wan
https://github.com/rogerjdeangelis/utl-find-the-last-non-missing-value-in-columns-col1-to-col9-reverse-coalesce-col9-to-col1

sas communities
https://tinyurl.com/mun8rcxb
https://communities.sas.com/t5/SAS-Programming/How-do-I-select-the-last-valid-column-from-a-data-set/m-p/956997#M373615



/**************************************************************************************************************************/
/*                                  |                                                   |                                 */
/*         INPUT                    | PROCESS                                           |   OUTPUT                        */
/*         =====                    | =======                                           |   ======                        */
/*                                  |                                                   |                                 */
/* 1 SAS COLALESCE(OF C9-C1)        |                                                   |                                 */
/* =========================        |                                                   |                                 */
/*                                  |                                                   |                                 */
/* WORK.HAVE                        | data want;                                        |  LAST_NON_                      */
/*                                  |                                                   |   MISSING                       */
/* C1 C2 C3 C4 C5 C6 C7 C8 C9       |  set have;                                        |                                 */
/*                                  |  last_non_missing=coalesce(of c9-c1);             |      60                         */
/* 10 20 30 40 50 60  .  .  .       |  keep last_non_missing;                           |                                 */
/*                                  |                                                   |                                 */
/* data have;                       |  run;quit;                                        |                                 */
/*   array cols[89] c1-c9           |                                                   |                                 */
/*    (10 20 30 40 50 60 . . .);    |                                                   |                                 */
/* run;quit;                        |                                                   |                                 */
/*                                  |                                                   |                                 */
/*------------------------------------------------------------------------------------------------------------------------*/
/*                                  |                                                   |                                 */
/* 2 COALESCE(OF C9-C5,OF C3-C1)    |                                                   |  LAST_NON_                      */
/* =============================    |                                                   |   MISSING                       */
/*                                  |                                                   |                                 */
/* data have;                       | data want;                                        |      60                         */
/*   array cols[8] c1-c3 c5-c9      |                                                   |                                 */
/*    (10 20 30 50 60 . . .);       |  set have;                                        |                                 */
/* run;quit;                        |  last_non_missing=coalesce(of c9-c5, of c3-c1);   |                                 */
/*                                  |  keep last_non_missing;                           |                                 */
/*                                  |                                                   |                                 */
/*                                  | run;quit;                                         |                                 */
/*                                  |                                                   |                                 */
/**************************************************************************************************************************/

/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
