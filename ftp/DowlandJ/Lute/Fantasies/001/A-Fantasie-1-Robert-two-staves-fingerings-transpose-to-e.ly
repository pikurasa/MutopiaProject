\version "2.18.2"

\header {
  title = "Fantasie VII"
  subtitle = "Arranged for Guitar"
  composer = "Dowland J."
  piece = \markup { \circle 3 = F\raise #1.25 \teeny \sharp and capo at 3rd or 2nd fret } % tune g down 1/2 step to f#, then capo at 3rd fret
  arranger = "Arranged for Guitar by Devin Ulibarri and Robert Wang"
  opus = ""
  style = ""
  source = "Variatie of Lute Lessons by Robert Dowland | http://imslp.org/wiki/A_Varietie_of_Lute_Lessons_%28Dowland,_Robert%29 | Pages 28-30 from PDF"
  date = ""
  mutopiacomposer = "Dowland J."
  mutopiainstrument = "Guitar"
  mutopiatitle = "Fantasie VII by John Dowland"
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
  system-system-spacing = #'((basic-distance . 0.1) (padding . 3))
  % annotate-spacing = ##t
}

mbreak = {} % { \break }
global = {
  \time 2/2
  \set Timing.beamExceptions = #'() % first turn beam exceptions off
  \set Timing.baseMoment = #(ly:make-moment 1/4)
  \set Timing.beatStructure = #'(1 1 1 1)
  \key e \major
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
  \slurUp
  \tieUp 
  \stemUp
  \set stringNumberOrientations = #'(up)
  \set fingeringOrientations = #'(up)
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  b2 gis4 b | %measure 1
  a gis fis2 |
  e4 gis fis e~ | 
  e8 fis dis4 e4. dis8 |
  cis8. dis16 e8 dis16 e fis8. gis16 a8 gis16 fis | 
  gis8. a16 b4 a4 gis4-4 | %measure 6
  fis4. fis8 e b4 d8 | 
  cis4 b a8. b16 cis8 dis! |
  e2 dis8 cis16 dis e4~ | 
  e4 dis e-\1 b | 
  gis b a-3 gis-1 | %measure 11
  fis4.-0 gis8-2 a-3 b cis dis | 
  e fis gis-3 e a4 gis4~ |
  gis fis <gis dis-\2>4. gis8~ |
  gis4 e fis gis | 
  a4.-4 a8 gis4-3 fis-1~ | 
  fis8 e e4~ e16 e-\2 dis cis dis e-\2 fis,-2-\4 dis'-3 | %measure  17; I am keeping the a in top line to keep the rhythm easy to read
  e2 s2 | 
  r2 r4 r8 e8 | 
  fis gis a4~ a8 a8 gis4 | 
  fis2 e4 s4 | %measure 21
  r4 r8 fis gis a b4~ |  %measure 22
  b4 ais b4.-3 a8-3 | 
  gis-3 fis e fis16 gis a4. gis8 | 
  <fis dis>8 e-\2 fis gis16 a b4-4 a-4 | 
  gis-4 fis-3 e8-0 gis-4 fis-1 e |  %measure 26
  gis4-4 fis-3~ fis8 e e4~| 
  e16 e-\2 dis cis dis e-\2 cis dis e4 b~ | %measure 28; this is where the Faber version diverged by a half note's length
  b8 fis a4~ a8 b gis4~ | 
  gis8 fis dis4 e4. fis8 | 
  gis8 fis gis a b4. b8 |  %measure 31
  cis8 b cis dis e2 |  %measure 32
  dis8-\2 b dis e fis2 |
  e8 a~ a16 a gis8~  gis16 gis fis8~ fis16 fis e8~ |
  e16 e dis cis dis e cis dis e4. r8 |
  b8 cis dis e fis8-3 dis-4 e-0 cis-2 | %measure 36
  dis8 fis~ fis16 cis fis8~ fis16 dis fis8~ fis16 e dis cis |  %measure 37
  dis16 cis b ais b cis dis b cis b cis dis e fis gis e | 
  fis16 e-\2 dis cis e32-\2 dis e-\2 dis e-\2 dis cis dis e2 | %measure 39
  r2 r8 e e e |
  dis8 b8. cis16 dis8 r cis' cis cis |  %measure 41
  b8 gis~ gis16 a b8 a fis a4 | %measure 42
  gis4. a8~ a gis-1 fis4-4-\2 |
  eis8-\2 fis-\2~ fis16 fis-\2 eis8-\2 r8 fis fis fis | %measure 44
  dis8.-4 e16-0 fis4-3 b,8 e8~ e16 e-\2 dis8 | 
  s1 | %measure 46
  r8 gis fis a gis e fis dis |
  s1 |
  r8 b'8 e,-\1 a gis e fis8 dis |
  e1 |
  r8 cis'8-\1 b-\1 a gis fis16 e fis8 dis | %measure 51
  e1-0 |
  r8 e fis16 gis a fis gis8 e fis dis |
  e1 | 
  r8 e fis16 gis a b gis8 e fis dis | %measure 55
  e1 | 
  r8 e fis16 gis a fis gis8 e fis dis | %Original Tab: r8 g a16 b c b b8 g a fis |
  e1 | 
  r16 <e>8.~ e2. | %measure 59
  dis16 b b cis dis e fis gis fis b, b cis dis e fis gis |
  a a, a b cis cis cis dis e a, a b cis dis e fis | %measure 61
  gis fis e dis e fis gis fis gis e fis gis fis dis e fis |
  e dis e fis gis fis gis e fis e fis gis fis e dis-4 cis-2 |
  dis-4 cis dis e dis cis b ais b ais b cis dis cis dis b | %measure 64
  cis b cis dis e dis e cis-2 dis-4 cis dis e fis e fis dis |
  e dis e fis gis fis e dis e fis gis e fis dis e fis | %measure 66
  e fis gis e a gis fis e dis cis b ais b dis cis b |
  cis b cis dis e fis gis e fis e-\2 dis cis e32-\2 dis e-\2 dis e-\2 dis e64-\2 dis cis dis |
  r8 gis,4-4 fis8 gis e fis8 dis8 | %measure 69
  r8 gis'4 fis8 gis e fis4 |
  r8 a,4-3 gis8-1 a fis-\3 gis4-1 |
  r8 a'4 gis8 a fis gis eis-\2 |
  r8 gis8. gis16 fis8. gis16 e8 dis b | %measure 73
  fis'8~ fis16 e dis cis b ais b cis dis cis dis b cis8 |
  \time 6/8
  \tempo \markup {
    \concat {
      (
      \smaller \general-align #Y #DOWN \note #"4" #1
      " = "
      \smaller \general-align #Y #DOWN \note #"4." #1
      )
    }
  }
  dis8 cis4 dis8 b4 |  %measure 75; start 6/8 time
  b8 dis4 cis8 e dis | %measure 76
  e gis fis gis e4 |
  e8 gis4 fis8 a gis |
  a8 e4 e8 a e | 
  e8 fis4 e8 cis4 |
  dis8 fis4 dis8 b cis | 
  dis8 fis4 b,8 e dis | %measure 82
  gis2. |
  gis2. |
  fis2. | 
  fis2. |
  b2. |
  b2. |
  a2. |
  a2. | %measure 90
  gis2. | 
  gis2. |
  fis2. | 
  fis2. | %measure 94
  e2. | 
  e2. |
  e8 e d cis cis b | 
  e8 e4~ e4. |
  e2.~ |
  
  \tempo \markup {
  }
  e2. | %measure 100
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
  r8 <e>4.-0 <e>2 \fermata \bar "|."
}


lowerVoice = \relative c {
  \voiceFour
  \slurDown
  \stemDown
  \tieDown
  \set stringNumberOrientations = #'(down)
  \set fingeringOrientations = #'(down)
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  s1 |
  s1 |
  s1 |
  r1 |
  r1 |
  r1 | %measure 6
  b2 gis4 b | %measure 7
  a4 gis fis a |
  <e>4 gis fis e |
  b'2 e, |
  r4 e' cis-4 e-2~ | %measure 11
  e4 dis-1 cis-4 a-0 |
  gis4-4 e fis gis |
  a2 gis |
  cis4. b8 a4 gis |
  fis2-2 e4 fis-1 |
  gis4.-4 a8 b2 | %measure 17
  e,1~ | %measure 18
  e1~ |
  e1 |
  b'4. b8 cis8-4 dis-1 e4-1 |
  fis8 e dis4 e dis-\5 | %measure 22
  cis2 b2-\6 |
  e,2 a2 |
  b4. a8 gis4 fis |
  e4 dis' cis2-2 | %measure 26
  <b-2 dis-1>2 b |
  b2 e,2 | %measure 28
  dis'2 e |
  b4. b8 cis b cis dis |
  e2 dis4 b | %measure 31
  fis'4.-\4 fis8-\4 e2 |
  b'2-\3 a8 fis a b |
  s1 |
  r2. e,,8 fis |
  gis8 a b cis-3 dis-1 b-2 cis-3 ais-1 | %measure 36
  b4 ais b fis |
  b4 gis a cis |
  b2 e, |
  dis'8 b8. cis16 dis8. cis8.~ cis4 | %measure 40
  b4 gis a2 |
  gis4 e fis2 |
  e'8 cis4. d4. d8 | %measure 43
  cis4 cis <fis, cis'>2 | %measure 44
  r8 b-2 b b gis8. a16 b4 |
  e,2 e4 b'4 |
  e,2. b'4 | %measure 47
  e,2. b'4 | 
  e,8 gis a-\6 fis e4 b' |
  e,2 e4 b' |
  e,2 e4 b' |
  e,2 e4 b' | %measure 52
  e,8 gis fis4 e b' | 
  e,2 e4 b' |
  e,8 gis fis4 e b' | 
  e,2 e4 b' |
  e,8 gis fis4 e b' | %measure 57
  e,2 e4 b' |
  e,2 e2 | %measure 59, where the 32nd notes begin
  b'2 b |
  a2 a | %measure 61
  e2 e |
  cis'2 a |
  b2-1 gis | %measure 64
  a2 b |
  e,2 e'4 b | %measure 66
  cis4 a b gis |
  a4 cis b2 | %Hard to read lute tab, I think this last one is rest; Chose half note length
  e,2. b'4 | %measure 69
  e,2. b'4 |
  e,2. cis'4-3 |
  fis,2. cis'4 |
  e,2. b'4 | %measure 73
  r8 b4. b4. ais8 | %...or a rest could be notated; r8 d4. d4. cis8; NOTE: If you look at lute tab closely, this d in bass seems to be between the top voice's 'a' and 'g' thus making me suspect this rhythm to be correct.
  b4 ais8 b4 gis8 | %measure 75, where the 6/8 begins
  gis4 b8 a4 b8 | %measure 76
  e4 dis8 e4 cis8 |
  cis4 e8 d4 e8 |
  a,4 cis8 cis4. |
  cis4 d8 cis4 a8 |
  b4 fis8 b4 fis8 |
  b4 fis8 gis e b' |  %measure 82
  e,8 e'-1-\5 e e e e |
  r8 e, e e e e |
  b'8 b ais b b fis |
  b8 b fis b b a |
  gis8 e b'-\6 gis e b'-\6 |
  gis8 e b'-\6 gis e e | %measure 88
  a8 a a a a b |
  cis8 cis b cis cis dis |
  e8 e e e, e e |
  e8 e fis gis gis a |
  b8-2 b ais-1 b-3 b fis-2 |
  a8 a fis b b a | %measure 94
  gis8 e gis a-\6 e a-\6 |
  gis8 gis e e' e d |
  cis8 cis b a a gis |
  cis8-3 cis b-1 a-0 a gis-4 |
  a8 gis a gis a gis |
  a8 gis a gis a4 | %measure 100
  e2-0 <b'-1 e,-0>2 |
}

upperMiddleVoice = \relative c' {
  \voiceTwo
  \set stringNumberOrientations = #'(down)
  \set fingeringOrientations = #'(down)
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.font-size = #-5
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  s1 | 
  s1 |
  s1 | 
  s1 |
  s1 |
  s1 | %measure 6; imitation begins
  <b fis>2 s2 |
  r1 |
  gis8 a b cis a4 <b gis> |
  fis8-1 e-2 fis4 e2 |
  s1 | %measure 11
  s1 |
  b'4. e8-\2 cis dis e4-\2~ |
  e8 dis cis4 cis8.-4-\3 cis16-\3 bis4-3-\3 | %original tab from R. Dowland has a 'c' note on 4th string, but I cannot imagine this to be correct.
  cis2 r4 b4 |
  a2-3 b8. e16-\2 dis8-3 cis-1 |
  b2-0 b2-\3 | %measure 17
  r4 b cis8 dis e4 |
  dis4 cis b2 |
  s2 b4-\3 e-\2~ |
  e8 e-\2 dis4 r2 | %measure 21
  s2 b4 fis8 b | %measure 22
  cis8-\3 dis e4-\2 e8.-\2 e16-\2 dis4 |
  e4.-4-\2 dis8 cis b cis4 |
  b2-\3 s8 e4-3-\2 dis8-3~ |
  dis8 cis4-2 b8-0~ b4 ais-3 | %measure 26
  b4.-0 a!8-4 gis4-2 fis8-0 e-2 |
  <fis-2-\4 b-3-\3>2-\3 e2 |
  s1 | %measure 29; The Faber diverges here
  s1 | 
  s2 fis2 | %measure 31
  s1 |
  s2 cis'2 |
  cis4 b <cis>4 <b>4 |
  <a>2 e8 fis gis a | 
  s1 | % measure 36
  s1 |
  s1 |
  s1 |  % measure 39
  s1 | % measure 40; this measure needs fixed
  s1 |
  s2 <cis>4 <cis> | % measure 42
  cis4 <cis> fis,2 |
  s2 <ais>2 |
  s1 |
  r8 <gis>8 fis <a> gis8 \parenthesize e fis \parenthesize dis | % measure 46
  r8 <b'>4. <b>2 |
  r8 <b>8 fis <a> gis \parenthesize e <fis> \parenthesize dis |
  r4 r8 dis'8 e4.-\2 dis8 |
  r8 <b>8 <fis> a gis8 \parenthesize e fis \parenthesize dis|
  s2 b'4. s8 | % measure 51
  s1 |
  s1 | 
  r8 e, <fis>16 gis a fis gis8 \parenthesize e fis \parenthesize dis |
  s1 | % measure 55
  r8 e fis16 gis a b gis8 \parenthesize e fis \parenthesize dis |
  s1 |
  r8 e fis16 gis a fis gis8 \parenthesize e fis \parenthesize dis |
  r16 <gis b> e fis gis a b cis b e, e fis gis a b cis | % measure 59
  s1 | 
  s1 | % measure 61
  s1 |
  s1 |
  s1 | % measure 64
  s1 | 
  s1 | % measure 66
  s1 |
  s1 |
  s1 | % measure 69
  r8 <b>4. <b>4. dis8 |
  s1 |
  r8 <cis>4. <cis>2 |
  r8 <b>4 <b> s4. | % measure 73
  s1 |
  s2. | % measure 75
  s2. | % measure 76
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. | % measure 82
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. | %measure 100
  r8 <b-0 e,-1-\4>4. <b e,-3>2 |
}

