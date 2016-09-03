\version "2.18.2"

\header {
  title = "Forlorn Hope"
  subtitle = " Fancy"
  composer = "Dowland J."
  piece = \markup { \circle 3 = "F#" and capo at 3rd or 2nd fret } % tune g down 1/2 step to f#, then capo at 3rd fret
  arranger = "Arranged for Guitar by Devin Ulibarri and Robert Wang"
  opus = ""
  style = ""
  source = "http://imslp.org/wiki/Special:ImagefromIndex/275886 AND http://imslp.org/wiki/Lute_Music_%28Dowland,_John%29"
  date = "2016-08-15"
  mutopiacomposer = "Dowland J."
  mutopiainstrument = "Guitar"
  mutopiatitle = "Forlorn Hope Fancy"
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
  \time 4/4
  \key e \minor
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

upperVoice = \relative c' {
  \voiceOne
  \slurDown
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  r1 |
  r |
  r |
  r2 e |
  dis4 d cis c |
  b2 b8. cis16 d8 b |
  d cis cis4 b'2 |
  ais4-4 a-4 gis g |
  <dis fis> d cis c |
  b a8. c16 b4 g8 fis |
  g4 r fis8 g4-1 a8-3 |
  b4-0 r r2 |
  r2 r4 e |
  r4 b'4. ais8 a4 | 
  <b, gis'> g' <b,-\3 fis'>4. r8 |
  r fis'-1 e4-0 fis4. e8 |
  dis4 r fis2 |
  eis4 e fis cis8 b~ |
  b cis cis4 fis2-4 |
  eis4-1 e-0 dis d |
  cis4. b8 a2 |
  gis4 cis cis bis |
  <eis, gis cis> gis' gis4. fisis8
  <dis gis>4. fis8-\2 eis4 fis |
  fis8-\2 eis16-\2 dis-\2 eis4-\2 fis4. e8 | 
  dis8 cis dis4 e g-4-\2 |
  fis4.-1 fis8 e4 b8. cis16 |
  d4 e fis g |
  s1 |
  gis8 g fis a g e dis-3 d-3 |
  cis c b4 a8 g fis8. fis'16 |
  e4 fis8-3 fis e e dis32 cis b ais b cis dis e |
  fis cis d e fis gis a fis gis fis gis ais b-4 b,-2 d-1 e-3 a fis-1 fis cis-1 dis e-\2 fis a g4 |
  fis32-1 d-2 b-4 fis-1 a'-3 e-2-\2 c-4-\3 e-0 g-3 b,16-0 g'32-3 fis-3 d-4 b fis' e4 b32 cis-3 dis-4 e fis b, cis-2 dis-4 |
  e4 c32-1 b-0 c b c b c b c b c b c8 r16 <b e>8. |
  e1 |
  \bar "|."
}


lowerVoice = \relative c {
  \voiceFour
  \slurDown
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  \stemDown
  e2 dis4 d | 
  cis c b8 cis d b |
  cis fis~ fis16 e cis dis e8 e,~ e16 fis g a | 
  b a b cis d cis d b cis8 b-2 c4-2 |
  b8 cis d e fis4.-\4 a,8 | %measure 5
  e'4. e8 b2 |
  ais4 a gis-2 g | 
  fis8-1 gis-2 a-3-\6 b cis dis e e, |
  b'4~ b16 a fis8~ fis16 g a8~ a16 g e8~ | 
  e16 fis g8~ g fis g4 d' | %measure 10; This last note is octave lower in original: g16 a bes8~ bes a bes4 f
  e,8. fis16 g8 a-\6 b2-2 | 
  b4-2 b e2 |
 < dis b>4 <d b> cis-4 c-2 | %all notes from fis to d (next measure) were originally one octave below
  b2-1 fis8. g16 a4-\6 | 
  e2 b'16 a b cis d cis d e | %measure 15
  <fis-3-\4 fis,-1>4 g-2-\4 fis-\4 fis, | 
  <b fis'-\4> b'-\3 ais a | 
  gis g fis2-\4 |
  eis4 e dis2-1 | 
  cis2-4 b4 fis | %measure 20
  fis eis fis2 | 
  s2 <fis fis'-\4>4 <gis dis'> |
  s8 cis4 s8 s2 | 
  s1 |
  cis4. b8 ais4 fis | %measure 25
  b4. a8 g-3 fis-1 e4 |
  b' b e16 dis e fis g e g a | 
  b-\3 fis-\4 b32-\3 a g fis g16 e a32 g fis e dis16 b r8 r4 |
  c16 a d32-\5 c b a g16 g'-\4 d e b32 a b cis d b d e fis16-\4 e32 d cis b cis dis | 
  e16 d32 cis b a b cis d cis d e fis-\4 e fis-\4 d e dis e fis g fis g a b16-4-\3 a32 g fis e fis gis | %measure 30
  a16 g32 fis e d e fis g16 fis32 e d cis d e fis-\4 e fis-\4 g-\4 fis-\4 e e16~ e32 e dis cis dis8 |
  e4 dis8-1 d cis c b4 | 
  s2 s4 e, |
  b'8 a e16 e' b d c8-4 r16 e b4 |
  r16 e32 fis gis e fis-\4 gis a-3 gis-2 a gis a gis a gis a gis a gis a a, c d e,4 | %measure 35
  e1 |
}

