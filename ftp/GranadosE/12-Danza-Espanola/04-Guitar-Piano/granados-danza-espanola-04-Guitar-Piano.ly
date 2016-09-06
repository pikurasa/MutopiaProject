\version "2.18.2"

\header {
  title = "Danza Espanola No. 4"
  subtitle = "Villanesca."
  composer = "Enrique Granados"
  piece = \markup { \circle 6 = D \circle 5 = G } % drop D and drop G tuning
  arranger = "Arranged for Guitar and Piano by Devin Ulibarri"
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
  \tempo "Allegretto, alla pastorale."
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
  \override Fingering.add-stem-support = ##t
  \override StringNumber.add-stem-support = ##t
  \override StrokeFinger.add-stem-support = ##t
  <d,-1-\3 b-0>4 %{need to move this 2 up%} d'-4-\4 | <d, b> d' |
  <d, b>4 d' | <d, b> d' \bar "||"
  s4 d4-4 | s4 d4-4 |
  s2 | s4 d-4 |
  s4 d-4 | s4 d-4 \bar "||"
  s4 d4-4 | s4 d4-4 |
  s2 | s4 d-4 |
  s4 d-4 | s4 d-4 |
  s4 f,4-1-\1 | s4 f4 |
  s4 e4 | s4 e4 |
  s4 a4 | s4 a4 |
  s4 d4 | s4 g4 |
  s4 f,4 | s4 f4 |
  s4 e4 | s4 e4 |
  s4 a4 | s4 a4 |
  s4 d4 | s4 g4 |
  r2 | <c, e,>8 <b d,>16 <c e,> <a c,>4 |
  r2 | <b d,>8 <a c,>16 <b d,> <g b,>4 |
  r2 | <c e,>8 <b d,>16 <c e,> <a c,>4 |
  r2 |
  <b d,>8 <a c,>16 <b d,> <g b,>8 <b d,> |
  <a c,>8 <g b,>~ <g b,>4 |
  %{I have a note that this is where the piano takes over%}
  <d b>4 g' | <d, b> g' |
  \time 4/4 <g b,, g d>4 fis16 e d c b4 <a fis c> |
  \time 2/4 <g d-1 b-2>4 %{need to move this 2 up%} d'-4-\4\harmonic | <g, d b> d'\harmonic |
  <g, d b>4 d'\harmonic |
  <d, b> d'\harmonic | %getting lost here
  s4 d4 | s4 d4 |
  s4 d4 | s4 d4 |
  s4 d4 | s4 d4 |
  s2 | s2 |
  s2 | s2 |
  s2 | s2 |
  s2 | s2 | 
  <d, a>16 b c d d'4 \harmonic | r2 | %<c e,>8 <b d,>16 <c e,> <a c,>4 |
  <d, a>16 b c d d'4 \harmonic | r2 | %<b d,>8 <a c,>16 <b d,> <g b,>4 |
  <d, a>16 b c d d'4 \harmonic | r2 | %<c e,>8 <b d,>16 <c e,> <a c,>4 |
  <d, a>16 b c d d'4 \harmonic |
  <b d,>8 <a c,>16 <b d,> <g b,>8 <b d,> |
  <a c,>8 <g b,>~ <g b,>4 |
  %{I have a note that this is where the piano takes over%}
  <d b>4 g'\harmonic | <d, b> g'\harmonic |
  \time 4/4 <g b,, g d>4 fis16 e d c b4 <a fis c> |
  \time 2/4 <g d-1 b-2>4 %{need to move this 2 up%} d'-4-\4\harmonic | <g, d b> d'\harmonic |
  <g, d b>4 d'\harmonic | <g, d b> d'8.\harmonic d,16~ | %move harmonic to another voice
  <d-1 bes-2>4 %{need to move this 2 up%} d'-4-\4\harmonic | <g, d bes> d'\harmonic |
  <g, d bes>4 d'\harmonic | <g, d bes> d'\harmonic |
  
  %{Cancion y estribillo%}
  \key g \minor
  \time 4/4
  g,4 g16 a bes c bes8 a16 bes g8 a |
  bes8 c c4 d4 r8 f, |
  bes4 bes16 c d ees d8 c16 d bes8 c |
  <d f,>8 <e g,> <e g,>4 <fis a,> d, |
  g f16 g f ees! d8 d bes c |
  d8 <d bes>4 <d bes>8 g4 f16 g f ees |
  <d bes>8 <d g,> <bes g> <c f,>16 es, <d' d,>8 <g, d> a <bes d,> |
  <a es> g fis16 e fis g g4 %{this is where piano takes over%} r4 |
  r1 | r1 |
  r1 | r1 |
  r1 | r1 |
  r1 | r1 |
  \time 2/4
  \key g \major
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  <d' a>16 b c d d'4 \harmonic | <c e,>8 <b d,>16 <c e,> <a c,>4 |
  <d, a>16 b c d d'4 \harmonic | <b d,>8 <a c,>16 <b d,> <g b,>4 |
  <d a>16 b c d d'4 \harmonic | <c e,>8 <b d,>16 <c e,> <a c,>4 |
  <d, a>16 b c d d'4 \harmonic |
  <b d,>8 <a c,>16 <b d,> <g b,>8 <b d,> |
  <a c,>8 <g b,>~ <g b,>4 |
  <d b>4 g'\harmonic | <d, b> g'\harmonic |
  \time 4/4 <g b,, g d>4 fis16 e d c b4 <a fis c> |
  \time 2/4 <g d-1 b-2>4 %{need to move this 2 up%} d'-4-\4\harmonic | <g, d b> d'\harmonic |
  <g, d b>4 d'\harmonic | <g, d b> d'\harmonic |
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  <d, a>16 b c d d'4 \harmonic | r2 |
  <d, a>16 b c d d'4 \harmonic | r2 |
  <d, a>16 b c d d'4 \harmonic | r2 |
  <d, a>16 b c d d'4 \harmonic |
  <b d,>8 <a c,>16 <b d,> <g b,>8 <b d,> |
  <a c,>8 <g b,>~ <g b,>4 |
  r4 g'\harmonic | r4 g\harmonic |
  \time 4/4 r1 |
  \time 2/4 r4 %{need to move this 2 up%} d-4-\4\harmonic | r4 d\harmonic |
  r4 d\harmonic | r4 d\harmonic |
  r2 | d2\harmonic |
  \bar "|."
}

