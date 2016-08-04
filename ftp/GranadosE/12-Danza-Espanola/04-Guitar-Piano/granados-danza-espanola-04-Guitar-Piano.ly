\version "2.18.2"

\header {
  title = "Danza Espanola No. 4"
  subtitle = "Arr. Guitar and Piano"
  composer = "Enrique Granados"
  arranger = "Arr. for Guitar by Devin Ulibarri"
  opus = ""
  style = "Based loosely on piano version from IMSLP -- TO BE FILLED IN"
  source = "Guitar Arrangement by Devin Ulibarri"
  date = ""
  mutopiacomposer = "Enrique Granados Arr. by Devin Ulibarri"
  mutopiainstrument = "Guitar"
  mutopiatitle = "Danza Espanola No. 5"
  license = "Creative Commons Attribution-ShareAlike 4.0"
  maintainer = "Devin Ulibarri"
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
  \time 2/4
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
  <d,-1 b-2>4 %{need to move this 2 up%} d'-4-\4\harmonic | <d, b> d'\harmonic |
  <d, b>4 d'\harmonic | <d, b> d'\harmonic |
  s4 d4-4 | s4 d4-4 |
  s2 | s4 d-4 |
  s4 d-4 | s4 d-4\harmonic |
  s4 d4-4 | s4 d4-4 |
  s2 | s4 d-4 |
  s4 d-4 | s4 d-4\harmonic |
  s4 f,4 | s4 f4 |
  s4 e4 | s4 e4 |
  s4 a4 | s4 a4 |
  s4 d4 | s4 g4 |
  s4 f,4 | s4 f4 |
  s4 e4 | s4 e4 |
  s4 a4 | s4 a4 |
  s4 d4 | s4 g4 |
  \bar "|."
}

lowerVoice = \relative c {
  \voiceThree
  \slurDown
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  \stemDown
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g e'>2 | <g e'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g e'>2 | <g e'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
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
  s2 | s2 |
  s2 | s4 s8. d16-4-\2\glissando |
  %{\stemUp%} <g-4^\2 %{how to put fingering up? %} b,-2-\3>8 g-1 %{\stemDown%} <g b,-2>16 a-3 b-1 c-2 | \acciaccatura<c>8 <b-1 d,-1>8 a16-4 b-1 <g-2 b,-3>8. e16-1 |
  <a c,>8 a a16-1 b-3 c-4\glissando d-4 | \acciaccatura d8-4 <c-1 e,-2>8 b16-1 c-1 <a-3 c,-2>8. g16-4 |
  <fis-3 c-1>8 fis-1 \acciaccatura g8-2 <fis-1 c-3>16 d-1 e-2 fis-1 | \stemUp <g-2 b,-3>4 \stemNeutral r8. d16-4 \glissando |
  %{\stemUp%} <g-4^\2 %{how to put fingering up? %} b,-2-\3>8 g-1 %{\stemDown%} <g b,-2>16 a-3 b-1 c-2 | \acciaccatura<c>8 <b-1 d,-1>8 a16-4 b-1 <g-2 b,-3>8. e16-1 |
  <a c,>8 a a16-1 b-3 c-4\glissando d-4 | \acciaccatura d8-4 <c-1 e,-2>8 b16-1 c-1 <a-3 c,-2>8. g16-4 |
  <fis-3 c-1>8 fis-1 \acciaccatura g8-2 <fis-1 c-3>16 d-1 e-2 fis-1 | \stemUp <g-2 b,-3>4 \stemNeutral r8. d,16 |
  g8 g <g b>16 a b c | \acciaccatura c8-2 b-0-\2 a16 b <g b>8. e16 |
  a8 a <a c>16 b c d | \acciaccatura d8-4 c b16 c <a c>8. g16 |
  c8 c <c-1 e-1>16 d-2 e-4 fis-2 | \acciaccatura fis-2 <e-1 g,-0>8 d16-1 e16-0 <c-3 fis,-2>8. d16-3 |
  <g-4 b,-1>8 g-1 <g-1 b,-2>16 a-3 b-1 c-2 | \acciaccatura c8-2 <b-1 d,-1>8 a16-4 b-1 <g-1 b,-0>8. d,16-0 |
  g8 g <g b>16 a b c | \acciaccatura c8-2 b-0-\2 a16 b <g b>8. e16 |
  a8 a <a c>16 b c d | \acciaccatura d8-4 c b16 c <a c>8. g16 |
  c8 c <c-1 e-1>16 d-2 e-4 fis-2 | \acciaccatura fis-2 <e-1 g,-0>8 d16-1 e16-0 <c-3 fis,-2>8. d16-3 |
  <g-4 b,-1>8 g-1 <g-1 b,-2>16 a-3 b-1 c-2 | \acciaccatura c8-2 <b-1 d,-1>8 a16-4 b-1 <g-1 b,-0>4 |
  
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
%{
    % tabs are not completely developed
    \new TabStaff = "Guitar tabs" \with {
      restrainOpenStrings = ##t
    } <<
      \clef "moderntab"
      \global
      \context TabVoice = "upperVoice" \upperVoice
      \context TabVoice = "middleVoice" \middleVoice
      \context Tabvoice = "lowerVoice" \lowerVoice
    >>
%}
  >>
  \layout {}
  \midi {
    \context { \TabStaff \remove "Staff_performer" }
    \tempo 4 = 74
  }
}
