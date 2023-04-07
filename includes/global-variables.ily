%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....
\version "2.24.1"

%
% Redefine
%

staffUp   = \change Staff = "upper"
staffDown = \change Staff = "lower"

sd = \sustainOn
su = \sustainOff

% Accidentals above trills (but not trill spans)
accidentalsOverTrills = {
  \override TextScript.script-priority = -50
  \override Script.script-priority = -100
}

% Accidentals under fermatas
accidentalUnderFematas = {
  \override TextScript.script-priority = -100
  \override Script.script-priority = -50
}

trillsUnderSlurs = {
  \override Script.avoid-slur = #'inside
}

% Accidentals, trills and trill spans under slur
accidentalsTrillsUnderSlurs = {
  \trillsUnderSlurs
  \override TextScript.avoid-slur = #'inside
  \override TextScript.outside-staff-priority = ##f
  \override TrillSpanner.avoid-slur = #'inside
  \override TrillSpanner.outside-staff-priority = ##f
}

%
% Markup
%

dolceLegato = \markup \large \italic "dolce legato"
sostenutoWhiteout = \markup \large \italic \whiteout \pad-markup #0.5
  "sostenuto"
sostenuto = \markup \large \italic "sostenuto"
smallNatural = \markup \tiny \natural
smallSharp = \markup \tiny \sharp
smallFlat = \markup \tiny \flat
dolciss = \markup \large \italic "dolciss."
dolce = \markup \large \italic "dolce"
pocoRall = \markup \large \italic "poco rall."
aTempo = \markup \bold \normalsize "A tempo"
dimRall = \markup \large \italic \column { "dim." "rall." }
ritenuto = \markup \large \italic "ritenuto"
calando = \markup \large \italic "calando"
crescWhiteout = \markup \large \italic \whiteout \pad-markup #0.5 "cresc."
ten = \markup \large \italic "ten."
crescMarkup = \markup \large \italic "cresc."
agitato = \markup \large \italic "agitato"
