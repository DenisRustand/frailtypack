!!! Donnees pour Joint 

!AD:sortie fortran
    module sortie
    integer,save::cptaux,cptcens,nb0recu
    double precision::moyrecu
    end module sortie
!AD:

    module donnees

    implicit none
    double precision,dimension(6)::cof
    double precision::stp,half,one,fpf
    double precision,dimension(20),save::x,w   !The abscissas-weights : w = w(x)*exp(x)
    double precision,dimension(32),save::x1,w1 !The abscissas-weights : w1 = w(x1)*exp(x1)
    double precision,dimension(20),save::x2,w2 !The abscissas-weights : w2 = w(x2)*exp(x2*x2)
    double precision,dimension(32),save::x3,w3 !The abscissas-weights : w3 = w(x3)*exp(x3*x3)
         double precision,dimension(9),save::x9,w9 !The abscissas-weights : w9 = w(x9)*exp(x9*x9)
         double precision,dimension(7),save::x7,w7 !The abscissas-weights : w12 = w(x12)*exp(x12*x12)
                double precision,dimension(5),save::x5,w5
                        double precision,dimension(12),save::x12,w12
                double precision,dimension(15),save::x15,w15

    DATA w/0.181080062419,0.422556767879,0.666909546702,0.91535237279, &
    1.1695397071,1.43135498624,1.7029811359,1.98701589585, &
    2.28663576323,2.60583465152,2.94978381794,3.32539569477, &
    3.74225636246,4.21424053477,4.76252016007,5.42172779036, &
    6.25401146407,7.38731523837,9.15132879607,12.8933886244/

    DATA x/0.070539889692,0.372126818002,0.916582102483,1.70730653103, &
    2.74919925531,4.04892531384,5.61517497087,7.45901745389, &
    9.59439286749,12.0388025566,14.8142934155,17.9488955686, &
    21.4787881904,25.4517028094,29.9325546634,35.0134341868, &
    40.8330570974,47.6199940299,55.8107957541,66.5244165252/

    data cof,stp/76.18009173d0,-86.50532033d0,24.01409822d0, &
    -1.231739516d0,.120858003d-2,-.536382d-5,2.50662827465d0/
    data half,one,fpf/0.5d0,1.0d0,5.5d0/

    DATA w1/0.114187105768,0.266065216898,0.418793137325,0.572532846497, &
    0.727648788453,0.884536718946,1.04361887597,1.20534920595, &
    1.37022171969,1.53877595906,1.71164594592,1.8895649683, &
    2.07318851235,2.26590144444,2.46997418988,2.64296709494, &
    2.76464437462,3.22890542981,2.92019361963,4.3928479809, &
    4.27908673189,5.20480398519,5.11436212961,4.15561492173, &
    6.19851060567,5.34795780128,6.28339212457,6.89198340969, &
    7.92091094244,9.20440555803,11.1637432904,15.3902417688/

    DATA x1/0.0444893658333,0.23452610952,0.576884629302,1.07244875382, &
    1.72240877644,2.52833670643,3.49221327285,4.61645677223, &
    5.90395848335,7.3581268086,8.98294126732,10.783012089, &
    12.763745476,14.9309117981,17.2932661372,19.8536236493, &
    22.6357789624,25.6201482024,28.8739336869,32.3333294017, &
    36.1132042245,40.1337377056,44.5224085362,49.2086605665, &
    54.3501813324,59.8791192845,65.9833617041,72.6842683222, &
    80.1883747906,88.735192639,98.8295523184,111.751398227/

! gauss-hermite quadrature a 20 noeuds
    DATA w2/0.898591961453,0.704332961176,0.62227869619,0.575262442852, &
    0.544851742366,0.524080350949,0.509679027117,0.499920871336, &
    0.493843385272,0.490921500667,0.490921500667,0.493843385272, &
    0.499920871336,0.509679027117,0.524080350949,0.544851742366, &
    0.575262442852,0.62227869619,0.704332961176,0.898591961453/

    DATA x2/-5.38748089001,-4.60368244955,-3.94476404012,-3.34785456738, &
    -2.78880605843,-2.25497400209,-1.73853771212,-1.2340762154, &
    -0.737473728545,-0.245340708301,0.245340708301,0.737473728545, &
    1.2340762154,1.73853771212,2.25497400209,2.78880605843, &
    3.34785456738,3.94476404012,4.60368244955,5.38748089001/

