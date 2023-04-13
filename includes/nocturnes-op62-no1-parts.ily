%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....
\version "2.24.1"

\include "global-variables.ily"

%%% Positions and shapes %%%

slurShapeA = \shape #'((-16.75 . -8) (-13 . -3) (-2 . 1) (0 . 0)) \etc
slurShapeB = \shape #'((0 . 0) (0 . 0) (0 . 0) (0 . 1.25)) \etc
slurShapeC = \shape #'((0 . 0) (0 . 3) (0 . 3.25) (0 . 0)) \etc
slurShapeD = \shape #'((0 . 0) (0 . 0.5) (0 . 1.5) (0 . 0)) \etc
slurShapeE = \shape #'((0 . 0) (0 . 0.5) (0 . 2) (0 . 0)) \etc
slurShapeF = \shape #'((0 . 0) (0 . 1) (0 . 3) (0 . 0)) \etc
slurShapeG = \shape #'((0 . 0) (0 . 0) (0 . 2) (0 . 0)) \etc
slurShapeH = \shape #'((0 . 0) (0 . 4) (0 . 1) (0 . 0)) \etc

tieShapeA = \shape #'((0 . 0) (0 . 0) (-1 . 0) (-1 . 0.5)) \etc

slurPositionsA = \tweak Slur.positions #'(1 . 0) \etc
slurPositionsB = \tweak Slur.positions #'(1 . 0) \etc
slurPositionsC = \tweak Slur.positions #'(1 . 3) \etc
slurPositionsD = \tweak Slur.positions #'(1 . 5) \etc
slurPositionsE = \tweak Slur.positions #'(0 . 4) \etc

beamPositionsA = \tweak Beam.positions #'(-2.25 . -3.75) \etc

moveTextA = \tweak X-offset -4 \etc

moveNoteA = \once \override NoteColumn.force-hshift = -1
moveNoteB = {
  \once \override NoteColumn.force-hshift = 0
  \once \override Stem.length = 4
}

moveRestA = \once \override Rest.X-offset = 1.75

moveAccidentalA = \once \override TextScript.Y-offset = 6.5
moveAccidentalB = \once \override TextScript.Y-offset = 5.5
moveAccidentalC = \once \override TextScript.Y-offset = 8
moveAccidentalD = \offset Y-offset 3 \etc

moveFermataA = \once \override Script.Y-offset = 10

moveTrillSpanA = \tweak Y-offset 5 \etc

movePedalA = \override SustainPedal.Y-offset = -2
movePedalB = \once \override SustainPedal.X-offset = 0
movePedalOff = \revert SustainPedal.Y-offset

moveStaffArpeggioA = \once \override Staff.Arpeggio.X-extent = #'(-0.5 . 0.5)
moveStaffArpeggioB = \once \override Staff.Arpeggio.X-extent = #'(-0.75 . 0.75)
moveStaffArpeggioOn = \override Staff.Arpeggio.X-extent = #'(-0.5 . 0.5) 

%%% Music %%%

global = {
  \time 4/4
  \key b \major
  \accidentalStyle piano
}