lowerVoice = \relative c {
  \voiceThree
  \slurDown
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  \override Fingering.add-stem-support = ##t
  \override StringNumber.add-stem-support = ##t
  \override StrokeFinger.add-stem-support = ##t
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
  <g d'>2 | g4 g8 d8 | 
  <g d'>2 | g4 g8 d8 |
  <g d'>2 | g4 g8 d8 |
  <g d'>2 | g4 g8 d8 |
  <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>4 r4 r4 d4 | %Andante espress.
  <g d'>2 | <g d'>2 | %this measure is a tempo
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 | %melody start in piano
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 | %2nd melody start in piano
  <g e'>2 | <g e'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 | 
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 | 
  <g d'>2 |
  <g d'>2 |
  <g d'>4 r4 r4 d4 | %Andante espress.
  <g d'>4 r4 | <g d'>2 | %this measure is a tempo
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>4 s8. d''16 | %this second bar needs to be moved to different voice
  g8 f <c es>8 <bes d> <g ees'> <a f'> <bes d> <c ees> |
  <bes d>8 <f c'> <f c'>4 <bes, f'> r |
  bes''8 a <ees g>8 <d f> <bes g> <c ees> <d f> <c ees>|
  bes8 cis cis4 <d, fis'> d'8 c~ |
  c8 bes a f bes a g f |
  bes8 a g f <ees bes'>4 <a, c'> |
  bes4 ees8 a, bes4 c8 bes |
  c8 ees <d, c'>4 <g bes> r4 |
  r1 | r1 | %guitar tacet while piano plays 2nd half of Cancion y estribillo
  r1 | r1 |
  r1 | r1 |
  r1 | r1 |
  <g d'>2 | <g d'>2 | %1st melody
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 | %2nd melody
  <g e'>2 | <g e'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g e'>2 | <g e'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | g4 g8 d8 |
  <g d'>2 | g4 g8 d8 |
  <g d'>2 | g4 g8 d8 |
  <g d'>2 | g4 g8 d8 |
  <g d'>2 |
  <g d'>2 |
  <g d'>2 |
  <g d'>4 r4 r4 d4 | %Andante espress.
  <g d'>2 | <g d'>2 | %this measure is a tempo
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 | %melody start for both guitar and piano
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 | %2nd melody start in piano
  <g e'>2 | <g e'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 |
  <g d'>2 |
  <g d'>2 |
  r1 | %Andante espress.
  r2 | r2 | %this is 2/4 measure start
  r2 | r2 |
  r2 | r2 |
}

