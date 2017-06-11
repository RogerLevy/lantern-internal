\ Object Table (Strategy) for Bubble
\ Adapted from Dark Blue / RetroForth
\ For 2D games.
\ This file should thought of as a starting point.  We extend it in various files.
\ When I have Workspaces to a certain level, editing source code in a visual way will take the place
\  of the traditional level editor.  As a very preliminary example,
\    Some object classes would NOT have an angle var.  Instead any rotation is hardcoded.
\      This will be edited interactively in Workspaces, merging coding and design.
\    But you still might want a class of objects that all have a different fixed angle.
\      In this case you'd add the var, and edit a level in a more traditional way.
\      But it's still better than an across-the-board variable because that complicates writing
\        rendering routines. You DON'T need this variable all the time.

bu: idiom obj:
    import mo/portion
    import mo/cellstack
    import mo/node
    import mo/pen
    import mo/porpoise

private:
    32 cellstack stack
    variable used  node sizeof @ used !  \ field counter
    : 2@  2v@ ;
    : 2!  2v! ;
    : 2+!  2v+! ;
    : ?call  ?dup -exit call ;
public:

0 value me
: me!  to me ;
: {    me stack push ;
: }    stack pop to me ;
: ofs  create ,  does> @ me + ;
: field  used @ ofs  used +! ;
: var   cell field ;
: 's    " me swap to me " evaluate  bl parse evaluate  " swap to me" evaluate ; immediate

var en var nam var x var y var vx var vy var hide var disp var beha
used @ value parms
container instance objects

: render  en @ hide @ 0 = and if  x 2@ at disp @ ?call  then ;
: step  beha @ ?call ;
: adv  en @ if  step  vx 2@ x 2+! then ;
: each>  ( container -- <code> )  r> swap first @ begin  dup while  dup next @ >r  me!  dup >r  call  r>  r> repeat  2drop ;
: /obj  heap dims drop ;
: enable  me /obj erase  en on  hide on ;
: init   me objects pushnode  enable  at@ x 2! ;
: single  ( -- <name> )  create here me!  /obj allot  init  nam on ;
: one    heap portion me!  init ;
: draw>  r> disp !  hide off  ;
: act>   r> beha ! ;
: from   ( x y -- x y )  x 2@ 2+ ;
: flash  #frames 2 and hide ! ;


\ "external" words
: place   ( x y obj -- )  { me!  x 2! } ;
: delete  ( obj -- )  {  me remove  nam @ not if  me heap recycle  then  } ;
\ -----

: end  me delete ;
: scene  objects each> delete ;  \ this word is kind of meant to be redefined

\ Private idioms for game objects
: role  parms used !  obj: idiom ;



\ Test
[defined] dev [if]
    import mo/draw
    : *thingy  one draw> 50 50 red rectf ;
    : world  dblue backdrop objects each> render ;
    : physics  objects each> adv ;
    : test  go> render> world step> physics ;
    scene  100 100 at  *thingy  me value thingy
    test
[then]