lowerMiddleVoice = \relative c' {
  \voiceThree
  \set stringNumberOrientations = #'(up)
  \set fingeringOrientations = #'(up)
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.font-size = #-5
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  r1 | 
  r1 |
  r1 | 
  b2-\3 gis4 b-\3 |
  a gis fis2 |
  e4. gis8-\4 fis4 e~ | %measure 6; imitation begins
  e8 e dis4 e4 fis~ |
  fis8 e e4 <fis-\4 cis> r4 |
  b,4 e r2 |
  s1 |
  s1 | %measure 11
  s1 |
  e2-1 r4 b'4-\3 |
  r2 gis2-\4^ \markup \tiny { a\raise #1.25 \teeny \natural "in original." } | %original tab from R. Dowland has a 'c' note on 4th string, but I cannot imagine this to be correct.
  gis2 fis8 e e4 |
  e8 e dis4 e4 a4 |
  gis2 fis2-\4 | %measure 17
  <gis e>2 s4 e4 |
  fis8 gis a4. a8 gis4 |
  fis2 e |
  r4 <b'-\3>4 a4 gis4 | %measure 21
  b2 s2 | %measure 22
  s1 |
  s1 |
  s1 |
  s1 | %measure 26
  s1 |
  s1 |
  s1 | %measure 29; The Faber diverges here
  s1 | 
  s1 | %measure 31
  a4. a8 gis8 fis gis a |
  r2 cis2 |
  r2 a4 <gis>4 |
  <fis-\4>2 r2 | 
  r4 fis4 b2-0 | % measure 36
  fis1 |
  s1 |
  r2 <b gis>8 e, <b' gis> e, |  % measure 39
  <b' fis>4 \tieUp <b fis>4~ <b fis>16 \tieDown a gis fis gis b ais8 | % measure 40; this measure needs fixed
  b2-\3 r8 fis4. |
  r2 <fis-\4>4. <fis-\4>8 | % measure 42
  e4 <gis> fis2 |
  gis8-\4 fis-\4 gis4-\4 <fis-\4>2 |
  fis8 fis fis dis gis4 fis-\4 |
  r8 <e>4 <dis> %{ \parenthesize %} e dis8 | % measure 46; it is not really feasible to play the two g notes, but the counterpoint is there
  r8 <e>4 dis8 <e>2 |
  r8 <e>8 <dis>4 <e>8 e4 dis8 |
  s1 |
  r8 <e>8 <dis>4. e4 dis8 |
  r2 b'4. s8 | % measure 51
  r8 cis b a gis fis16 e fis8 dis |
  s1 | 
  r8 \parenthesize <e>8 <dis>4. e4 dis8 |
  s2 s2 | % measure 55
  r8 \parenthesize <e>8 <dis>4. e4 dis8 |
  s1 |
  r8 \parenthesize <e>8 <dis>4. e4 dis8 |
  s1 | % measure 59
  s1 | 
  s1 | % measure 61
  s1 |
  s1 |
  s1 | % measure 64
  s1 | 
  s1 | % measure 66
  s1 |
  s1 |
  r8 e4 dis8 e8~ \parenthesize e4. | % measure 69
  r8 <e>4 dis8 <e>2 | % MY_NOTES: r8 g,~ g fis r8 d'4. |
  r8 fis4-\4 eis8-2 fis8-\4~ fis4 eis8-2 |
  r8 <fis-\4>4 eis8 <fis-\4>2 |
  r8 <e>4 <dis> e8 fis4 | % measure 73
  s1 |
  fis2. | % measure 75
  s2. | % measure 76
  b2. |
  s2. |
  s2. |
  s2. |
  fis4. fis4. |
  fis4 a8 gis4 fis8 | % measure 82
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  a8-2 a gis-2 cis-3 cis b-0 |
  cis8-2 b-0 cis-2 b-0 cis b |
  cis8 b cis b8. cis16 a8-3-\3~ |
  a8 a-3 gis-2 fis-0 gis2-2
}

