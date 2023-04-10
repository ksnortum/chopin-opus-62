%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....
\version "2.24.1"

\include "global-variables.ily"

%%% Positions and shapes %%%

slurShapeA = \shape #'((0 . 5) (2 . 0) (0 . -4) (0 . 0)) \etc
slurShapeB = \shape #'((-5 . -1) (0 . 0) (0 . 0) (0 . 0)) \etc
slurShapeC = \shape #'((0 . -4) (0 . 0.5) (0 . 0.5) (0 . -2)) \etc

slurPositionsA = \tweak Slur.positions#'(3 . 3) \etc
slurPositionsB = \tweak Slur.positions#'(3 . 4) \etc
slurPositionsC = \tweak Slur.positions#'(0 . -3) \etc
slurPositionsD = \tweak Slur.positions#'(-13 . -12) \etc

beamPositionsA = \once \override Beam.positions = #'(0.5 . 0.5)
beamPositionsB = \once \override Beam.positions = #'(0.25 . 1)

mergeWithVoiceOneOn = {
  \voiceOne  
  \autoBeamOff 
  \omit Flag
}

mergeWithVoiceOneOff = {
  \autoBeamOn 
  \undo \omit Flag |
  \voiceTwo 
}

shortenStem = \tweak Stem.length 3 \etc

tweakArpeggioA = 
  \tweak positions #'(2 . 11)
  \tweak extra-spacing-width #'(-1 . 0)
  \tweak X-offset -1
  \tweak vertical-skylines ##f
  \etc

%%% Music %%%

global = {
  \time 4/4
  \key e \major
  \accidentalStyle piano
}