middleUpperVoice = \relative c' {
  \voiceTwo
  \set stringNumberOrientations = #'(down)
  \set fingeringOrientations = #'(down)
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.font-size = #-5
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  \slurUp
  s1 |
  r2 b2 |
  ais4-4 a-2 gis-2 g |
  fis4 b~ b4. a8-3 |
  b4~ b16 b ais gis a8 gis a4 | %measure 5
  a8 gis16 fis g4 fis8 b~ b a16 g! |
  fis4 r4 r2 |
  cis'2-1 e4 g,16 a b cis |
  r8 b4-\3 ais a gis!8~ |
  gis8 g a4~ a16 g g8 d4 |
  s1 |
  g8-1 g fis4 s2 |
  s4 b4~ b8 ais-3 <a-3 e'-0>4~ |
  e'8 dis-3 d4 cis c-\3 |
  s s d s8 e16 d |
  cis16-1 b-0 cis-1 d-2 cis-1 b b8 b ais16 gis ais4 |
  b-\3 r r2 |
  r4 b ais a |
  gis gis cis-3 bis-2 |
  cis2-2 b4-\3 a |
  <fis a> gis fis8-\4 fis-\4 fis4-\4 |
  fis8-\4 eis16 dis e4 a bis |
  s2 cis4 cis |
  cis-\3 bis-\3 <ais cis> <ais cis> |
  gis cis-\3 cis2 |
  b2 b4 b-1-\3 |
  e16-4-\2 e-\2 dis cis dis4 r2 |
  r2 b8 d32 c b a g16 e g32 fis e d |
  a''4 b2 ais8 a |
  s1 |
  s1 |
  s4 s8 b,32 cis d b cis b cis dis e8 s4 |
  s1|
  s2 s8 g,32 e g a s4 |
  e32 fis gis a b gis a b r4 r4 s16 a gis fis |
  <gis b>1 |
}

middleLowerVoice = \relative c {
  \voiceThree
  \set stringNumberOrientations = #'(down)
  \set fingeringOrientations = #'(down)
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.font-size = #-5
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  \slurUp
  s1 |
  s1 |
  s1 |
  s2 s4 e8-1 fis-4 |
  g8 fis16 e r4 r2 | %measure 5
  r1 |
  r4 fis4~ fis16 fis-0 eis dis-\5 e4 |
  fis8-3-\4 e16-1 d cis8-2 dis e fis r4 |
  s1 |
  s4 d4. b8 a8. c16 |
  b8 e b8. cis16 dis4-1 e8.-2 fis16-4-\4 |
  fis-4-\4 e e8~ e dis e4 g~ |
  g8 fis fis4 r e-1 |
  <fis-2-\4 b-4-\3> fis fis-\4 e8-\5 fis-\5 | %fingering in this measure has been modified slightly from original.
  gis16 fis gis a b a b cis fis,4-\4 fis16 e fis gis |
  ais8-4 a-3 b4-3-\3 cis2 |
  s1 |
  s1 |
  r2 fis,4. gis8-3 |
  a4-3 ais-3 fis-\4 fis-\4 |
  cis2 cis |
  cis2 s |
  r8 r4 b8 ais gis ais4 |
  gis2 ais4 fis | 
  r2 fis'4 ais |
  fis2 e4 e8-3-\5 g-2-\4 |
  <fis-2-\4 b-3-\3>2 r2 |
  s1 |
  s1 |
  s1 |
  s1 |
  e32-2 g-1 fis-0 a-3 g-1 b-0 a-4 c-2 b-0 fis g a s4 e'32 e, g a fis4 |
  ais,8 a gis g-1 fis b e32 fis g a b g e e'-\2 |
  r2 e,32-2 dis e fis s8 g fis16 a-3 |
  s2 s4 r16 e8. |
  <b e>1 |
}