%%{ %This is for the original lute fingering
upperVoiceLute = \relative c'' {
  \voiceOne
  \slurUp
  \tieUp 
  \stemUp
  \set stringNumberOrientations = #'(up)
  \set fingeringOrientations = #'(up)
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  d2 b4 d | %measure 1
  c b a2 |
  g4 b a g~ | 
  g8 a fis4 g4. fis8 |
  e8. fis16 g8 fis16 g a8. b16 c8 b16 a | 
  b8. c16 d4 c4 b4 | %measure 6
  a4. a8 g d4 f8 | 
  e4 d c8. d16 e8 fis! |
  g2 fis8 e16 fis g4~ | 
  g4 fis g-\1 d | 
  b d c b | %measure 11
  a4. b8 c d e fis | 
  g a b g c4 b4~ |
  b a <b fis-\2>4. b8~ |
  b4 g a b | 
  c4. c8 b4 a~ | 
  a8 g g4~ g16 g-\2 fis e fis g-\2 a,-\4 fis' | %measure  17; I am keeping the a in top line to keep the rhythm easy to read
  g2 s2 | 
  r2 r4 r8 g8 | 
  a b c4~ c8 c8 b4 | 
  a2 g4 s4 | %measure 21
  r4 r8 a b c d4~ |  %measure 22
  d4 cis d4. c8 | 
  b a g a16 b c4. b8 | 
  <a fis>8 g-\2 a b16 c d4 c | 
  b a g8 b a g |  %measure 26
  b4 a~ a8 g g4~| 
  g16 g-\2 fis e fis g-\2 e fis g4 d~ | %measure 28; this is where the Faber version diverged by a half note's length
  d8 a c4~ c8 d b4~ | 
  b8 a fis4 g4. a8 | 
  b8 a b c d4. d8 |  %measure 31
  e8 d e fis g2 |  %measure 32
  fis8-\2 d fis g a2 |
  g8 c~ c16 c b8~  b16 b a8~ a16 a g8~ |
  g16 g fis e fis g e fis g4. r8 |
  d8 e fis g a8 fis g e | %measure 36
  fis8 a~ a16 e a8~ a16 fis a8~ a16 g fis e |  %measure 37
  fis16 e d cis d e fis d e d e fis g a b g | 
  a16 g-\2 fis e g32-\2 fis g-\2 fis g-\2 fis e fis g2 | %measure 39
  r2 r8 g g g |
  fis8 d8. e16 fis8 r e' e e |  %measure 41
  d8 b~ b16 c d8 c a c4 | %measure 42
  b4. c8~ c b a4 |
  gis8-\2 a-\2~ a16 a-\2 gis8-\2 r8 a a a | %measure 44
  fis8. g16 a4 d,8 g8~ g16 g-\2 fis8 | 
  s1 | %measure 46
  r8 b a c b g a fis |
  s1 |
  r8 d'8 g,-\1 c b g a8 fis |
  g1 |
  r8 e'8-\1 d-\1 c b a16 g a8 fis | %measure 51
  g2 s2 |
  r8 g a16 b c a b8 g a fis |
  g1 | 
  r8 g a16 b c d b8 g a fis | %measure 55
  g1 | 
  r8 g a16 b c a b8 g a fis | %Original Tab: r8 g a16 b c b b8 g a fis |
  g1 | 
  r16 <g>8.~ g2. | %measure 59
  fis16 d d e fis g a b a d, d e fis g a b |
  c c, c d e e e fis g c, c d e fis g a | %measure 61
  b a g fis g a b a b g a b a fis g a |
  g fis g a b a b g a g a b a g fis e |
  fis e fis g fis e d cis d cis d e fis e fis d | %measure 64
  e d e fis g fis g e fis e fis g a g a fis |
  g fis g a b a g fis g a b g a fis g a | %measure 66
  g a b g c b a g fis e d cis d fis e d |
  e d e fis g a b g a g-\2 fis e g32-\2 fis g-\2 fis g-\2 fis g64-\2 fis e fis |
  r8 b,4 a8 b g a8 fis8 | %measure 69
  r8 b'4 a8 b g a4 |
  r8 c,4 b8 c a-\3 b4 |
  r8 c'4 b8 c a b gis-\2 |
  r8 b8. b16 a8. b16 g8 fis d | %measure 73
  a'8~ a16 g fis e d cis d e fis e fis d e8 |
  \time 6/8
  \tempo \markup {
    \concat {
      (
      \smaller \general-align #Y #DOWN \note #"4" #1
      " = "
      \smaller \general-align #Y #DOWN \note #"4." #1
      )
    }
  }
  fis8 e4 fis8 d4 |  %measure 75; start 6/8 time
  d8 fis4 e8 g fis | %measure 76
  g b a b g4 |
  g8 b4 a8 c b |
  c8 g4 g8 c g | 
  g8 a4 g8 e4 |
  fis8 a4 fis8 d e | 
  fis8 a4 d,8 g fis | %measure 82
  b2. |
  b2. |
  a2. | 
  a2. |
  d2. |
  d2. |
  c2. |
  c2. | %measure 90
  b2. | 
  b2. |
  a2. | 
  a2. | %measure 94
  g2. | 
  g2. |
  g8 g f e e d | 
  g8 g4~ g4. |
  g2.~ |
  
  \tempo \markup {
  }
  g2. | %measure 100
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
  r8 <g>4. <g>2 \fermata \bar "|."
}


lowerVoiceLute = \relative c {
  \voiceFour
  \slurDown
  \stemDown
  \tieDown
  \set stringNumberOrientations = #'(down)
  \set fingeringOrientations = #'(down)
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  s1 |
  s1 |
  s1 |
  r1 |
  r1 |
  r1 | %measure 6
  d2 b4 d | %measure 7
  c4 b a c |
  <g>4 b a g |
  d'2 g, |
  r4 g' e g~ | %measure 11
  g4 fis e c |
  b4 g a b |
  c2 b |
  e4. d8 c4 b |
  a2 g4 a |
  b4. c8 d2 | %measure 17
  g,1~ | %measure 18
  g1~ |
  g1 |
  d'4. d8 e8 fis g4 |
  a8 g fis4 g fis-\5 | %measure 22
  e2 d2-\6 |
  g,2 c2 |
  d4. c8 b4 a |
  g4 fis' e2 | %measure 26
  <d fis>2 d |
  d2 g,2 | %measure 28
  fis'2 g |
  d4. d8 e d e fis |
  g2 fis4 d | %measure 31
  a'4.-\4 a8-\4 g2 |
  d'2-\3 c8 a c d |
  s1 |
  r2. g,,8 a |
  b8 c d e fis d e cis | %measure 36
  d4 cis d a |
  d4 b c e |
  d2 g, |
  fis'8 d8. e16 fis8. e8.~ e4 | %measure 40
  d4 b c2 |
  b4 g a2 |
  g'8 e4. f4. f8 | %measure 43
  e4 e <a, e'>2 | %measure 44
  r8 d d d b8. c16 d4 |
  g,2 g4 d'4 |
  g,2. d'4 | %measure 47
  g,2. d'4 | 
  g,8 b c-\6 a g4 d' |
  g,2 g4 d' |
  g,2 g4 d' |
  g,2 g4 d' | %measure 52
  g,8 b a4 g d' | 
  g,2 g4 d' |
  g,8 b a4 g d' | 
  g,2 g4 d' |
  g,8 b a4 g d' | %measure 57
  g,2 g4 d' |
  g,2 g2 | %measure 59, where the 32nd notes begin
  d'2 d |
  c2 c | %measure 61
  g2 g |
  e'2 c |
  d2 b | %measure 64
  c2 d |
  g,2 g'4 d | %measure 66
  e4 c d b |
  c4 e d2 | %Hard to read lute tab, I think this last one is rest; Chose half note length
  g,2. d'4 | %measure 69
  g,2. d'4 |
  g,2. e'4 |
  a,2. e'4 |
  g,2. d'4 | %measure 73
  r8 d4. d4. cis8 | %...or a rest could be notated; r8 d4. d4. cis8; NOTE: If you look at lute tab closely, this d in bass seems to be between the top voice's 'a' and 'g' thus making me suspect this rhythm to be correct.
  d4 cis8 d4 b8 | %measure 75, where the 6/8 begins
  b4 d8 c4 d8 | %measure 76
  g4 fis8 g4 e8 |
  e4 g8 f4 g8 |
  c,4 e8 e4. |
  e4 f8 e4 c8 |
  d4 a8 d4 a8 |
  d4 a8 b g d' |  %measure 82
  g,8 g' g g g g |
  r8 g, g g g g |
  d'8 d cis d d a |
  d8 d a d d c |
  b8 g d'-\6 b g d'-\6 |
  b8 g d'-\6 b g g | %measure 88
  c8 c c c c d |
  e8 e d e e fis |
  g8 g g g, g g |
  g8 g a b b c |
  d8 d cis d d a |
  c8 c a d d c | %measure 94
  b8 g b c-\6 g c-\6 |
  b8 b g g' g f |
  e8 e d c c b |
  e8 e d c c b |
  c8 b c b c b |
  c8 b c b c4 | %measure 100
  g2 <d' g,>2 |
}

upperMiddleVoiceLute = \relative c' {
  \voiceTwo
  \set stringNumberOrientations = #'(down)
  \set fingeringOrientations = #'(down)
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.font-size = #-5
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  s1 | 
  s1 |
  s1 | 
  s1 |
  s1 |
  s1 | %measure 6; imitation begins
  <d a>2 s2 |
  r1 |
  b8 c d e c4 <d b> |
  a8 g a4 g2 |
  s1 | %measure 11
  s1 |
  d'4. g8-\2 e fis g4-\2~ |
  g8 fis e4 e8.-\3 e16-\3 dis4-\3 | %original tab from R. Dowland has a 'c' note on 4th string, but I cannot imagine this to be correct.
  e2 r4 d4 |
  c2 d8. g16-\2 fis8 e |
  d2 d2-\3 | %measure 17
  r4 d e8 fis g4 |
  fis4 e d2 |
  s2 d4-\3 g-\2~ |
  g8 g-\2 fis4 r2 | %measure 21
  s2 d4 a8 d | %measure 22
  e8-\3 fis g4-\2 g8.-\2 g16-\2 fis4 |
  g4.-\2 fis8 e d e4 |
  d2-\3 s8 g4-\2 fis8~ |
  fis8 e4 d8~ d4 cis | %measure 26
  d4. c!8 b4 a8 g |
  <a-\4 d-\3>2-\3 g2 |
  s1 | %measure 29; The Faber diverges here
  s1 | 
  s2 a2 | %measure 31
  s1 |
  s2 e'2 |
  e4 d <e>4 <d>4 |
  <c>2 g8 a b c | 
  s1 | % measure 36
  s1 |
  s1 |
  s1 |  % measure 39
  s1 | % measure 40; this measure needs fixed
  s1 |
  s2 <e>4 <e> | % measure 42
  e4 <e> a,2 |
  s2 <cis>2 |
  s1 |
  r8 <b>8 a <c> b8 \parenthesize g a \parenthesize fis | % measure 46
  r8 <d'>4. <d>2 |
  r8 <d>8 a <c> b \parenthesize g <a> \parenthesize fis |
  r4 r8 fis'8 g4.-\2 fis8 |
  r8 <d>8 <a> c b8 \parenthesize g a \parenthesize fis|
  s2 d'4. s8 | % measure 51
  s1 |
  s1 | 
  r8 g, <a>16 b c a b8 \parenthesize g a \parenthesize fis |
  s1 | % measure 55
  r8 g a16 b c d b8 \parenthesize g a \parenthesize fis |
  s1 |
  r8 g a16 b c a b8 \parenthesize g a \parenthesize fis |
  r16 <b d> g a b c d e d g, g a b c d e | % measure 59
  s1 | 
  s1 | % measure 61
  s1 |
  s1 |
  s1 | % measure 64
  s1 | 
  s1 | % measure 66
  s1 |
  s1 |
  s1 | % measure 69
  r8 <d>4. <d>4. fis8 |
  s1 |
  r8 <e>4. <e>2 |
  r8 <d>4 <d> s4. | % measure 73
  s1 |
  s2. | % measure 75
  s2. | % measure 76
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. | % measure 82
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. | %measure 100
  r8 <d g,>4. <d g,>2 |
}