rightHandUpper = \relative {
  \oneVoice
  \partial 4 b4(
  gs'4. a8  b ds e cs |
  b2 fs4. gs8 |
  e2 fs8 gs a b |
  cs2) r8 cs4( b8 |
  b4 a) r8 gs(\tuplet 3/2 { gs8 fs8. es16 } |
  es4 fs) r8 as,( b a' |
  gs4 ds8 e \tuplet 6/4 { ds[ e ds e fs cs] } |
  \omit TupletBracket
  e2 \tuplet 3/2 4 { ds8)\noBeam ds'8.( cs16 cs8 b a } |
  
  \barNumberCheck 9
  gs4.) a8( b16 e fs gs  \tuplet 6/4 4 { fs e b cs gs cs } |
  b2 fs4.) gs8( |
  e4 ds8 e  fs8. gs16 a8 b |
  cs2) r8 cs4( b8 |
  \grace { as8[ b cs] } b4 as4. b8 cs css |
  ds4. cs8) as8([ b cs, r16 gs''] |
  gs4 fs,~ fs8 b ds8. cs16 |
  as2 b4) r |
  
  \barNumberCheck 17
  gs4.( a8 b cs e d |
  es,2 fs4) r |
  as4.( b8 cs ds fs e |
  fss,2 gs8 a cs b |
  es,2) fs8( g b a |
  a4 g16. fs32 e16 ds ds2) |
  \trillsUnderSlurs
  \accidentalsOverTrills
  \slashedGrace { e8 } g'4~ \tuplet 6/4 { g16^( e c g e c } \staffDown \stemUp
    \tag layout { g8.^\smallNatural\trill fs32 e }
    \tag midi   { a32 g a g a g fs e }
    \staffUp g'8-.)[ c,16\rest as(] |
  \stemNeutral b2) cs8( ds e8. fs16 |
  
  \barNumberCheck 25
  gs4. a8) \magnifyMusic 0.63 \scaleDurations 4/18 {
    b8\slurPositionsA ([ e fs gs b e fs gs fs e b gs fs e b cs gs cs)]
  } |
  b2( fs4. g8 |
  e4. f8 g b c a |
  g2 d4. e8 |
  cs2~ cs8 ds e es |
  fs4) b, gs'2~\slurPositionsB ( |
  gs16[ cs,] \tuplet 3/2 { gs' fs cs' } 
    \magnifyMusic 0.63 \scaleDurations 2/11 {
      gs'8 fs cs' gs' fs cs a fs cs a gs
    } fs4)^\ten\trill \appoggiatura { es16[ fs] } gs8[ r16 b,(] |
  <gs e'>4) r r e'8.( fs16 |
  
  \barNumberCheck 33
  <gs, e' gs>2.) \voiceOne e'8( fs16 gs |
  <e gs>2 <ds fs>4 <cs e>) |
  cs'4( b e, fs8 gs16 a |
  <cs, a'>8 <b gs'>) \oneVoice r4 r8 \voiceOne s e'8.\slurShapeB ( e16 |
  e4  fs16 e cs gs  gs8 fs16 e  e8 fs16 fss |
  \grace { fss8 } gs8) \oneVoice r r16 \voiceOne e16( a <cs e> <bs ds>8
    <ds, gs>) \oneVoice r16 \voiceOne e16( a <cs e> |
  ds8) ds,( \oneVoice fs16 a bs16. a'32  a16 ds, fs a,  ds fs, a cs, |
  \voiceOne e8^\agitato ds16 cs  bs8 cs16 ds  ds8) fss,16( gs  as bs cs ds |
  
  \barNumberCheck 41
  \oneVoice e8) ds16( e  fs gs e fs  gs4 b |
  gs8 fs16 e  ds8 e16 fs)  fs^( b, cs b  cs ds e fs |
  \voiceOne gs8) fss16( gs  as b gs as  b4 ds |
  b8 as16 gs  as8 b16 fss  gs4 as | 
  b8 as16 gs  as cs b fss  gs8 b16 fss  gs8 b16 fss |
  gs8 a16 es  fs8 a16 es  fs8 a16 es  fs8 g16 ds |
  <g, c e>8) \oneVoice r r16 \voiceOne a16( c <ds fs> <e g>8 <g, c>) 
    \oneVoice r16 \voiceOne a( c <ds fs> |
  <e g>8 <g, c>) \oneVoice r16 e'( g e'  ds d cs c  b 
    <d, g bf> a' <bs, fs' af>) |
    
  \barNumberCheck 49
  \voiceOne g'8( fs16 e  ds8 e16 fs  fs8 c16 b  cs ds e fs |
  g16 e fs g  a b g a  b4 d) |
  b8( a16 g  fs8 g16 a  a d, e d  e fs g a |
  b8 as16 b  cs d b cs  d4 fs) |
  d8( cs16 b  cs8 d16 as  b4 cs |
  d8 cs16 b  cs e d as  b8 d16 as  b fs d' as |
  b8 c16 gs  a8 c16 gs  a8 c16 gs  a8 c16 gs |
  <c, a'>8) \oneVoice r r16 \voiceOne d( f <gs b> <a c>8 <c, f>) \oneVoice r16 
    \voiceOne d( f <gs b> |
  
  \barNumberCheck 57
  \tempo 4 = 58 \oneVoice <a c>4)^\ritenuto \tempo 4 = 56 s4 \tempo 4 = 54 s 
    \tempo 4 = 52 s |
  \tempo "A tempo" 4 = 60
  gs4.( a8  b ds e cs |
  b2 fs~ |
  fs4. g8  a cs d b |
  a2 e4.) fs8 |
  ds2~ ds8( es fs fss |
  gs4 cs, a'2 |
  b4 e, cs'2 |
  
  \barNumberCheck 65
  ds4) \grace { \staffDown fss,,8[^( gs bs ds \staffUp gs]) } 
    \slashedGrace { gs } gs'8.( fs16 fs4 e8. ds16 |
  ds4. cs8 bs cs ds e |
  e4 a,~ a8 gs \tuplet 3/2 { b a gs } |
  gs8 cs, \scaleDurations 2/3 { gs' fs cs'  gs' fs cs'  gs' fs cs |
  gs8 fs e  cs gs fs) } \tempo 4 = 56 fs4^\ritenuto\trill 
    \appoggiatura { es16[ fs] } \tempo 4 = 52 gs8[ r16 b,]( |
  \tempo "A tempo" 4 = 60 <gs e'>4) r r e'8.( fs16 |
  <gs, e' gs>2.) \voiceOne e'8( fs16. <e gs>32 |
  q2 <ds fs>4. <cs e>8 |
  
  \barNumberCheck 73
  cs'4 b e, fs8 gs16 \slashedGrace { b8 } a16 |
  <cs, a'>8 <b gs'>) \oneVoice r4 r16 cs^( e ds s16 \voiceOne 
    e8.*1/3 \noBeam e'16. e32 |
  e4  fs16 e cs gs  gs4  fs16 e fs gs |
  \grace { \once \hideNotes gs8\arpeggio } gs4. as16 gs <ds fs>4. <cs e>8 |
  <a c fs>4 <b es gs> a' <a, ds>16 cs'8 ds,16) |
  <gs, ds'~>4\arpeggio \voiceOne ds'16( \staffDown b \staffUp e fs  
    \oneVoice a gs cs b  e fs gs b |
  gs'4) r b,,( b |
  \voiceOne b4~ \tuplet 3/2 { b8 a gs } <b, e gs>4) gs'8.( gs16 |
  gs4~\arpeggio gs8 \scaleDurations 2/3 { gs16 fs16. e32 } e2)\fermata |
  \bar "|."
}

