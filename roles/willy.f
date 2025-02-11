depend prg/gamester/shared.f
depend ramen/lib/std/kb.f

define-role willy willying

: loc  16 16 2/ 2pfloor 0 0 2max 511 511 2min 512 * + cells + ;

: plot  1p stage layer1 >tilemap @> x 2@ 8 8 2+ loc ! ;

: paint
    <1> kstate if  $02 plot  then
    <2> kstate if  $31 plot  then
;
state: state1 willy
    paint
    0 rate !
    <left> kstate if  -2 x +!  0.25 rate !  then
    <right> kstate if  2 x +!  0.25 rate !  then
    <up> kstate if    -2 y +!  0.25 rate !  then
    <down> kstate if   2 y +!  0.25 rate !  then
    x 2@ viewwh 2 2 2/ 2- camera @> { x 2! }
;
action: start willy  1 0 animate state1 ;