lowerMiddleVoiceLute = \relative c' {
  \voiceThree
  \set stringNumberOrientations = #'(up)
  \set fingeringOrientations = #'(up)
  \override TextSpanner.bound-details.left.stencil-align-dir-y = #CENTER
  \override TextSpanner.font-size = #-5
  \override TextSpanner.dash-fraction = #0.3
  \override TextSpanner.dash-period = #1
  r1 | 
  r1 |
  r1 | 
  d2-\3 b4 d-\3 |
  c b a2 |
  g4. b8-\4 a4 g~ | %measure 6; imitation begins
  g8 g fis4 g4 a~ |
  a8 g g4 <a-\4 e> r4 |
  d,4 g r2 |
  s1 |
  s1 | %measure 11
  s1 |
  g2 r4 d'4-\3 |
  r2 b2-\4^ \markup \tiny { c\raise #1.25 \teeny \natural "in original." } | %original tab from R. Dowland has a 'c' note on 4th string, but I cannot imagine this to be correct.
  b2 a8 g g4 |
  g8 g fis4 g4 c4 |
  b2 a2-\4 | %measure 17
  <b g>2 s4 g4 |
  a8 b c4. c8 b4 |
  a2 g |
  r4 <d'-\3>4 c4 b4 | %measure 21
  d2 s2 | %measure 22
  s1 |
  s1 |
  s1 |
  s1 | %measure 26
  s1 |
  s1 |
  s1 | %measure 29; The Faber diverges here
  s1 | 
  s1 | %measure 31
  c4. c8 b8 a b c |
  r2 e2 |
  r2 c4 <b>4 |
  <a-\4>2 r2 | 
  r4 a4 d2 | % measure 36
  a1 |
  s1 |
  r2 <d b>8 g, <d' b> g, |  % measure 39
  <d' a>4 \tieUp <d a>4~ <d a>16 \tieDown c b a b d cis8 | % measure 40; this measure needs fixed
  d2-\3 r8 a4. |
  r2 <a-\4>4. <a-\4>8 | % measure 42
  g4 <b> a2 |
  b8-\4 a-\4 b4-\4 <a-\4>2 |
  a8 a a fis b4 a-\4 |
  r8 <g>4 <fis> g fis8 | % measure 46; it is not really feasible to play the two g notes, but the counterpoint is there
  r8 <g>4 fis8 <g>2 |
  r8 <g>8 <fis>4 <g>8 g4 fis8 |
  s1 |
  r8 <g>8 <fis>4. g4 fis8 |
  r2 d'4. s8 | % measure 51
  r8 e d c b a16 g a8 fis |
  s1 | 
  r8 \parenthesize <g>8 <fis>4. g4 fis8 |
  s2 s2 | % measure 55
  r8 \parenthesize <g>8 <fis>4. g4 fis8 |
  s1 |
  r8 \parenthesize <g>8 <fis>4. g4 fis8 |
  s1 | % measure 59
  s1 | 
  s1 | % measure 61
  s1 |
  s1 |
  s1 | % measure 64
  s1 | 
  s1 | % measure 66
  s1 |
  s1 |
  r8 g4 fis8 g8~ \parenthesize g4. | % measure 69
  r8 <g>4 fis8 <g>2 | % MY_NOTES: r8 g,~ g fis r8 d'4. |
  r8 a4-4-\4 gis8 a8-\4~ a4 gis8 |
  r8 <a-\4>4 gis8 <a-\4>2 |
  r8 <g>4 <fis> g8 a4 | % measure 73
  s1 |
  a2. | % measure 75
  s2. | % measure 76
  d2. |
  s2. |
  s2. |
  s2. |
  a4. a4. |
  a4 c8 b4 a8 | % measure 82
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  s2. |
  c8 c b e e d |
  e8 d e d e d |
  e8 d e d8. e16 c8~ |
  c8 c b a b2
}