middleVoice = \relative c' {
  \voiceTwo
  %\set fingeringOrientations = #'(down)
  %\set stringNumberOrientations = #'(up)
  %\set strokeFingerOrientations = #'(up)
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.font-size = #-5
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  \override Fingering.add-stem-support = ##t
  \override StringNumber.add-stem-support = ##t
  \override StrokeFinger.add-stem-support = ##t

  \slurUp
  s2 | s2 |
  s2 | s4 s8. d16-3-\3 |
  %{\stemUp%} <g-4^\2 %{how to put fingering up? %} b,-2-\3>8 g-1 %{\stemDown%} <g b,-2>16 a-3 b-1 c-2 | \acciaccatura<c>8 <b-1 d,-1>8 a16-4 b-1 <g-2 b,-3>8. e16-1 |
  <a c,>8 a <a c,>16-1 b-3 c-4\glissando d-4 | \acciaccatura d8-4 <c-1 e,-2>8 b16-1 c-1 <a-3 c,-2>8. g16-4 |
  <fis-3 c-1>8 fis-1 \acciaccatura g8-2 <fis-1 c-3>16 d-1 e-3 fis-4 | \stemUp <g-4-\3 b,-0-\2>4 \stemNeutral r8. d16-3-\3 |
  %{\stemUp%} <g-4^\2 %{how to put fingering up? %} b,-2-\3>8 g-1 %{\stemDown%} <g b,-2>16 a-3 b-1 c-2 | \acciaccatura<c>8 <b-1 d,-1>8 a16-4 b-1 <g-2 b,-3>8. e16-1 |
  <a c,>8 a <a c,>16-1 b-3 c-4\glissando d-4 | \acciaccatura d8-4 <c-1 e,-2>8 b16-1 c-1 <a-3 c,-2>8. g16-4 |
  <fis-3 c-1>8 fis-1 \acciaccatura g8-2 <fis-1 c-3>16 d-1 e-3 fis-4 | \stemUp <g-4-\3 b,-0-\2>4 \stemNeutral r8. d,16-3-\6 |
  g8-0 g <g b>16 a b c | \acciaccatura c8-2 b-0-\2 a16 b <g b>8. e16 |
  a8 a <a c>16 b c d | \acciaccatura d8-4 c b16 c <a c>8. g16-0-\3 |
  c8-1-\3 c <c-1 e-1>16 d-3 e-1 fis-3 | \acciaccatura fis-3 <e-1 g,-0>8 d16-1-\2 e16-0 <c-3 fis,-2>8. d16-3-\3 |
  <g-4 b,-1>8 g-1 <g-1 b,-2>16 a-3 b-1 c-2 | \acciaccatura c8-2 <b-1 d,-1>8 a16-3-\3 b-1-\2 <g-1-\3 b,-0-\2>8. d,16-3-\6\glissando |
  g8 g <g b>16 a b c | \acciaccatura c8-2 b-0-\2 a16 b <g b>8. e16 |
  a8 a <a c>16 b c d | \acciaccatura d8-4 c b16 c <a c>8. g16-0-\3 |
  c8-1-\3 c <c-1 e-1>16 d-3 e-1 fis-3 | \acciaccatura fis-3 <e-1 g,-0>8 d16-1-\2 e16-0 <c-3 fis,-2>8. d16-3-\3 |
  <g-4 b,-1>8 g-1 <g-1 b,-2>16 a-3 b-1 c-2 | \acciaccatura c8-2 <b-1 d,-1>8 a16-3-\3 b-1-\2 <g-1-\3 b,-0-\2>4 |
  s2 | s2 |
  s2 | s2 | %{need to edit stuff below here%}
  s2 | s2 |
  s2 | s2 |
  s2 | s2 |
  s2 | s1 |
  s2 | s2 |
  s2 | s2 |
  s2 | s2 |
  s2 | s2 |
  s2 | s2 |
  \stemUp b,4-1-\3 b |
  d4-4-\3 b-1-\3 |
  c4-3-\3 c |
  e4-4-\2 c |
  e4-3-\3 e |
  g4 fis |
  b4 b |
  d4 b | \stemNeutral
  s2 | 
  s2 | s2 |
  s2 | s2 |
  s2 | s2 |
  s2 | s2 |
  s2 | s2 |
  s1 |
  s2 | s2 |
  s2 | s2 |
  s2 | s2 |
  s2 | s2 |
  s1 | s1 |
  s1 | s1 |
  s1 | s1 |
  s1 | s1 |
  s1 | s1 |
  s1 | s1 |
  s1 | s1 |
  s1 | s1 |  
  g8 g g16 a b c | \acciaccatura c8 b a16 b g8. e16 |
  a8 a a16 b c d | \acciaccatura d8 c b16 c a8. g16 |
  fis8 fis \acciaccatura g8 fis16 d e fis | \stemUp g4 \stemNeutral r8. d16 |
  g8 g g16 a b c | \acciaccatura c8 b a16 b g8. e16 |
  a8 a a16 b c d | \acciaccatura d8 c b16 c a8. g16 |
  fis8 fis \acciaccatura g8 fis16 d e fis | \stemUp g4 \stemNeutral r8. d16 |
  g8 g g16 a b c | \acciaccatura c8 b a16 b g8. e16 |
  a8 a a16 b c d | \acciaccatura d8 c b16 c a8. g16 |
  c8 c c16 d e fis | \acciaccatura fis e8 d16 e16 c8. \ottava #1 d16 |  
  g8 g g16 a b c | \acciaccatura c8 b8 a16 b g4 \ottava #0 |
  g,8 g <g b>16 a b c | \acciaccatura c8-2 b-0-\2 a16 b <g b>8. e16 |
  a8 a <a c>16 b c d | \acciaccatura d8-4 c b16 c <a c>8. g16 |
  c8 c <c-1 e-1>16 d-2 e-4 fis-2 | \acciaccatura fis-2 <e-1 g,-0>8 d16-1 e16-0 <c-3 fis,-2>8. d16-3 |
  <g-4 b,-1>8 g-1 <g-1 b,-2>16 a-3 b-1 c-2 | \acciaccatura c8-2 <b-1 d,-1>8 a16-4 b-1 <g-1 b,-0>4 |
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  r2 | r1 |
  r2 | r2 |
  r2 | r2 |
  %{\stemUp%} <g,-4^\2 %{how to put fingering up? %} b,-2-\3>8 g-1 %{\stemDown%} <g b,-2>16 a-3 b-1 c-2 | \acciaccatura<c>8 <b-1 d,-1>8 a16-4 b-1 <g-2 b,-3>8. e16-1 |
  <a c,>8 a a16-1 b-3 c-4\glissando d-4 | \acciaccatura d8-4 <c-1 e,-2>8 b16-1 c-1 <a-3 c,-2>8. g16-4 |
  <fis-3 c-1>8 fis-1 \acciaccatura g8-2 <fis-1 c-3>16 d-1 e-2 fis-1 | \stemUp <g-2 b,-3>4 \stemNeutral r8. d16-4 \glissando |
  g8 g <g b>16 a b c | \acciaccatura c8-2 b-0-\2 a16 b <g b>8. e16 |
  a8 a <a c>16 b c d | \acciaccatura d8-4 c b16 c <a c>8. g16 |
  c8 c <c-1 e-1>16 d-2 e-4 fis-2 | \acciaccatura fis-2 <e-1 g,-0>8 d16-1 e16-0 <c-3 fis,-2>8. d16-3 |
  <g-4 b,-1>8 g-1 <g-1 b,-2>16 a-3 b-1 c-2 | \acciaccatura c8-2 <b-1 d,-1>8 a16-4 b-1 <g-1 b,-0>4 |
  
}