rightHandLower = \relative {
  \partial 4 s4
  s1 * 8 |
  
  \barNumberCheck 9
  s1 * 8 |
  
  \barNumberCheck 17
  s1 * 8 |
  
  \barNumberCheck 25
  s1 * 8
  
  \barNumberCheck 33
  \voiceTwo
  s2. cs'4 |
  as1 |
  fs'2 s4 ds |
  e4 s4 s8 e4.*1/3 gs4 |
  <e gs>4 s cs cs8. <a e'>16 |
  <bs ds>8 s8 s16 e8 s16 s4 s16e8 s16 |
  bs'4 s2. |
  s1 |
  
  \barNumberCheck 41
  s1 * 2 |
  s4 r16 <cs, ds>8 q16 r <ds gs>8 <b gs'>16 r16 <cs as'>8 <cs fss as>16 |
  r16 <b ds>8 q16 r <cs ds>8 q16 r <b ds>8 q16 r <cs ds fss>8 <cs ds>16 |
  r16 <b ds>8 q16 r <cs ds>8 q16 r <b ds>8 <cs ds> <b ds> <cs ds>16 |
  r16 <b ds>8 <b cs> <a cs> <b cs>16 r <a cs>8 <b cs> <a cs> a16 |
  s4 s16 a8 s16 s4 s16 a8 s16 |
  s2. s8.
  % This is an enharmonic tie from B-sharp in rightHandUpper to C-natural in
  % the following measure.
  \once \hideNotes bs16~ |
  
  \barNumberCheck 49
  c16 \staffDown \voiceOne <g c>8 q <a c> c16  a a8 a <a b> <a ds>16 |
  \staffUp \voiceTwo r16 <b e>8 q16 r e8 <c e>16 r <b e g>8 q16 r <c d a'>8
    <c d>16~ |
  q16[ q8 q q q] c c <c d> q16 |
  r16 d8 <b e>16 r <e as>8 q16 r <d fs b>8 <d fs>16 r <e as>8 <e as cs>16 |
  r16 <d fs>8 q16 r <e fs>8 q16 r <d fs>8 q16 r <e fs as>8 <e fs>16 |
  r16 <d fs>8 q16 r <e fs>8 q16 r <d fs>8 <e fs> d <e_~ fs^~>16 |
  q16 d r d8[ c d] c d c d16 |
  s4 s16 d8 s16 s4 s16 d8 s16 |
  
  \barNumberCheck 57
  s1 * 8 |
  
  \barNumberCheck 65
  s1 * 6 |
  s2. \mergeWithVoiceOneOn cs8.. \shortenStem b32 \mergeWithVoiceOneOff |
  as1 |
  
  \barNumberCheck 73
  fs'2 s4 ds |
  e4 s2 fs16 e gs8 |
  <e gs>2  bs16 cs e ds  cs8.. b32 |
  \grace { \once \hideNotes e8\arpeggio } e2 s |
  s2  e16 f c e  s4 |
  s4 ds8[ e16] s s2 |
  s1 |
  r4 ds\arpeggio s cs |
  cs4 b2. |
}