%}

\score {

  <<
    \new Staff = "Guitar" \with {
      midiInstrument = #"acoustic guitar (nylon)"
      instrumentName = #"Guitar"     
      %\override StringNumber #'stencil = ##f
    } <<
      \global
      \clef "treble"

      \context Voice = "upperVoice" \upperVoice
      \context Voice = "UpperMiddleVoice" \upperMiddleVoice
    
      
      
    >>
%%{
    % tabs are not completely developed
    
    \new Staff = "Guitar Bass" \with {
      midiInstrument = #"acoustic guitar (nylon)"
      %\override StringNumber #'stencil = ##f
    }
      <<
      \global
      \clef "bass"
      
      \context Voice = "lowerMiddleVoice" \lowerMiddleVoice
      \context Voice = "lowerVoice" \lowerVoice
      
      >>
    
    \new TabStaff = "Guitar tabs" \with {
      tablatureFormat = #fret-letter-tablature-format
      stringTunings = \stringTuning <g, c f a d' g'>
      \override ParenthesesItem #'stencil = ##f
     % additionalBassStrings = \stringTuning <c, d, e, fis, g,>
      fretLabels = #'("a" "b" "r" "d" "e" "f" "g" "h" "i" "k")
    } <<
      \clef "tab"
      \global
      \context TabVoice = "upperVoiceLute" \upperVoiceLute
      \context TabVoice = "upperMiddleVoiceLute" \upperMiddleVoiceLute
      \context TabVoice = "lowerMiddleVoiceLute" \lowerMiddleVoiceLute
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
