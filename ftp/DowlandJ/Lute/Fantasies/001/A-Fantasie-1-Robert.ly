\version "2.18.2"

\header {
  title = "Fantasie VII"
  subtitle = "Arranged for Guitar"
  composer = "Dowland J."
  piece = \markup { \circle 3 = "F#" and capo at 2nd or 3rd fret } % tune g down 1/2 step to f#, then capo at 3rd fret
  arranger = "Arranged for Guitar by Devin Ulibarri and Robert Wang"
  opus = ""
  style = ""
  source = "Variatie of Lute Lessons by Robert Dowland | http://imslp.org/wiki/A_Varietie_of_Lute_Lessons_%28Dowland,_Robert%29 | Pages 28-30 from PDF"
  date = ""
  mutopiacomposer = "Dowland J."
  mutopiainstrument = "Guitar"
  mutopiatitle = "I. A Fantasie"
  license = "Creative Commons Attribution-ShareAlike 4.0"
  maintainer = "Devin Ulibarri and Robert Wang"
  maintainerEmail = "research at devinulibarri.com"

 footer = "Mutopia-2016/04/09-2108"
 copyright = \markup {\override #'(font-name . "DejaVu Sans, Bold") \override #'(baseline-skip . 0) \right-column {\with-url #"http://www.MutopiaProject.org" {\abs-fontsize #9  "Mutopia " \concat {\abs-fontsize #12 \with-color #white \char ##x01C0 \abs-fontsize #9 "Project "}}}\override #'(font-name . "DejaVu Sans, Bold") \override #'(baseline-skip . 0 ) \center-column {\abs-fontsize #11.9 \with-color #grey \bold {\char ##x01C0 \char ##x01C0 }}\override #'(font-name . "DejaVu Sans,sans-serif") \override #'(baseline-skip . 0) \column { \abs-fontsize #8 \concat {"Typeset using " \with-url #"http://www.lilypond.org" "LilyPond " \char ##x00A9 " 2016 " "by " \maintainer " " \char ##x2014 " " \footer}\concat {\concat {\abs-fontsize #8 { \with-url #"http://creativecommons.org/licenses/by-sa/4.0/" "Creative Commons Attribution ShareAlike 4.0 International License "\char ##x2014 " free to distribute, modify, and perform" }}\abs-fontsize #13 \with-color #white \char ##x01C0 }}}
 tagline = ##f
}

\paper {
  % add space between composer/opus markup and first staff
  markup-system-spacing #'padding = #3
  % add a little space between composer and opus
  markup-markup-spacing #'padding = #1.2
  top-margin = #8
  bottom-margin = #12
}

mbreak = {} % { \break }
global = {
  \time 2/2
  \key g \major
}

%% C with slash -------------------------------
cWithSlash = \markup {
  \combine \roman C \translate #'(0.6 . -0.4) \draw-line #'(0 . 2.0)
}
%% Span -----------------------------------
%% Syntax: \bbarre #"text" { notes } - text = any number of box
bbarre =
#(define-music-function (barre location str music) (string? ly:music?)
   (let ((elts (extract-named-music music '(NoteEvent EventChord))))
     (if (pair? elts)
         (let ((first-element (first elts))
               (last-element (last elts)))
           (set! (ly:music-property first-element 'articulations)
                 (cons (make-music 'TextSpanEvent 'span-direction -1)
                       (ly:music-property first-element 'articulations)))
           (set! (ly:music-property last-element 'articulations)
                 (cons (make-music 'TextSpanEvent 'span-direction 1)
                       (ly:music-property last-element 'articulations))))))
   #{
       \once \override TextSpanner.font-size = #-2
       \once \override TextSpanner.font-shape = #'upright
       \once \override TextSpanner.staff-padding = #3
       \once \override TextSpanner.style = #'line
       \once \override TextSpanner.to-barline = ##f
       \once \override TextSpanner.bound-details =
            #`((left
                (text . ,#{ \markup { \draw-line #'( 0 . -.5) } #})
                (Y . 0)
                (padding . 0.25)
                (attach-dir . -2))
               (right
                (text . ,#{ \markup { \cWithSlash #str } #})
                (Y . 0)
                (padding . 0.25)
                (attach-dir . 2)))
%% uncomment this line for make full barred
      % \once \override TextSpanner.bound-details.left.text = \markup{"B" #str}
      $music
   #})

#(define RH rightHandFinger)

upperVoice = \relative c'' {
  \voiceOne
  \slurDown
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  d2 b4 d | c b a2 |
  g4 b a g~ | g8 a fis4 g4. fis8 |
  e8. fis16 g8 fis16 g a8. b16 c8 b16 a | b8. c16 d4 c4 b4 |
  <a d,>4. a8 g d4 f8 | e4 d c8. d16 e8 fis! |
  g2 fis8 e16 fis g4 | r4 fis g-\1 d | 
  b d c b |  a4. b8 c d e fis | 
  g a b g c4 b4~ | b a b2~ |
  b4 g a b | c4. c8 b4 a~ | 
  a8 g g4~ g16 g-\2 fis e fis g-\2 a, fis' | g4 r r2 | 
  r2 r4 r8 g8 | a b c4~ c8 c8 b4 | 
  a2 g4 r4 | r4 r8 a b c d4 | 
  r4 cis d4. c8 | b a g a16 b c4. b8 | 
  <a fis>8 g-\2 a b16 c d4 c | b a g8 b a g | b4 a~ a8 g g4~| 
  g16 g-\2 fis e fis g-\2 e fis <d g>4 d~ | d8 a c4~ c8 d b4~ | %measure 28; this is where the Faber version diverged by a half note's length
  b8 a fis4 g4. a8 | 
  b8 a b c | 
  d4. d8 e d e fis | g2 fis8 d fis g | 
  a2 g8 c~ c16 c b8~ | b16 b a8~ a16 a g8~ g16 g fis e fis g e fis |
  g4. r8 d e fis g | a fis g e fis a~ a16 e a8~ | 
  a16 fis a8~ a16 g fis e fis e d cis d e fis d | e d e fis g a b g a g-\2 fis e g32-\2 fis g-\2 fis g-\2 fis e fis | 
  g4 r r2 | r8 g g g fis d~ d16 e fis8 |  r e' e e d b~ b16 c d8 | 
  c a c4 b4. c8~ | c b a4 gis8-\2 a-\2~ a16 a-\2 gis8-\2 | 
  r8 a a a fis8. g16 a4 |
  d,8 g8~ g8 fis r2 | r4 a, r8 b' a c |
  b g a4 r8 d,4 r8 | r4 a r8 d'8 g, c |
  b g a4 r2 | r4 a, r8 e''8 d c | b a16 g a8 fis g4 r | 
  r a, r8 g' a16 b c a | b8 g a fis g4 r |
  r a, r8 g' a16 b c d | b8 g a fis g4 r |
  r a, r16 <g' d>8.~ g4 | r2 fis16 d d e fis g a b |
  a fis d e fis g a b c c, c d e e e fis | g c, c d e fis g a b a g fis g a b a |
  b g a b g fis g a g fis g a b a b g | a g a b a g fis e fis e fis g fis e d cis |
  d cis d e fis e fis d e d e fis g fis g e | fis e fis g a g a fis g fis g a b a g fis |
  g b a g a fis b a g a b g c b a g | fis e d cis d fis e d e d e fis g a b g | 
  a g-\2 fis e g32-\2 fis g-\2 fis g-\2 fis g64-\2 fis e fis r8 b,4 a8 | b g a4 r8 b'4 a8 |
  b g a4 r8 c,4 b8 | c a b4 r8 c'4 b8 | 
  c a <b e,>4 r8 b8. b16 a8~ | a16 b g8 fis d a'~ a16 g fis e d cis |
  d e fis e fis d e8
  \time 3/4
  \tempo \markup {
    \concat {
      (
      \smaller \general-align #Y #DOWN \note #"4" #1
      " = "
      \smaller \general-align #Y #DOWN \note #"4." #1
      )
    }
  }
  fis8 e4 fis8 d4
  d8 fis4 e8 g fis g b a b g4 | g8 b4 a8 c b c g4 g8 c g | % was  g8 b4 a8 b g c g4 g8 c g |
  g a4 g8 e4 fis8 a4 fis8 d e | fis a4 d,8 g fis b4. r4. |
  b4. r4. a r | a r d r |
  d r c r | c r b r | 
  b r a r | a r g r | 
  g r g8 g f e e d | g g r e e d g4. r 
  \tempo \markup {
  }
  s1 
   \time 2/2
  \tempo \markup {
    \concat {
      (
      \smaller \general-align #Y #DOWN \note #"4." #1
      " = "
      \smaller \general-align #Y #DOWN \note #"4" #1
      )
    }
  }
  r8 <d g>4. <d g>2 \bar "|."
}


lowerVoice = \relative c {
  \voiceThree
  \slurDown
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  \stemDown

}

middleVoice = \relative c' {
  \voiceTwo
  \set stringNumberOrientations = #'(down)
  \set fingeringOrientations = #'(down)
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.font-size = #-5
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  \slurUp
  s1 | s1 |
  s1 | d2 b4 d-\3 |
  c b a2 | g4. b8-\4 a4 g~ | %imitation begins
  g8 g fis4 g4 a~ |
  a8 g g4 e c |
  d g a <d b> |
  a8 g a4 g r |
  s1 |
  s1 |
  s2 e'8 fis g4~ |
  g8 fis e4 e8. e16 dis4 |
  e2. d!4 |
  c4 a r8 g' fis e |
  <d b>2 r4 r4 |
  <b g>4 d e8 fis g4 |
  fis4 e d d |
  e2 r4 g~ |
  g8 g fis4 g d |
  d d d4. d8 |
  e8 fis g4~ g8 g fis4 |
  g4. f8 e d c d16 e |
  <fis d>4. r8 r8 g4-\2 fis8~ |
  fis8 e4 d8~ d4 cis |
  d4. c!8 b4 a8 g |
  r16 a8.~ a4 b2 |
  s2 | %measure 29; The Faber diverges here
  s1 | %measure 30
  s1 |
  a2 <c a> |
  b8 a b c d2 |
  e4. r8 r2 |
  e4 d r16 c8.~ c4~ |
  c8 a b c s4 a |
  r8 a4. a2~ |
  a2 s2 |
  s1 |
  <d b>4 <d b> <d a> <d a>~ | %measure 40
  <d a>8 d4 cis8 a4 r4 |
  r8 a4. r2 |
  e4 e e <e b> |
  a2 b8 a b4 |
  <cis a>2 |
  a2 |
  b4 a r8 b a c |
  b8 g a fis r d'4. |
  d4 r8 fis r d a c |
  b8 g a fis r g'4 fis8 |
  g4. fis8 r d a c |
  b8 g a fis r2 |
  d'4. r8 r e d c |
  b a16 g a8 fis r2 |
  d'4. r8 r g, a16 b c a |
  b8 g a fis r2 |
  r2 r8 g a16 b c d |
  b8 g a fis r16 b g a b c d e |
  s1 | %Notes in Upper: d16 g, g a b c d e fis d d e fis g a b | %measure 65
  s1 | %Notes in Upper: a fis d e fis g a b c c, c d e e e fis |
  s1 |
  s1 |
  s1 |
  s1 | %measure 70
  s1 |
  s1 |
  s1 |
  s1 |
  r8 g,~ g fis r8 d'4. |
  d4. fis8 s2 | %Notes in upper = r c,4 b8 |
  r8 a,8~ a8 gis r8 e'4. |
  e4 b8 gis r2 |
  s1 |
  r2 a4. r8 | %measure 80
}

\score {
  <<
    \new Staff = "Guitar" \with {
      midiInstrument = #"acoustic guitar (nylon)"
      instrumentName = #"Guitar"
      \mergeDifferentlyDottedOn
      \mergeDifferentlyHeadedOn
%      \override StringNumber #'stencil = ##f
    } <<
      \global
      \clef "treble_8"

      \context Voice = "upperVoice" \upperVoice
      \context Voice = "middleVoice" \middleVoice
      \context Voice = "lowerVoice" \lowerVoice
      
    >>
%%{
    % tabs are not completely developed
    \new TabStaff = "Guitar tabs" \with {
      tablatureFormat = #fret-letter-tablature-format
      stringTunings = \stringTuning <g, c f a d' g'>
     % additionalBassStrings = \stringTuning <c, d, e, fis, g,>
      fretLabels = #'("a" "b" "r" "d" "e" "f" "g" "h" "i" "k")
    } <<
      \clef "tab"
      \global
      \context TabVoice = "upperVoice" \upperVoice
      \context TabVoice = "middleVoice" \middleVoice
      \context Tabvoice = "lowerVoice" \lowerVoice
    >>
%}
  >>
  \layout {
      \context {
      \Score
    }
  }
  \midi {
    \context { \TabStaff \remove "Staff_performer" }
    \tempo 4 = 74
  }
}
