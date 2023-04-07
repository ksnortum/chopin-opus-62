%...+....1....+....2....+....3....+....4....+....5....+....6....+....7....+....
\version "2.24.1"

#(set-global-staff-size 18)

\header {
  title = "Twelve Etudes"
  composer = "Frédéric Chopin (1810-1849)"
  opus = "Opus 62"
  maintainer = "Knute Snortum"
  maintainerEmail = "knute (at) snortum (dot) net"
  source = "https://vmirror.imslp.org/files/imglnks/usimg/4/4a/IMSLP114005-PMLP02310-FChopin_Nocturnes,_Op.62_BH4.pdf"
  copyright = \markup { 
    \center-column {
      "Copyright © 2023 Knute Snortum. This work is licensed under the" 
      \with-url #"https://creativecommons.org/licenses/by-sa/4.0/" 
      "Creative Commons Attribution-ShareAlike 4.0 International License."
    }
  }
}

\paper {
  ragged-right = ##f
  ragged-last-bottom = ##f

  system-system-spacing =
    #'((basic-distance . 8) 
       (minimum-distance . 4)
       (padding . 2)
       (stretchability . 60)) % defaults: 12, 8, 1, 60

  last-bottom-spacing = 
    #'((basic-distance . 6)
       (minimum-distance . 4)
       (padding . 3)
       (stretchability . 30)) % defaults 1, 0, 1, 30
    
  top-system-spacing.minimum-distance = 10
    
  #(set-paper-size "letter")
}

\layout {
  \context {
    \Score
    \omit BarNumber
    \override Slur.details.free-head-distance = 1
  }
  \context {
    \Staff
    \consists Span_arpeggio_engraver
  }
  \context {
    \Voice
    \override Tie.minimum-length = 3
  }
}

\midi {
  \context {
    \Staff
    \consists "Dynamic_performer"
  }
  \context {
    \Voice
    \remove "Dynamic_performer"
  }    
}