rightHand = <<
  \global
  \set Score.tempoHideNote = ##t
  \tempo "Lento" 4 = 60
  \mergeDifferentlyDottedOn
  \new Voice \rightHandUpper
  \new Voice \rightHandLower
>>

leftHandUpper = \relative {
  \partial 4 r4
  e,4 <e' gs cs>( <b gs' b>) <b' e gs> |
  b,,4( <fs'' ds'> <a ds> <b, a'>) |
  <cs, cs'>4 <e' gs cs> <b, b'> <e' gs d'> |
  <a,, a'>4 <e'' cs'> <gs,, gs'> <es'' b' cs> |
  <fs,, fs'>4( <cs'' cs'> <es \tweak duration-log 1 b' d> <cs cs'>) |
  fs,4 <cs' a'> ds, <b' fs' a> |
  e,4 <b' gs'> cs, <e' fs as> |
  b,4 << { b''2 } \\ { gs4( fs) } >> <b ds a'> |
  
  \barNumberCheck 9
  e,,4 <e' gs cs>( <b gs' b>) <b' e gs> |
  b,,4 <fs'' ds'>~ <a ds> <bs,, bs'>( |
  <cs cs'>4) <e' gs cs> <b, b'> <e' gs d'> |
  <a,, a'> <e'' cs'> <g,, g'> <e'' b' e> |
  <fs,, fs'>4 <fs'' cs' e> <e,, e'> <gs'' cs gs'> |
  <ds,, ds'> <as''' cs fss> <gs, ds' b'>\arpeggio <es cs' b'>\arpeggio |
  <fs, fs'>4 <fs'' b e> fs, <fs' as e'> |
  b,4 <fs' cs' e> b, <fs' b ds> |
  
  \barNumberCheck 17
  d4 <fs b d> gs, <fs' b fs'> |
  <cs, cs'> <cs' gs' b> <fs,, fs'> <cs'' fs a> |
  <e, e'>4 <gs' cs> <as,, as'> <gs'' cs> |
  <ds, ds'> <as'' cs> <d,, \tweak duration-log 1 d'> <fs' b> |
  <cs, \tweak duration-log 1 cs'> <gs'' b> <c,, \tweak duration-log 1 c'>
    <e' a> |
  b1 |
  s1 |
  s2 \voiceThree a' |
  
  \barNumberCheck 25
  \oneVoice e,4 <e' gs cs>( <b gs' b>) <b' e gs> |
  b,,4 <b' a'>( <a' ds>) b,, |
  c4 <e' a>( <g, g'> <g' e'>) |
  g,,4 <g' f'>( <f' b>) g,~ |
  <g, g'>4 <e'' as> <fs,, fs'>( <e e'> |
  <ds ds'>4) <b'' a'> <e,, e'> <e'' gs d'> |
  <a,, a'> <fs'' cs' e> <b,, b'> <a'' ds> |
  e,8( cs'16 as  cs b e ds  fs e gs fss  a gs fs e |
  
  \barNumberCheck 33
  \voiceThree ds4)( \once \hideNotes \stemDown cs4) \stemUp s2 |
  s1 |
  a'2( a) |
  s1 |
  ds,4 s2. |
  s1 * 2 |
  \staffUp \voiceTwo e'16 \staffDown \voiceThree <fs, a>8 q q q16~ fs16 fs8 fs
    fs <fs_~ bs^~>16 |
    
  \barNumberCheck 41
  q16 <e cs'>8 <gs cs>16  r <a cs>8 q16  r <gs cs e>8 q16  r <a b fs'>8 
    <a_~ b^~ ds^~ fs>16 |
  <a b ds>16 <a b>8 q q q16_~ a16 a8 a <a b> <a b ds>16 |
  r16 <gs css>8 q16 s2. |
  gs,16_( ds'8-> ds16)  ds,16_( ds'8-> ds16)  gs,16_( ds' \slashedGrace { fs8 }
    e16 ds  css ds ds, ds') |
  gs,16_( ds'8-> ds16)  ds,16_( ds'8-> ds16) gs,16_( ds' ds, ds'  gs, ds' ds, 
    ds' |
  gs,16 ds' cs, cs'  fs, cs' cs, cs'  fs, cs' cs, cs'  fs, cs' b, b') |
  s1 * 2 |
  
  \barNumberCheck 49
  s16 \voiceOne \beamPositionsA c8 c c \voiceTwo a'16~ \beamPositionsB 
    a \voiceOne b,8 b b b16 |
  s1 * 3 |
  b16( fs'8-> fs16) fs,( fs'8-> fs16) s2 |
  b,16( fs'8-> fs16) fs,( fs'8-> fs16) s2 |
  s1 * 2 |
  
  \barNumberCheck 57
  s1 |
  \oneVoice b,,4( <e' gs cs> <b gs' b>) <b' gs'> |
  b,,4( <fs'' b ds> <ds fs b> <d fs d'>) |
  <a, a'>4 <d' fs b>( <a fs' a>) <a' d fs> |
  a,,4 <e'' a cs>( <cs e a> <c e c'>) |
  <a, a'>4 <ds' fs bs> <gs,, gs'>( <fs fs'> |
  <es es'>4) <cs'' gs' b> <fs,, fs'> <cs'' fs a> |
  <gs, gs'>4 <e'' b' d> <a,, a'> <e'' a cs> |
  
  \barNumberCheck 65
  <bs, bs'>4 <gs'' ds' fs> <cs,, cs'> <e'gs cs e> |
  <a,, a'>4 <fs'' cs' e> r2 |
  <cs, cs'>4 <e' a e'> <b, b'> <e' b' e> |
  <as,, as'>4 <fs'' cs' e> r2 |
  <fs,, fs'>4 <fs'' as e'> <b,, b'> <a'' ds> |
  e,8( cs'16 as  cs b ds cs  e ds fs e  a gs fs e |
  \voiceThree ds8) cs,16( gs' \oneVoice cs bs ds cs  e ds fs e  a gs fs e |
  fs,8) bs16( cs  e ds fs e  gs8) cs,16\( ds  fs e gs fs |
  
  \barNumberCheck 73
  \voiceThree a2( a)\) |
  s1 * 2 |
  \grace { b8 \tweakArpeggioA \arpeggio } as1 |
  s2 a4 s |
  s1 * 2 |
  s2 e |
}

leftHandLower = \relative {
  \partial 4 s4
  s1 * 8 |
  
  \barNumberCheck 9
  s1 * 8 |
  
  \barNumberCheck 17
  s1 * 5 |
  \voiceFour
  b,,4\slurShapeA ^( <fs'' a> <a c>\> <g b>8 <fs a>)\! |
  \oneVoice b,,4 <b' g'> \voiceFour <as' e'> b, |
  \oneVoice b,4-.( <fs'' \tweak duration-log 4 ds'>2 \voiceFour cs8 b) |
  
  \barNumberCheck 25
  s1 * 8 |
  
  \barNumberCheck 33
  ds8 cs,16( \oneVoice gs'  cs bs ds cs  e ds fs e  a gs fs e |
  fs,8) bs16( cs  \voiceFour e ds fs e  gs8) cs,16( ds  fs e gs fs |
  e16 ds cs e  ds cs b ds  cs b as cs  b fs cs b |
  \oneVoice e,8) r16 b''( ds cs e ds  fs e gs fs  a gs fs e |
  \voiceFour ds8) cs,16( gs'  ds' cs e ds  fs e a gs  fss gs e cs) |
  \oneVoice gs16( ds' gs bs  <fss cs'>8) r gs,16( ds' gs bs <fss cs'>8) r |
  gs,,16( gs' ds' bs') r4 r2 |
  \voiceFour r4 ds,,8( cs bs16 gs'8 gs16  gs,16 gs' a gs) |
  
  \barNumberCheck 41
  cs,16( gs' bs cs)  fs,( cs' gs' fs)  cs,( gs'' fs e  ds cs b fs) |
  b,16( e' ds gs  gs8\> fs16 e)\!  ds8(\< e16 fs\!  fs b, cs b) |
  e,16( b' e e,)  ds( gs' es fss)  gs,( b' as gs  fss e ds ds,) |
  gs4 ds gs s |
  gs4 ds s2 |
  s1 |
  bf16\slurPositionsC (\< bf' e g  fs8)\! \oneVoice r \voiceFour 
    bf,,16\slurPositionsC (\< bf' e g  fs8)\! \oneVoice r |
  \voiceFour as,,16(\< as' e' g c8)\! \oneVoice r b,,8.( c16 cs d 
    \afterGrace 7/8 ds8\trill { css16[ ds]) } |
    
  \barNumberCheck 49
  \voiceFour e4 g8( fs16 e  ds8 e16 fs  fs8 c16 b) |
  e16^( g' fs e)  a,^( c' b a)  e,^( b'' a g  fs e d a |
  d,16) g'^( fs b  b8 a16 g)  fs8^( g16 a)  a^( d, e d) |
  g,16^( b' a g  fs es fs fs,  b,) d''^( cs b  as g fs fs,) |
  b4 fs  \oneVoice b16( fs' \slashedGrace { a8 } g16 fs  es fs fs, fs') |
  \voiceFour b,4 fs  \oneVoice b16( fs' fs, fs'  b, fs' fs, fs' |
  b,16 fs' e, e'  a, e' e, e'  a, e' e, e'  a, e' e, e') | 
  \voiceFour ds,16^(\< c' f a gs8)\! d\rest ds,16^(\< c' f a gs8)\! d\rest |
  
  \barNumberCheck 57
  ds,16\slurShapeC ^( c' f a  
    <<
      { \staffUp c f a a'  f c a f  \oneVoice c \staffDown f, c) f\rest }
      \new Voice { \oneVoice r4 r \voiceFour r8 r16 c, }
    >> |
  s1 * 7 |
  
  \barNumberCheck 65
  s1 * 6 |
  \voiceFour
  ds'4 s2. |
  s1 |
  
  \barNumberCheck 73
  e16( ds cs e  ds cs b ds  cs b as cs  b fs cs b |
  \oneVoice e,8) r16 b''( ds cs e ds  fs e gs fs  a gs fs e |
  ds8) cs,16( gs'  ds' cs e ds  fs e gs fs  a gs fs e) |
  \voiceFour fs,8 bs16( cs  e ds fs e  gs8) cs,16( ds  fs e gs fs |
  \oneVoice e16 ds css ds  d cs bs cs  \voiceFour c f, a c,  \oneVoice b) b'( 
    fs' a) |
  e,,16( e' b' e  gs) r r8 r2 |
  R1 |
  r4 <b, fs' b>\arpeggio s \voiceFour a |
  <e e' gs>1\arpeggio_\fermata |
}

leftHand = <<
  \clef bass
  \global
  \mergeDifferentlyHeadedOn
  \new Voice \leftHandUpper
  \new Voice \leftHandLower
>>

dynamics = {
  \override TextScript.Y-offset = -0.5
  \partial 4 s4^\sostenutoWhiteout
  s1 * 2 |
  s2..\< s8\! |
  s2. s4\> |
  s4 s\! s2 |
  s1 * 2 |
  s2 s8.\< s16\! s4 |
  
  \barNumberCheck 9
  s2 s^\dolce
  s1 |
  s4 s2\< s8 s\! |
  s2 s\cresc |
  s1 |
  s2... s16\! |
  \override DynamicTextSpanner.style = #'none
  s2\f s8 s4.\dim |
  s2..\> s8\! |
  
  \barNumberCheck 17
  s1\p |
  s1 |
  s2..\< s8\! |
  \revert DynamicTextSpanner.style
  s1\cresc |
  s1 |
  s2... s16\!
  \grace { s8\ff } s1 |
  s2\sf s4..\> s16\! |
  
  \barNumberCheck 25
  s1\p |
  s1 | 
  s1\pp |
  s2.. s8^\crescWhiteout |
  s4 s2.\< |
  s4 s2.\! |
  s1\f |
  s2.\p s8.\< s16\! |
  
  \barNumberCheck 33
  s2. s8.\< s16\! |
  s2.\> s4\! |
  s2. s8.\< s16\! |
  s8.\> s16\! s8 s4.\< s8. s16\! |
  s4\> s8 s\! s4\tweak Y-offset -2 \< s8. s16\! |
  s8 s\< s s\! s s\< s8. s16\! |
  s4..\< s16\! s4..\> s16\! |
  s2\tweak Y-offset -3 \f s4..\< s16\! |
  
  \barNumberCheck 41
  \override DynamicTextSpanner.style = #'none
  s8 s\cresc s2. |
  s8 s\< s4 s2\! |
  s1 * 2 |
  s2 s\dim
  s1 | 
  s1\p |
  s2 s\cresc |
  
  \barNumberCheck 49
  \revert DynamicTextSpanner.style
  s1\tweak X-offset -2 \f |
  s2. s4\cresc |
  s1 |
  s2... s16\!
  s1 |
  s2 s8 s\dim s4 |
  s2... s16\! |
  s1\pp |
  
  \barNumberCheck 57
  s16 s\< s8 s8. s16\! s8.\> s16\! s4 |
  s1\tweak Y-offset 1 \p |
  s1 |
  s2..\tweak X-offset 0 \pp\< s8\! |
  s1 |
  \revert DynamicTextSpanner.style
  s2 s\cresc |
  s1 * 2 |
  
  \barNumberCheck 65
  s2... s16\! |
  \override DynamicTextSpanner.style = #'none
  s4.\> s8\! s2\dim |
  s1\p |
  s4\f s2\< s8. s16\! |
  s2 s4..\> s16\! |
  s4\p s2\< s8. s16\! |
  s2. s4\< |
  s16 s8.\! s2. |
  
  \barNumberCheck 73
  s1 |
  s8\> s\! s4 s16 s8.\< s4 |
  s16 s8.\! s2. |
  s1 |
  s2\< s4\! s8.\> s16\! |
  s4 s2\> s8. s16\! |
  s1 | 
  s2 s4..\< s16\! |
  s4 s\> s2\! |
}

pedal = {
  \partial 4 s4
  s4.\sd s8\su s4.\sd s8\su |
  s2..\sd s8\su |
  s2\sd s4.\su\sd s8\su |
  s2\sd s4.\su\sd s8\su |
  s4.\sd s8\su s2 |
  s2\sd s4.\su\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s2 |
  
  \barNumberCheck 9
  s4.\sd s8\su s4 s8.\sd s16\su |
  s2\sd s\su |
  s4\sd s\su s\sd s\su |
  s4\sd s\su s4.\sd s8\su |
  s4\sd s\su s4.\sd s8\su |
  s4.\sd s8\su s8\sd s\su s8.\sd s16\su |
  s2\sd s\su |
  s4\sd s\su s\sd s\su |
  
  \barNumberCheck 17
  s4.\sd s8\su s4.\sd s8\su |
  s2\sd s4.\su\sd s8\su |
  s4.\sd s8\su s4.\sd s8\su |
  s2\sd s4.\su\sd s8\su |
  s2\sd s4.\su\sd s8\su |
  s2\sd s\su |
  s2\sd s8.. s32\su s4 |
  s2.\sd s4\su |
  
  \barNumberCheck 25
  s4.\sd s8\su s4..\sd s16\su |
  s2\sd s\su |
  s4.\sd s8\su s4.\sd s8\su |
  s2\sd s\su |
  s4\sd s2.\su |
  s4\sd s\su s4.\sd s8\su |
  s4..\sd s16\su s4..\sd s16\su |
  s1 |
  
  \barNumberCheck 33
  s1 * 3 |
  s4\sd s2.\su |
  s1 |
  s8.\sd s16\su s8.\sd s16\su s4\sd s8.\su\sd s16\su |
  s2\sd s8. s16\su s4 |
  s1 |
  
  \barNumberCheck 41
  s2 s8.\sd s16\su s8 s\sd |
  s8 s\su s2. |
  s8.\sd s16\su s8\sd s\su s\sd s\su s4 |
  s8\sd s\su s8.\sd s16\su s2 |
  s8\sd s\su s8.\sd s16\su s2 |
  s1 |
  s4\sd s\su\sd s4\su\sd s8.\su\sd s16\su |
  s4.\sd s8\su s4 s16 s\sd \afterGrace 7/8 s8 s\su |
  
  \barNumberCheck 49
  s1 |
  s8\sd s\su s\sd s\su s8.\sd s16\su s4 |
  s8\sd s\su s2. |
  s8\sd s\su s4 s8\sd s\su s4 |
  s8\sd s\su s8.\sd s16\su s2 |
  s4\sd s8.\su\sd s16\su s2 |
  s1 |
  s4\sd s8.\su\sd s16\su s4..\sd s16\su |
  
  \barNumberCheck 57
  s2...\sd s16\su |
  s2\sd s4.\su\sd s8\su |
  s2\sd s8 s4.\su |
  s4.\sd s8\su s4.\sd s8\su |
  s2\sd s8 s4.\su |
  s2\sd s\su |
  s4\sd s\su s\sd s\su |
  s4\sd s\su s\sd s\su |
  
  \barNumberCheck 65
  s4.\sd s8\su s4.\sd s8\su |
  s4.\sd s8\su s2 |
  s4\sd s\su s4.\sd s8\su |
  s2.\sd s4\su |
  s4\sd s\su s4.\sd s8\su |
  s1 * 3 |
  
  \barNumberCheck 73
  s1 |
  s4\sd s2.\su |
  s1 * 2 |
  s2. s8.\sd s16\su |
  s4\sd s16\su s8.\sd s2 |
  s1 |
  s4\su s8\sd s\su s8\sd s\su s8\sd s\su |
  s4\sd s2.\su |
}

forceBreaks = {
  \partial 4 s4
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 4 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 4 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\pageBreak
  
  % page 2
  \grace { s8 } \repeat unfold 3 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 4 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 2 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 2 { s1\noBreak } s1\pageBreak
  
  % page 3
  \grace{ s8 } \repeat unfold 2 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 2 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 2 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 1 { s1\noBreak } s1\pageBreak
  
  % page 4
  \repeat unfold 2 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 2 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 2 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 5 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 4 { s1\noBreak } s1\pageBreak
  
  % page 5
  \repeat unfold 2 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 2 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 2 { s1\noBreak } s1\break\noPageBreak
  \repeat unfold 3 { s1\noBreak } s1\pageBreak
}

nocturneTwoMusic = \score {
  \header {
    opus = "Opus 62, No 2"
  }
  \keepWithTag layout
  \new PianoStaff \with { 
    instrumentName = \markup \huge "No. 2"
    connectArpeggios = ##t
  } <<
    \new Staff = "upper" \rightHand
    \new Dynamics \dynamics
    \new Staff = "lower" \leftHand
    \new Dynamics \pedal
    \new Devnull \forceBreaks
  >>
}

nocturneTwoMidi = \book {
  \bookOutputName "nocturne-op62-no2"
  \score { 
    \keepWithTag midi
    <<
      \new Staff = "upper" << \rightHand \dynamics \pedal >>
      \new Staff = "lower" << \leftHand \dynamics \pedal >>
    >>
    \midi {}
  }
}