%%{ %This is the Lute Tab
upperVoiceLute = \relative c'' {
  \voiceOne
  \slurDown
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  r1 |
  r |
  r |
  r2 g |
  fis4 f e ees |
  d2 d8. e16 f8 d |
  f e e4 d'2 |
  cis4 c b bes |
  <fis a> f e ees |
  d c8. ees16 d4 bes8 a |
  bes4 r a8 bes4 c8 |
  d4 r r2 |
  r2 r4 g |
  r4 d'4. cis8 c4 | 
  <d, b'> bes' <d,-\3 a'>4. r8 |
  r a' g4 a4. g8 |
  fis4 r a2 |
  gis4 g a e8 d~ |
  d e e4 a2 |
  gis4 g fis f |
  e4. d8 c2 |
  b4 e e dis |
  <gis, b e> b' b4. ais8
  <fis b>4. a8-\2 gis4 a |
  a8-\2 gis16-\2 fis-\2 gis4-\2 a4. g8 | 
  fis8 e fis4 g bes-\2 |
  a4. a8 g4 d8. e16 |
  f4 g a bes |
  s1 |
  b8 bes a c bes g fis f |
  e ees d4 c8 bes a8. a'16 |
  g4 a8 a g g fis32 e d cis d e fis g |
  a e f g a b c a b a b cis d d, f g c a a e fis g-\2 a c bes4 |
  a32 f d a c' g-\2 ees-\3 g bes d,16 bes'32 a f d a' g4 d32 e fis g a d, e fis |
  g4 ees32 d ees d ees d ees d ees d ees d ees8 r16 <d g>8. |
  g1 |
  \bar "|."
}


lowerVoiceLute = \relative c {
  \voiceFour
  \slurDown
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  \stemDown
  g'2 fis4 f | 
  e ees d8 e f d |
  e a~ a16 g e fis g8 g,~ g16 a bes c | 
  d c d e f e f d e8 d ees4 |
  d8 e f g a4.-\4 c,8 | %measure 5
  g'4. g8 d2 |
  cis4 c b bes | 
  a8 b c-\6 d e fis g g, |
  d'4~ d16 c a8~ a16 bes c8~ c16 bes g8~ | 
  g16 a bes8~ bes a bes4 f' | %measure 10; This last note is octave lower in original: g16 a bes8~ bes a bes4 f
  g,8. a16 bes8 c-\6 d2 | 
  d4 d g2 |
 < fis d>4 <f d> e ees | %all notes from fis to d (next measure) were originally one octave below
  d2 a8. bes16 c4-\6 | 
  g2 d'16 c d e f e f g | %measure 15
  <a-\4 a,>4 bes-\4 a-\4 a, | 
  <d a'-\4> d'-\3 cis c | 
  b bes a2-\4 |
  gis4 g fis2 | 
  e2 d4 a | %measure 20
  a gis a2 | 
  s2 <a a'-\4>4 <b fis'> |
  s8 e4 s8 s2 | 
  s1 |
  e4. d8 cis4 a | %measure 25
  d4. c8 bes a g4 |
  d' d g16 fis g a bes g bes c | 
  d-\3 a-\4 d32-\3 c bes a bes16 g c32 bes a g fis16 d r8 r4 |
  ees16 c f32-\5 ees d c bes16 bes'-\4 f g d32 c d e f d f g a16-\4 g32 f e d e fis | 
  g16 f32 e d c d e f e f g a-\4 g a-\4 f g fis g a bes a bes c d16-\3 c32 bes a g a b | %measure 30
  c16 bes32 a g f g a bes16 a32 g f e f g a-\4 g a-\4 bes-\4 a-\4 g g16~ g32 g fis e fis8 |
  g4 fis8 f e ees d4 | 
  s2 s4 g, |
  d'8 c g16 g' d f ees8 r16 g d4 |
  r16 g32 a b g a-\4 b c b c b c b c b c b c b c c, ees f g,4 | %measure 35
  g1 |
}

middleUpperVoiceLute = \relative c' {
  \voiceTwo
  \set stringNumberOrientations = #'(down)
  \set fingeringOrientations = #'(down)
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.font-size = #-5
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  \slurUp
  s1 |
  r2 d2 |
  cis4 c b bes |
  a4 d~ d4. c8 |
  d4~ d16 d cis b c8 b c4 | %measure 5
  c8 b16 a bes4 a8 d~ d c16 bes! |
  a4 r4 r2 |
  e'2 g4 bes,16 c d e |
  r8 d4-\3 cis c b!8~ |
  b8 bes c4~ c16 bes bes8 f4 |
  s1 |
  bes8 bes a4 s2 |
  s4 d4~ d8 cis <c g'>4~ |
  g'8 fis f4 e ees-\3 |
  s s f s8 g16 f |
  e16 d e f e d d8 d cis16 b cis4 |
  d-\3 r r2 |
  r4 d cis c |
  b b e dis |
  e2 d4-\3 c |
  <a c> b a8-\4 a-\4 a4-\4 |
  a8-\4 gis16 fis g4 c dis |
  s2 e4 e |
  e-\3 dis-\3 <cis e> <cis e> |
  b e-\3 e2 |
  d2 d4 d-\3 |
  g16-\2 g-\2 fis e fis4 r2 |
  r2 d8 f32 ees d c bes16 g bes32 a g f |
  c''4 d2 cis8 c |
  s1 |
  s1 |
  s4 s8 d,32 e f d e d e fis g8 s4 |
  s1|
  s2 s8 bes,32 g bes c s4 |
  g32 a b c d b c d r4 r4 s16 c b a |
  <b d>1 |
}