rightHandUpper = \relative {
  \stemUp
  \cadenzaOn
    \magnifyMusic 0.63 { s4 s s s s e'~\slurShapeA ^( gs_~ e' }
    <e, gs e'>1
  \cadenzaOff
  \bar "|"
  <e fs cs'>1) |
  r2 \voiceOne b'8( as gs fs |
  ds'4\arpeggio cs8 b) b( as \grace { \moveStaffArpeggioA as\arpeggio } gs fs |
  fs'4\arpeggio fs \oneVoice <a, fs'> <e gs e'>8 <fs ds'> |
  \voiceOne ds'8 cs e8. ds16  ds4\arpeggio cs8. b16 |
  b8 as gs fs) <fs ds'>4(\arpeggio cs'8 b |
  b8 as \tuplet 3/2 { as8 gs fs) } \grace { \once \hideNotes fs'4\arpeggio } 
    fs( fs |
  <ds, a' fs'>4 <gs e'>8 <b ds>  ds cs <fs, ds'> <e b'> |
  
  \barNumberCheck 9
  ds8) gs4( as b) s8 |
  e4\rest r8 ds( ds4 e) |
  \omit TupletNumber
  \tuplet 3/2 4 { s4 s16 ds( ds8.*5/3 ds16 } ds4 \grace { e8[ ds css ds] }
    fs8. e16 |
  ds4 ds8. es16 es8 fs4*1/2) fss,16( gs cs b |
  <b, ds fs as>8\arpeggio ds'16 cs  <\parenthesize b, es as> cs' <b, ds gs> cs'
    fs,4) <cs fs as>8( <ds fs bs> |
  <e cs'>8 gs \slashedGrace { gs } gs'4~ gs8 ds e fs |
  e4 ds8 e cs4 e) |
  ds4.( cs8  b as gs b |
  
  \barNumberCheck 17
  as8 cs as b  gs4 b~ |
  b8 as ds cs  b as gs b |
  as8 gs as b  gs4 b |
  <as, fs' as>8) \oneVoice r as''4~( as gs16 fs es gs |
  fs es ds fs  es ds cs es  ds cs b as  b cs ds gs, |
  \undo \omit TupletNumber
  as8) r as'4(~ as16 b8 as16 \tuplet 5/4 { gs16 fs gs as es } |
  gs16 fs gs ds  fs es fs cs  es ds es b  ds as ds gs, |
  as4) r r8 fs'16( es  ds as ds gs, |
  
  \barNumberCheck 25
  \tempo 4 = 68
  as4) r \magnifyMusic 0.63 \scaleDurations 4/41 {
    \stemUp
    b8( cs ds es fs  gs \ottava 1 as b cs ds  es fs gs as b  cs es ds cs b
    as gs fs es ds  cs b as gs \ottava 0 fs  es ds cs b as  gs fs es ds cs  b
  } |
  \tempo 4 = 74
  \stemNeutral
  as2.->) \tuplet 3/2 { ds8( fs8. ds'16 } |
  ds2~ ds4 cs8 b~ |
  \voiceOne b8 as gs fs)  ds'4(\arpeggio cs8 b |
  b8 as \grace{ as\arpeggio } gs fs)  fs'4(\arpeggio fs |
  \oneVoice <a, fs'>4 <e gs e'>8 <fs ds'> \voiceOne ds' cs e8. ds16 |
  ds4\arpeggio cs8. b16 b8 as \tuplet 3/2 { gs8 as fs) } |
  ds'4( cs8 b b16 as ds cs  gs as gs fs |
  
  \barNumberCheck 33
  \slashedGrace { ds8*1/4 } \oneVoice fs'4 fs) 
    \tempo 4 = 60
    <ds, a' fs'>2\fermata |
    \tempo 4 = 74
  <ds a' fs'>4^( <e gs e'>8 <gs ds'> \voiceOne ds' cs ds8. b16 |
  b8 as b gs \oneVoice <bs, ds>4 <as fss' cs'>4) |
  \key af \major
  c'2( bf4.. c16 |
  af2) af4..( g16 |
  g2 f8.) a16( bf8 c |
  df2 f |
  ef,2) df'8( c bf c |
  
  \barNumberCheck 41
  af2 f |
  ef2) af8( bf g' f~ |
  f8 g, f'2 ef8 df |
  c2~ c8 df f, df' |
  e,8 df' c4) ef,8( a c ef |
  d2~ d8 ef g, ef'|
  fs,8 ef' d4) f,8( b d f |
  e2~ e8 f c d |
  
  \barNumberCheck 49
  \accidentalsOverTrills
  \accidentalsTrillsUnderSlurs
  e4 b \moveAccidentalA \afterGrace 15/16 cs2\startTrillSpan^\smallNatural
    { bs16[\stopTrillSpan cs] } |
  d8 ef g f  d ef bf c |
  d4 a b\trill^\smallSharp \moveAccidentalB \afterGrace 15/16
    cf\trill^\smallFlat { bf16[ cf] } |
  c2) bf4..( c16 |
  bf8 a af2 g8 gf |
  e4) f(~ f8 a bf8. c16 |
  df2 f |
  ef,2 df'8 c bf c |
  
  \barNumberCheck 57
  af2 f |
  ef2 df'8 c bf c |
  af2 d |
  d2~ d8 ef4) ef8( |
  \voiceOne f2 bf4. bf8 |
  \oneVoice c8 bf g ef df4.) df8( |
  df4 c4 af'4. af8 |
  af4 cf,2) cf4( |
  
  \barNumberCheck 65
  cf2 bf4. f8) |
  \voiceOne r4 r8 ef' \grace { ef } \accidentalUnderFematas \moveFermataA 
    \moveAccidentalC ef2^\smallFlat\fermata\startTrillSpan |
  \key b \major
  ds2. \grace { cs8 } cs \grace { b } b |
  \tempo "Poco più lento" 4 = 68
  \oneVoice
  b8 \grace { as } as \grace { gs } gs \grace { fs } fs <>\stopTrillSpan
    \appoggiatura { ds8*1/4[ ds'] } ds4\startTrillSpan \grace { cs8 } cs
    \grace { b } b |
  b8 \grace { as } as \grace { gs } gs \grace { fs } fs <>\stopTrillSpan
    \appoggiatura { ds8*1/4[ a' fs'] } fs4\moveTrillSpanA\startTrillSpan fs |
  fs4 <>\stopTrillSpan \grace { << { gs,8*1/2[( e']) } \\ { gs,4*1/2 } >> } 
    e'8\startTrillSpan \grace { ds } ds \tempo 4 = 62
    \magnifyMusic 0.63 \scaleDurations 4/30 { 
      \stemUp
      ds8[^(\stopTrillSpan fss, gs as gs fss gs as b cs ds e fs gs \ottava 1
      as b cs ds e fs gs as b gs e cs \ottava 0 b gs e ds])
    } | 
  \tempo "A tempo" 4 = 68
  \stemNeutral cs4.\startTrillSpan \grace { b8 } b b \grace { as } as 
    \grace { gs } gs \grace { fs } fs <>\stopTrillSpan |
  \grace { ds8*1/4[( ds']) ds } ds4*1/2\startTrillSpan 
    \magnifyMusic 0.63 \scaleDurations 4/3 { 
      \stemUp css8*1/8[\stopTrillSpan ds e ds gs fs] \stemNeutral
    }
    \scaleDurations 2/3 { bs,32[ cs ds cs gs' fs]  as,[ b cs b gs' fs] }
    \grace { b,8*1/8 } b8\startTrillSpan \grace { as } as \grace { gs } gs
    \grace { fs } fs <>\stopTrillSpan |
  
  \barNumberCheck 73
  \appoggiatura { ds8*1/4[\( a'] } fs'16[ gs32 fs] \tuplet 6/4 { 
    gs fs gs fs gs fs\) } fs4\startTrillSpan fs2 |
  fs4\moveAccidentalD^\smallNatural \tempo 4 = 62 fs <>\stopTrillSpan
    \grace { es8*1/4[ fs g fs a g fs] } fs4 \tempo 4 = 40 r\fermata |
  \tempo "Tempo primo" 4 = 74
  \voiceOne fs8( g e f  c <f, d'> <fs ds'> <e b'> |
  ds) gs4( as b8 ds cs |
  as8 b4 cs ds8 fs e |
  <as, cs>8 ds4 e8 \tempo 4 = 70 <as, ds>\mark \ritenuto <fss cs' fss> 
    \grace { \once \hideNotes as'\arpeggio } <b, as'> <css gs'> |
  \tempo 4 = 66 <as cs>8 <a ds> e' as,~ \tempo 4 = 62 <fss as> <fs bs> <es ds'>
    <e cs'> |
  \tempo "A tempo" 4 = 74
  \oneVoice <ds b'>8) r b''8.( as16  a gs fs a  gs fs e gs |
  
  \barNumberCheck 81
  fs16 e ds fs  e ds cs e  ds cs b a  b cs ds a |
  gs16 a b cs  ds e fs fss  gs cs b ds  e fs gs as |
  \ottava 1 b16 ds cs b  \ottava 0 gs e cs b  gs e cs b  gs e cs gs) |
  fs16(-1 ds' fs-1 ds')  b'8.( as16  a g fs a  g fs e g |
  fs16 e ds g  fs e ds e  ds c b a  b c fs, b |
  g16 as b cs  ds e fs g  as c b ds  e fs g as |
  \ottava 1 bs ds cs b  \ottava 0 gs e cs b  gs e cs b gs e cs) fs,(
  ds''2~ ds16 e ds cs  ds e fs) fs,( | 
  
  \barNumberCheck 89
  ds'2~ ds16 e ds cs ds e fs b, |
  <ds b'>4) r <fs,, b ds>^( ds'16 fs e16. ds32 |
  <fs, b ds>2) q4^( ds'16 fs e16. ds32 |
  <fs, b ds>4 ds'16 b' fs16. ds32 <fs, b ds>4 <fs as cs> |
  <fs b ds>4) r r2 |
  \bar "|."
}

rightHandLower = \relative {
  \cadenzaOn s4 s s s s s s s s1 \cadenzaOff
  s1 * 2 |
  \voiceTwo
  ds'4\arpeggio ds e \grace { \once \hideNotes e8\arpeggio } e4 |
  <ds a'>2\arpeggio s |
  gs4. gs8 
    << 
      { 
        \moveStaffArpeggioA e2~\arpeggio |
        \once \omit Stem \moveNoteA e4 
      } 
      \new Voice { 
        \voiceThree gs8 fs4.\tieShapeA _~ |
        \voiceTwo fs4 
      } 
    >>
  e4 \moveStaffArpeggioB ds\arpeggio ds |
  e4 e \grace { \voiceOne \moveStaffArpeggioA ds4\arpeggio } \voiceTwo 
    <ds a'>2 |
  s4 e gs s |
  
  \barNumberCheck 9
  ds8 bs e cs  fs ds4 <cs as'>8( |
  << 
    { \beamPositionsA as'8 gs fss fs e) } 
    \new Voice { \voiceTwo b4 s4 s8 } 
  >> gs'4 as8( |
  \tuplet 3/2 4 { cs8[ b r16 as]) as8[( gs r16 fs]) }  e8 gs gs as |
  cs8 b as gs  cs fs,4 ds8 |
  s2 <b ds>8 <as cs> s4 |
  s8 gs'4 gs8  fs gs bs gs |
  cs8 gs fs gs  e gs cs gs |
  cs,8 ds fss ds  gs ds b ds |
  
  \barNumberCheck 17
  fss8 ds cs ds  gs e b e |
  fss8 ds cs ds  gs ds b ds |
  fs8 ds as ds  es ds b ds |
  s1 * 5 |
  
  \barNumberCheck 25
  s1 * 3 |
  e2 \moveStaffArpeggioOn ds4\arpeggio ds |
  e4 \grace { \once \hideNotes e8\arpeggio } e4 <ds a'>2\arpeggio |
  s2 e4 gs |
  << { e2\arpeggio } \new Voice { \voiceThree gs8 fs4. } >> <e fs>4 e |
  ds4 s e e |
  
  \barNumberCheck 33
  s1 |
  s2 gs4 fs |
  e2 s |
  s1 * 5 |
  
  \barNumberCheck 41
  s1 * 8 |
  
  \barNumberCheck 49
  s1 * 8 |
  
  \barNumberCheck 57
  s1 * 4 |
  ef'4 df2 s4 |
  s1 * 3 |
  
  \barNumberCheck 65
  s1 |
  \set PianoStaff.connectArpeggios = ##t
  g,1\arpeggio |
  \key b \major 
  fs1 |
  s1 * 5 |
  
  \barNumberCheck 73
  s1 * 2 |
  a8 g4 f s4. |
  ds8 bs e cs  fs ds << { e~ gs } \new Voice { \voiceOne \moveNoteB e4 } >> |
  <e fs>8 ds gs e  as fs gs~ b |
  gs8 fs b e, s4 \slashedGrace { gs8\arpeggio } gs4 |
  fs8 s gs4 s2 |
  s1 |
  
  \barNumberCheck 81
  s1 * 8 |
  
  \barNumberCheck 89
  s1 |
  s2. <fs, as>4->
  s2. <gs b>4-> |
}

rightHand = <<
  \global
  \tempo "Andante" 4 = 74
  \set Score.tempoHideNote = ##t
  \new Voice \rightHandUpper
  \new Voice \rightHandLower
>>

leftHandUpper = \relative {
  \stemUp
  \cadenzaOn
    \magnifyMusic 0.63 { cs,4~ gs'~ cs~ gs'~ b~ s s s }
    <cs,, gs' cs gs' b>1
  \cadenzaOff
  <fs as'>1 |
  R1 |
  \stemNeutral \voiceThree s4 b'4*1/2 fs cs' fs,4. |
  s1 |
  e4*1/2 b'4*3/2 b4 as8( ds |
  cs4*1/2 fs,4.) s8 fs4*1/2 b4 |
  cs4*1/2 fs,4. s2 |
  s2 b4. b8 |
  
  \barNumberCheck 9
  s1 * 8 |
  
  \barNumberCheck 17
  s1 * 3 |
  s2 \voiceFour <ds, es css'> |
  <ds fs ds'>2 <ds gs ds'> |
  <ds fs ds'>2 <ds es css'> |
  <ds fs ds'>2 <ds gs ds'> |
  <ds fs ds'>2 <ds gs ds'> |
  
  \barNumberCheck 25
  <ds fs ds'>2 \voiceThree ds'8( es fs b,) |
  s1 * 2 |
  s8 fs4. s2 |
  s8 fs4. s2 |
  s4. b4*1/2 gs( b4. |
  b4 as8) ds( cs4*1/2 fs,4.*2/3 \once \hideNotes as8) |
  s2 cs4 s |
  
  \barNumberCheck 33
  s1 |
  s2 b4. gs8 |
  s1 |
  % key change to af
  s1 * 5 |
  
  \barNumberCheck 41
  s1 |
  s2 <bf d> |
  <bf ef>2 s2 |
  s1 * 5 |
  
  \barNumberCheck 49
  s1 * 3 |
  s2 df4 s |
  s2 bf4 s |
  s1 * 3 |
  
  \barNumberCheck 57
  s1 * 2 |
  <af c>2 <af cf> |
  s1 * 5 |
  
  \barNumberCheck 65
  s1 * 2 |
  \key b \major
  s1 |
  s8 fs4.*1/3 e'4 s2 |
  s8 fs,4.*1/3 e'4  s8 b4. |
  s2 s8 cs( e gs,) |
  s8 fs2*1/4 e'4 e2*1/4 fs,4 s8 |
  s8 fs'8[( e ds]) e2*1/4 fs,4 s8 |
  
  \barNumberCheck 73
  s4. b2 s8 |
  s1 |
  d4( c4. b4 b8 |
  \oneVoice fs8) s8 s4 s2 |
  s1 * 2 |
  \voiceThree s8 b4 cs8 ds gs,4 s8 |
  s1 | 
  
  \barNumberCheck 81
  s1 * 2 |
  s4. fs4 s4. |
  s1 * 5 |
  
  \barNumberCheck 89
  s2 fs'8 gs4-> fs8 |
}

leftHandLower = \relative {
  \cadenzaOn s4 s s s s s s s s1 \cadenzaOff 
  s1 * 2 |
  \voiceFour \slurUp b,,8\slurPositionsA ( fs'' b fs  cs' fs, b as ) |
  b,8( fs' b bs  ds) bs,\slurShapeB ( cs <ds b'> |
  e8 b' e, es  fs2)~ |
  fs8 fs b as  b,,\slurPositionsB ( fs'' b fs |
  cs'8 fs, b as) \oneVoice b,,( b' fs' b) |
  \voiceFour \slurUp e,,8\slurPositionsC ( bs'' cs gs  e es fs gs |
    
  \barNumberCheck 9
  fs8) \oneVoice r fs,4 
    \override Staff.Arpeggio.X-extent = #'(-0.5 . 0.5)
    <b, fs' fs'>\arpeggio ds8( fss') |
  \voiceFour \slurUp gs,( ds' as' <gs bs>) cs,( gs' cs gs) |
  gs,8(  ds' b' gs,)  cs\slurPositionsD ( gs' e' cs,) |
  gs8( ds' cs b')  as,( cs' b, fs') |
  cs,8( cs' b' cs,)  fs,( fs' ds gs) |
  cs,,8( gs'' e' gs,)  gs,( gs' <ds' fs> gs,) |
  cs,8( gs' <gs, bs'>\arpeggio gs')  <cs, cs'>( gs' as, cs') |
  ds,,8( ds' as' ds,)  gs,( ds' gs ds) |
  
  \barNumberCheck 17
  ds,8( ds' fss ds)  ds,( css' gs' css,) |
  ds,8( ds' fss ds)  gs,( ds' gs es) |
  ds,8( ds' fs ds)  ds,( ds' gs ds) |
  \oneVoice ds,8 as''4-> as8 \moveRestA as\rest as4 as8 |
  \moveRestA as\rest as4 as8 \moveRestA as\rest b4 b8 |
  \moveRestA as\rest as4-> as8 \moveRestA as\rest as4 as8 |
  \moveRestA as\rest as4 as8 \moveRestA as\rest b4 b8 |
  \moveRestA as\rest as4 as8 \moveRestA as\rest b4 b8 |
    
  \barNumberCheck 25
  \moveRestA as\rest as4-> as8 \voiceFour <b, gs'>2 |
  <ds, as' fs'>2\arpeggio \oneVoice r |
  R1 |
  \voiceFour \slurUp
  fs8( fs' b as)  b,(fs' b fs) |
  cs'8( fs, b as)  b,,( fs'' b bs) |
  ds8( bs, cs <ds b'>)  gs b e, es |
  fs2~ fs8 fs b as |
  b,,8( fs'' b fs  cs' fs, b as) |
  
  \barNumberCheck 33
  \oneVoice b,,8( b' fs' b) s2 |
  r8 bs,( <cs cs'> <ds b'> \voiceFour e4 ds |
  \oneVoice <cs gs'>4. <css b'>8) ds4 ds,( |
  \key af \major
  ef8) <g' df'>4( q) ef-> ef,8( |
  af,8) <ef'' af c>4( q <e af c>) af,8( |
  af,8) <f'' bf df>4( q8) r af,4->( df,8 |
  af8) <f'' bf df>4( q8) r af,4->( df,8 |
  g,8) <ef'' bf' df>4( q) ef->( ef8 |
  
  \barNumberCheck 41
  af,8)  <f' af c>4( <ef af c> <d af' c> <ef af c>8~ |
  q8) ef,4( <ef' c'>8 \voiceFour ef ef4-> ef8 |
  ef8 ef4-> ef8 \oneVoice <ef g df'> ef) r ef,( |
  e8) <c' g' bf>4 q8 <c f bf>8 q4 f,8( |
  g8) <c g' bf>4 q8 <c g'a>8 q4 g8( |
  fs8) <d' a' c>4( q8 <d g c>8 q4) g,8( |
  a8) <d a' c>4( q8 <d a' b> q4) a8( |
  gs8) <e' d'>4 q8 a, <e' c'>4 q8 |
  
  \barNumberCheck 49
  gs,8 <e' b' e>4 q8 g, <e' bf' e>4 q8 |
  f,8 <f' bf f'>4( q8 <f a ef'>8 q4 q8) |
  f,8 <f' a d>4( q8 <f af d>8 q4 <ff af d>8) |
  ef,8 <ef' af ef'>4\slurShapeD ( <ef af d>8 <ef af> <ef g>) r e,( |
  f8) <c' f c'>4\slurShapeE ( <c f b>8 <c f> <c e>) r c,( |
  df8) <f' af>4( <f a ef'>8 <f bf df>) df,4->( c8 |
  bf8) f''4( <df f c'>8 <df f bf>8) bf,4->( af8 |
  g8) <ef'' bf' df>4( q ef->) ef8 |
  
  
  \barNumberCheck 57
  af,8( <ef' af c>4 q8) r c,4( df8 |
  ef8) <ef' af c>4\slurPositionsE ( <f af c>8 <ef g df'>8 ef4->) ef8\slurShapeC ( |
  ef8 ef4-> f8 ef ef4-> ef8) |
  ef,8(\< bf' g' cf bf g ef'4)\! |
  ef,,8(\< af f' bf af f <df' af'>4)\! |
  ef,,8(\< bf' ef f g ef <bf' g'>4)\! |
  ef,,8(\< af ef' af gf ef <gf c gf'>4)\! |
  ef,8(\< af ef' f gf ef <gf cf gf'>4)\! |
  
  \barNumberCheck 65
  r8 ef,8(\< ef' af gf ef <f bf d>)\! r |
  \moveStaffArpeggioOn <ef bf'>2\arpeggio r |
  \key b \major
  \parenthesize fs'2. e8 ds |
  fs,,,8\slurShapeF ( fs'' b as) b,,( <fs'' fs'> <as e'> <b ds>) |
  <cs e>8\slurShapeG ( fs, b as) b,,( b'' <ds a'> b) |
  <bs ds a'>8 bs, <cs gs' e'>\arpeggio <ds gs bs fs'>\arpeggio e, \voiceFour
    <e' gs>4. |
  fs,8\slurShapeH ^( fs' as b cs fs, b as) |
  \oneVoice b,,8\noBeam \voiceFour fs''2*3/4 cs'8( fs, b as) |
  
  \barNumberCheck 73
  b,,8 b'' <ds a'> b <ds a'>4. \oneVoice r8 |
  <c d a'>4 q q r\fermata |
  \voiceFour c8 b bf a  af g fs gs |
  \oneVoice s8 r r4 r2 |
  R1 |
  r4 gs8( <cs, cs'> fss <ds ds'> <e css'> <es b'>) |
  \voiceFour fs4 e ds cs8 <fs, as'>\arpeggio |
  \oneVoice <b fs' b>8 fs'4-> fs8( <b ds fs> fs4 fs8) |
  
  \barNumberCheck 81
  b,,8 fs''4->( fs8 <b ds fs> fs4 fs8) |
  b,8 gs'4-> gs8( <b e gs> gs4 gs8) |
  b,,8 \voiceFour fs''4^( fs8 e' fs,) \oneVoice r4 |
  b,,8 fs''4-> fs8( < b ds fs> fs4 fs8) |
  b,8 fs'4->( fs8 <b ds fs> fs4 fs8) |
  b,,8 g''4->( g8 <b e g> g4 g8) |
  b,8 fs'4->( fs8 e' fs,4 fs8) |
  b,,8 fs''4->( fs8 <b ds fs> fs4 fs8) |
  
  \barNumberCheck 89
  b,8 fs'4-> fs8 <b ds>2 |
  <fs b ds>4 r b, fs |
  b2 b4 e, |
  b'4 r fs fs, |
  b r r2 |
}

leftHand = <<
  \clef bass
  \global
  \mergeDifferentlyDottedOn
  \mergeDifferentlyHeadedOn
  \override Staff.Beam.auto-knee-gap = 4
  \new Voice \leftHandUpper
  \new Voice \leftHandLower
>>

dynamics = {
  \override TextScript.Y-offset = -0.5
  \cadenzaOn
  s4\tweak X-offset -2.5 \f s s s s\> s s s s1
  \cadenzaOff
  s2 s\! |
  s2 s\moveTextA^\dolceLegato |
  s1 * 4 |
  s4 s2\< s8 s\! |
  s2..\> s8\! |
  
  \barNumberCheck 9
  s2\< s\! |
  s1 * 3 |
  s4..\> s16\! s2 | 
  s1 * 3 |
  
  \barNumberCheck 17
  s1 * 3 |
  s4 s2\> s8. s16\! |
  s1 |
  s4 s2.\> |
  s2... s16\! |
  s2 s8 s4\pp\> s16 s\! |
  
  \barNumberCheck 25
  s2 s\f |
  s2.\fp s4\< |
  s4 s\! s\> s8 s\! |
  s1 |
  s2..\< s8\! |
  s1 * 3 |
  
  \barNumberCheck 33
  \grace { s8*1/4\< } s2. s4\! |
  s1 |
  s2 s4\< s\!
  % key change to af
  s1^\sostenuto |
  s1 |
  s2 s\< |
  s4 s\! s2 |
  s1 |
  
  \barNumberCheck 41
  s1 |
  s2..\< s8\! |
  s2 s4..\> s16\! |
  s8 s2..\cresc |
  s1 * 2 |
  s2.. s8\! |
  s8 s4.\> s4. s8\! |
  
  \barNumberCheck 49
  s8 s4.\< s4. s8\! |
  s1^\dolciss |
  s8 s4.\< s4.. s16\! |
  s1\f |
  s1 |
  s2 s8 s4.\< |
  s2 s\! |
  s2\> s8 s4.\dim |
  
  \barNumberCheck 57
  s1 * 3 |
  s2.. s8\pp |
  s1 |
  \tag layout { s2..\> s8\! | }
  \tag midi   { s1 } % righthand part gets too soft
  s1 * 2 |
  
  \barNumberCheck 65
  s1 |
  s4. s8\< s4. s8\! |
  % key change to b
  s2..\> s8\! |
  s1^\dolce |
  s2 \grace { s8*1/4\< s s } s4. s8\! |
  s4 s4\> s8^\pocoRall s\! s4 |
  s1 * 2 |
  
  \barNumberCheck 73
  \grace { s8*1/4\< s } s4. s8\! s4..\> s16\! |
  s4\pp s2\tweak Y-offset 1.5 ^\dimRall s4\! |
  s1 |
  s2 s\cresc |
  s1 * 2 |
  s2.\dim s4\> <>\! |
  s1\p |
  
  \barNumberCheck 81
  s1 * 7 |
  s1^\calando
  
  \barNumberCheck 89
  s1 * 3 |
  s4 s2\> s4\! |
}

pedal = {
  \cadenzaOn
  s4\sd s s s s s s s s2 s\su
  \cadenzaOff
  s2.\sd s4\su |
  s1 |
  s4.\sd s8\su s2 |
  s4.\sd s8\su s4\sd s\su |
  s1 | 
  s2 s4.\sd s8\su |
  s2 s4.\sd s8\su |
  s4\sd s\su s2 |
  
  \barNumberCheck 9
  s2 s4\sd s8.\su\sd s16\su |
  s1 |
  s4.\sd s8\su s4.\sd s8\su |
  s1 |
  s4.\sd s8\su s2 |
  s4.\sd s8\su s4.\sd s8\su |
  s8\sd s\su s\sd s\su  s\sd s\su s\sd s\su |
  s4.\sd s8\su s2 |
  
  \barNumberCheck 17
  s2\sd s4.\su\sd s8\su |
  s4.\sd s8\su s2 |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s1 |
  s4.\sd s8\su s2 |
  s1 |
  s4.\sd s8\su s2 |
  
  \barNumberCheck 25
  s1 |
  s1\sd |
  s2.. s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s2 s4.\sd s8\su |
  s4\sd s2.\su |
  s1 |
  s4.\sd s8\su s2 |
  
  \barNumberCheck 33
  s2...\sd s16\su |
  s1 * 2 |
  % key change to af
  s8\sd s4 s\su s\sd s16 s\su |
  s8\sd s4 s\su s\sd s16 s\su |
  s8\sd s4 s\su s\sd s16 s\su |
  s8\sd s4 s\su s\sd s16 s\su |
  s2..\sd s8\su |
  
  \barNumberCheck 41
  s8\sd s2..\su |
  s2\sd s\su |
  s4.\sd s8\su s4.\sd s8\su |
  s2\sd s\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  
  \barNumberCheck 49
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s2 |
  s4.\sd s8\su s2 |
  s4.\sd s8\su s4.\sd s8\su |
  s2..\sd s8\su |
  s2..\sd s8\su |
  
  \barNumberCheck 57
  s4.\sd s8\su s2 |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s2 |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  
  \barNumberCheck 65
  s8 s\sd s8. s16\su s2 |
  s2..\sd s8\su |
  % key change to b
  s2..\sd s8\su |
  s16.\sd \movePedalB s32\su \movePedalA s16.\sd \movePedalB s32\su \movePedalOff
  s16.\sd \movePedalB s32\su \movePedalA s16.\sd \movePedalB s32\su \movePedalOff
  s8.\sd s16\su \movePedalA s16.\sd \movePedalB s32\su
    \movePedalOff s16.\sd \movePedalB s32\su |
  \movePedalA s16.\sd \movePedalB s32\su \movePedalOff s16.\sd \movePedalB 
    s32\su \movePedalA s16.\sd \movePedalB s32\su \movePedalOff s16.\sd 
    \movePedalB s32\su \movePedalOff s4.\sd s8\su |
  s8.\sd \movePedalB s16\su
    \movePedalOff s16.\sd \movePedalB s32\su \movePedalA s16.\sd \movePedalB
    s32\su \movePedalOff s4...\sd s32\su |
  s4.\sd s8\su \movePedalA s16.\sd \movePedalB s32\su \movePedalOff s16.\sd
    \movePedalB s32\su \movePedalA s16.\sd \movePedalB s32\su \movePedalOff
    s16.\sd \movePedalB s32\su |
  s4\sd s\su s16.\sd \movePedalB s32\su \movePedalA s16.\sd \movePedalB s32\su
    \movePedalOff s16.\sd \movePedalB s32\su \movePedalA s16.\sd \movePedalB
    s32\su \movePedalOff |
  
  \barNumberCheck 73
  s2..\sd s8\su |
  s2\sd s\su |
  s1 * 4 |
  s2.. \movePedalA s16.\sd \movePedalB s32\su \movePedalOff |
  s2...\sd s16\su |
  
  \barNumberCheck 81
  s2...\sd s16\su |
  s2...\sd s16\su |
  s2...\sd s16\su |
  s2...\sd s16\su |
  s2...\sd s16\su |
  s2...\sd s16\su |
  s2...\sd s16\su |
  s2...\sd s16\su |
  
  \barNumberCheck 89
  s1\sd |
  s4 s2.\su |
  s1
  s2\sd s\su |
}

forceBreaks = {
  \cadenzaOn
  s4 s s s s s s s s1\noBreak
  \cadenzaOff
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\pageBreak

  % page 2
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 2 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 2 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 4 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\pageBreak
  
  % page 3
  \repeat unfold 5 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 4 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 4 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 5 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 4 { s1\noBreak } s1\pageBreak
  
  % page 4
  \repeat unfold 4 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 2 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 2 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\pageBreak
  
  % page 5
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 2 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 2 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 5 { s1\noBreak } s1\pageBreak
}

nocturneOneMusic = \score {
  \header {
    opus = "Opus 62, No 1"
  }
  \keepWithTag layout
  \new PianoStaff \with { 
    instrumentName = \markup \huge "No. 1" 
    tieWaitForNote = ##t
  } <<
    \new Staff = "upper" \with { 
      \consists "Span_arpeggio_engraver" 
      connectArpeggios = ##t
    } \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Dynamics \pedal
    \new Devnull \forceBreaks
  >>
}

nocturneOneMidi = \book {
  \bookOutputName "nocturne-op62-no1"
  \score { 
    \keepWithTag midi
    <<
      \new Staff = "upper" << \rightHand \dynamics \pedal >>
      \new Staff = "lower" << \leftHand \dynamics \pedal >>
    >>
    \midi {}
  }
}