pianoA = \relative c'' {
  \voiceOne
  %\set stringNumberOrientations = #'(down)
  %\set fingeringOrientations = #'(down)
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.font-size = #-5
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  \slurUp
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r4. r16 d, |
  <g b,>8 g <g b,>16 a b c | \acciaccatura c8 <b d,> a16 b <g b,>8. e16 |
  <a c,>8 a <a c,>16 b c d | \acciaccatura d8 <c e,> b16 c <a c,>8. g16 |
  <c e,>8 c <c e,>16 d e fis | \acciaccatura fis <e g,>8 d16 e16 <c fis,>8. d16 |
  <g b,>8 g <g b,>16 a b c | \acciaccatura c8 <b d,>8 a16 b <g b,>4 |
  %guitar plays melody the first time
  <d, a>16 b c d d'4 | r2 |
  <d, a>16 b c d d'4 | r2 |
  <d a>16 b c d d'4 | r2 |
  <d, a>16 b c d d'4 |
  <b d,>8 <a c,>16 <b d,> <g b,>8 <b d,> | %guitar and piano play together
  <a c,>8 <g b,>~ <g b,>4 |
  r4 r4 |
  r2 |
  r1 |
  r2 | <g d b>2 |
  <g d b>2 | <d b>4 r8. d,16 |
  g8 g g16 a b c | \acciaccatura c8 b a16 b g8. e16 |
  a8 a a16 b c d | \acciaccatura d8 c b16 c a8. g16 |
  fis8 fis \acciaccatura g8 fis16 d e fis | \stemUp g4 \stemNeutral r8. d16 |
  g8 g g16 a b c | \acciaccatura c8 b a16 b g8. e16 |
  a8 a a16 b c d | \acciaccatura d8 c b16 c a8. g16 |
  c8 c c16 d e fis | \acciaccatura fis e8 d16 e16 c8. \ottava #1 d16 |  
  g8 g g16 a b c | \acciaccatura c8 b8 a16 b g4 \ottava #0 |
  <d a>2 |
  r2 |
  <d a>2 |
  r2 |
  <d a>2 |
  r2 |
  <d a>2 |
  <b d,>8 <a c,>16 <b d,> <g b,>8 <b d,> |
  <a c,>8 <g b,>~ <g b,>4 |  
  r4 r4 |
  r2 |
  r1 |
  r2 |
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  r2 |
  \key bes \major r1 | r1 | %guitar plays first
  r1 | r1 |
  r1 | r1 |
  r1 | r2 r4 d4 |
\stemUp  g4 g16 a bes c bes8 a16 bes g8 a |
  bes8 c c8 d32( c bes c d4) f,4( |
  bes4) bes16 c d ees d8 c16 d bes8 c |
  <d f,>8 <e g,> e8( fis32 e d e <fis d>4) d( |
  bes'16) a g8 f16 g f ees! d8 d bes c |
  d16 ees <d bes>8~ <d bes>8 <d bes> g4( f16) g f ces |
  bes8 c d g, a bes a g |
  <a es> g fis16 e fis g g4 \fermata g'8 \fermata \bar "||"  r8 | \stemNeutral
  \key g \major %{\stemUp%} %how to add another double bar here -- add d pickup?
  <g,-4^\2 %{how to put fingering up? %} b,-2-\3>8 g-1 %{\stemDown%} <g b,-2>16 a-3 b-1 c-2 | \acciaccatura<c>8 <b-1 d,-1>8 a16-4 b-1 <g-2 b,-3>8. e16-1 |
  <a c,>8 a a16-1 b-3 c-4\glissando d-4 | \acciaccatura d8-4 <c-1 e,-2>8 b16-1 c-1 <a-3 c,-2>8. g16-4 |
  <fis-3 c-1>8 fis-1 \acciaccatura g8-2 <fis-1 c-3>16 d-1 e-2 fis-1 | \stemUp <g-2 b,-3>4 \stemNeutral r8. d16-4 \glissando |
  %{\stemUp%} <g-4^\2 %{how to put fingering up? %} b,-2-\3>8 g-1 %{\stemDown%} <g b,-2>16 a-3 b-1 c-2 | \acciaccatura<c>8 <b-1 d,-1>8 a16-4 b-1 <g-2 b,-3>8. e16-1 |
  <a c,>8 a a16-1 b-3 c-4\glissando d-4 | \acciaccatura d8-4 <c-1 e,-2>8 b16-1 c-1 <a-3 c,-2>8. g16-4 |
  <fis-3 c-1>8 fis-1 \acciaccatura g8-2 <fis-1 c-3>16 d-1 e-2 fis-1 | \stemUp <g-2 b,-3>4 \stemNeutral r8. d16-4 \glissando |
  g8 g <g b>16 a b c | \acciaccatura c8-2 b-0-\2 a16 b <g b>8. e16 |
  a8 a <a c>16 b c d | \acciaccatura d8-4 c b16 c <a c>8. g16 |
  c8 c <c-1 e-1>16 d-2 e-4 fis-2 | \acciaccatura fis-2 <e-1 g,-0>8 d16-1 e16-0 <c-3 fis,-2>8. d16-3 |
  <g-4 b,-1>8 g-1 <g-1 b,-2>16 a-3 b-1 c-2 | \acciaccatura c8-2 <b-1 d,-1>8 a16-4 b-1 <g-1 b,-0>8. d,16-0 |
  g8 g <g b>16 a b c | \acciaccatura c8-2 b-0-\2 a16 b <g b>8. e16 |
  a8 a <a c>16 b c d | \acciaccatura d8-4 c b16 c <a c>8. g16 |
  c8 c <c-1 e-1>16 d-2 e-4 fis-2 | \acciaccatura fis-2 <e-1 g,-0>8 d16-1 e16-0 <c-3 fis,-2>8. d16-3 |
  <g-4 b,-1>8 g-1 <g-1 b,-2>16 a-3 b-1 c-2 | \acciaccatura c8-2 <b-1 d,-1>8 a16-4 b-1 <g-1 b,-0>8. d16-0 |
  <d' a>2 |
  r2 |
  <d a>2 |
  r2 |
  <d a>2 |
  r2 |
  <d a>2 |
  <b d,>8 <a c,>16 <b d,> <g b,>8 <b d,> |
  <a c,>8 <g b,>~ <g b,>4 |
  r2 |
  r2 | r1 |
  r2 | r2 |
  r2 | r2 |
  %{\stemUp%} <g,-4^\2 %{how to put fingering up? %} b,-2-\3>8 g-1 %{\stemDown%} <g b,-2>16 a-3 b-1 c-2 | \acciaccatura<c>8 <b-1 d,-1>8 a16-4 b-1 <g-2 b,-3>8. e16-1 |
  <a c,>8 a a16-1 b-3 c-4\glissando d-4 | \acciaccatura d8-4 <c-1 e,-2>8 b16-1 c-1 <a-3 c,-2>8. g16-4 |
  <fis-3 c-1>8 fis-1 \acciaccatura g8-2 <fis-1 c-3>16 d-1 e-2 fis-1 | \stemUp <g-2 b,-3>4 \stemNeutral r8. d16-4 \glissando |
  g8 g <g b>16 a b c | \acciaccatura c8-2 b-0-\2 a16 b <g b>8. e16 |
  a8 a <a c>16 b c d | \acciaccatura d8-4 c b16 c <a c>8. g16 |
  c8 c <c-1 e-1>16 d-2 e-4 fis-2 | \acciaccatura fis-2 <e-1 g,-0>8 d16-1 e16-0 <c-3 fis,-2>8. d16-3 |
  <g-4 b,-1>8 g-1 <g-1 b,-2>16 a-3 b-1 c-2 | \acciaccatura c8-2 <b-1 d,-1>8 a16-4 b-1 <g-1 b,-0>8. d,16-0 |
  <d a>2 |
  r2 |
  <d a>2 |
  r2 |
  <d a>2 |
  r2 |
  <d a>2 |
  <b' d,>8 <a c,>16 <b d,> <g b,>8 <b d,> |
  <a c,>8 <g b,>~ <g b,>4 |
  <d b>4 g'\harmonic | <d, b> g'\harmonic |
  \time 4/4 <g' b, g d>4 fis16 e d c b4 <a fis c> |
  \time 2/4 <g d-1 b-2>4 %{need to move this 2 up%} r4 | <g d b> r4 |
  <g d b>4 r4 | <g d b> r4 |
  <g d b>2 | r2 |
}

pianoB = \relative c' {
  \voiceTwo
  %\set stringNumberOrientations = #'(down)
  %\set fingeringOrientations = #'(down)
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.font-size = #-5
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  \slurUp
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  b4 b |
  d4 b |
  c4 c |
  e4 c |
  e4 e |
  g4 fis |
  b4 b |
  d4 b |
  s2*19 |
  s1 | %measure 44
  s2*29 |
  s1 | %measure 74
  s2*8 |
  s1 | %measure 83
  s1*6 | 
  s2. d,8 c | %measure 90
  g'8 f <c es>8 <bes d> ees f d ees |
  f8 a a bes32 a g a bes4 \slurDown f8( ees |
  bes'8) \slurNeutral a <ees g>8 <d f> <bes g'> <c ees a> <d f> <c ees a> |
  f8 g cis d32 cis b cis fis,4 d'8 c~ |
  c8 bes a f bes a g f |
  bes16 c bes8~ bes bes d c~ c8. ces16 |
  f,8 g a d, ees4 d |
  c8 bes c4~ c8 a bes8. %{how to beam across bar?%} d16 |
}

pianoC = \relative c {
  \voiceThree
  %\set stringNumberOrientations = #'(down)
  %\set fingeringOrientations = #'(down)
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.font-size = #-5
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  \slurDown
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  r2 r2 |
  <g d'>2 | <g d'>2 |
  <g e'>2 | <g e'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 | r2 |
  r2 |
  r1 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |  
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g e'>2 | <g e'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 |
  <g d'>2 |
  <g d'>2 |
  r1 |
  r2 | r2 |
  r2 | r2 |
  r2 | r2 |
  r2 | 
  r2 |
\key bes \major  r1 | r1 |
  r1 | r1 |
  r1 | r1 |
  r1 | r1 |
\stemDown  s2 g'8 a bes c |
  <bes d>8( <f c'> <f c'>4 <bes, f'>) r |
  s1 |
  <bes' d>8 <a cis> <a cis g'>4 <d, a'> s4 |
  s1 |
  bes'8 a g f \slurUp <e bes' g'>4( <ees a f'>) | \slurNeutral
  <d aes>8 <ees g> <d fis> <bes g> <c g>4 <bes g> |
  c8 ees d,4 g,\fermata r4 | \stemNeutral
\key g \major  <g d'>2 | <g d'>2 |
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
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 |
  <g d'>2 |
  <g d'>2 |
  r1 |
  <g d'>2 |
  <g d'>2 |
  <g d'>2 |
  <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g e'>2 | <g e'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | <g d'>2 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 | g8 g16 d' g,8 d8 |
  <g d'>2 |
  <g d'>2 |
  <g d'>2 |
  r1 |
  <g d'>2 |
  <g d'>2 |
  <g d'>2 |
  <g d'>2 |
  <g d'>2~ |
  <g d'>2 |
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
\new StaffGroup <<
  \new Staff << \relative c'' \pianoA \\ \relative c' \pianoB >>
  \new Staff \relative c' { \clef bass \pianoC }
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
