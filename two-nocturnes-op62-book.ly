%%% ----------------
%%% Go to https://github.com/ksnortum/chopin-opus-62.git for the latest edits
%%% or to report a problem or request a change.
%%%
%%% See README.md for comments about compiling this work.
%%% ----------------

\version "2.24.1"
\language "english"

%%% ------
%%% Pieces
%%% ------

\include "includes/header-paper.ily"
\include "includes/nocturnes-op62-no1-parts.ily"
\include "includes/nocturnes-op62-no2-parts.ily"

%%% ------------------
%%% Construct the book
%%% ------------------

% \pointAndClickOff % <-- uncomment me for smaller PDF size

\nocturneOneMusic
\nocturneTwoMusic

%%% ----
%%% MIDI
%%% ----

\nocturneOneMidi
\nocturneTwoMidi