middleLowerVoiceLute = \relative c' {
  \voiceThree
  \set stringNumberOrientations = #'(down)
  \set fingeringOrientations = #'(down)
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.font-size = #-5
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  \slurUp
  s1 |
  s1 |
  s1 |
  s2 s4 g8 a-\4 |
  bes8 a16 g r4 r2 | %measure 5
  r1 |
  r4 a4~ a16 a gis fis-\5 g4 |
  a8-\4 g16 f e8 fis g a r4 |
  s1 |
  s4 f4. d8 c8. ees16 |
  d8 g d8. e16 fis4 g8. a16-\4 |
  a-\4 g g8~ g fis g4 bes~ |
  bes8 a a4 r g |
  <a-\4 d-\3> a a-\4 g8-\5 a-\5 | %fingering in this measure has been modified slightly from original.
  b16 a b c d c d e a,4-\4 a16 g a b |
  cis8 c d4-\3 e2 |
  s1 |
  s1 |
  r2 a,4. b8 |
  c4 cis a-\4 a-\4 |
  e2 e |
  e2 s |
  r8 r4 d8 cis b cis4 |
  b2 cis4 a | 
  r2 a'4 cis |
  a2 g4 g8-\5 bes-\4 |
  <a-\4 d-\3>2 r2 |
  s1 |
  s1 |
  s1 |
  s1 |
  g32 bes a c bes d c ees d a bes c s4 g'32 g, bes c a4 |
  cis,8 c b bes a d g32 a bes c d bes g g'-\2 |
  r2 g,32 fis g a s8 bes a16 c |
  s2 s4 r16 g8. |
  <d g>1 |
}
%}

\score {
  <<
    \new Staff = "Guitar" \with {
      midiInstrument = #"acoustic guitar (nylon)"
      instrumentName = #"Guitar"

      
%      \override StringNumber #'stencil = ##f
    } <<
      \global
      \clef "treble"

      \context Voice = "upperVoice" \upperVoice
      \context Voice = "middleUpperVoice" \middleUpperVoice
    
      
      
    >>
%%{
    % tabs are not completely developed
    
    \new Staff = "Guitar Bass" \with {
    }
      <<
      \clef "bass"
      
      \context Voice = "middleLowerVoice" \middleLowerVoice
      \context Voice = "lowerVoice" \lowerVoice
      
      >>
    
    \new TabStaff = "Guitar tabs" \with {
      tablatureFormat = #fret-letter-tablature-format
      stringTunings = \stringTuning <g, c f a d' g'>
     % additionalBassStrings = \stringTuning <c, d, e, fis, g,>
      fretLabels = #'("a" "b" "r" "d" "e" "f" "g" "h" "i" "k")
    } <<
      \clef "tab"
      \global
      \context TabVoice = "upperVoiceLute" \upperVoiceLute
      \context TabVoice = "middleUpperVoiceLute" \middleUpperVoiceLute
      \context TabVoice = "middleLowerVoiceLute" \middleLowerVoiceLute
      \context TabVoice = "lowerVoiceLute" \lowerVoiceLute
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