! gauss-hermite quadrature a 32 noeuds
    DATA w3/0.824566523071,0.640950485906,0.561749015435,0.515037283347,0.48357144163, &
    0.460786455454,0.443553185862,0.430163710393,0.419597752949,0.411206128685, &
    0.404557061809,0.399354844618,0.395393939396,0.392531864366,0.390672744629, &
    0.389757342027,0.389757342027,0.390672744629,0.392531864366,0.395393939396, &
    0.399354844618,0.404557061809,0.411206128685,0.419597752949,0.430163710393, &
    0.443553185862,0.460786455454,0.48357144163,0.515037283347,0.561749015435, &
    0.640950485906,0.824566523071/

    DATA x3/-7.12581390983,-6.40949814928,-5.81222594946,-5.27555098664,-4.77716450334, &
    -4.30554795347,-3.85375548542,-3.41716749282,-2.99249082501,-2.57724953773, &
    -2.16949918361,-1.76765410946,-1.37037641095,-0.97650046359,-0.584978765436, &
    -0.194840741569,0.194840741569,0.584978765436,0.97650046359,1.37037641095, &
    1.76765410946,2.16949918361,2.57724953773,2.99249082501,3.41716749282, &
    3.85375548542,4.30554795347,4.77716450334,5.27555098664,5.81222594946, &
    6.40949814928,7.12581390983/


                ! gauss-hermite quadrature a 5 noeuds

        DATA w5/1.181488625535987604501,0.986580996751428170494,0.945308720482941881226,&
        0.986580996751428170494,1.181488625535987604501/

        DATA x5/-2.020182870456085632929,-0.9585724646138185071128,0,&
        0.9585724646138185071128,2.020182870456085632929/

                ! gauss-hermite quadrature a 7 noeuds

    DATA w7/1.10133072961032234908,0.89718460022518404681,0.82868730328363926234,&
        0.810264617556807326765,0.8286873032836392623397,0.89718460022518404681,&
        1.101330729610322349075/

        DATA x7/-2.651961356835233492447,-1.673551628767471445032,-0.816287882858964663039,&
        0,0.8162878828589646630387,1.673551628767471445032,2.651961356835233492447/


        ! gauss-hermite quadrature a 9 noeuds
   DATA w9/1.04700358097668224537,0.8417527014786699581343,0.7646081250945503029035,&
        0.7303024527450921536951,0.720235215606050957124,0.7303024527450921536951,&
        0.764608125094550302903,0.841752701478669958134,1.04700358097668224537/

        DATA x9/-3.19099320178152760723,-2.266580584531843111802,-1.468553289216667931667,&
        -0.723551018752837573323,0,0.7235510187528375733226,1.468553289216667931667,&
        2.266580584531843111802,3.19099320178152760723/


        ! gauss-hermite quadrature a 12 noeuds
        DATA w12/0.98969904709229809937,0.78664393946332246449,0.705220366112219755756,&
        0.662662773266871319239,0.6396212320202566006693,0.629307874369492821036,&
        0.6293078743694928210357,0.639621232020256600669,0.662662773266871319239,&
        0.70522036611221975576,0.786643939463322464492,0.98969904709229809937/

        DATA x12/-3.889724897869781919272,-3.020637025120889771711,-2.279507080501059900188,&
        -1.59768263515260479671,-0.947788391240163743705,-0.3142403762543591112766,&
        0.3142403762543591112766,0.947788391240163743705,1.59768263515260479671,&
        2.279507080501059900188,3.020637025120889771711,3.889724897869781919272/


        ! gauss-hermite quadrature a 15 noeuds

        DATA w15/0.9483689708276051861,0.74860736601690624983,0.6661660051090438365387,&
        0.620662603527037136634,0.593027449764209532813,0.5761933502834996497355,&
        0.567021153446603929198,0.564100308726417532853,0.567021153446603929198,&
        0.576193350283499649735,0.593027449764209532813,0.62066260352703713663,&
        0.66616600510904383654,0.748607366016906249827,0.9483689708276051861/

        DATA x15/-4.49999070730939155366,-3.669950373404452534729,-2.967166927905603248489,&
        -2.325732486173857745454,-1.719992575186488932416,-1.136115585210920666319,&
        -0.565069583255575748526,0,0.565069583255575748526,1.136115585210920666319,&
        1.719992575186488932416,2.325732486173857745454,2.967166927905603248489,&
        3.669950373404452534729,4.49999070730939155366/

    end module donnees
!=======================================================================================
!=======================================================================================
!                                FIN marq98 version optim
!=======================================================================================
!=======================================================================================

