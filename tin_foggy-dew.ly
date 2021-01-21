\version "2.20.0"

#(set! paper-alist (cons '("snippet" . (cons (* 210 mm) (* 297 mm))) paper-alist))
\paper {
  #(set-paper-size "snippet")
  indent = 0
  tagline = ##t
 system-system-spacing.basic-distance = 20
    % add space between composer/opus markup and first staff
  markup-system-spacing.padding = #3
  % add a little space between composer and opus
  markup-markup-spacing.padding = #0
}

tinWhistleFingerings =
#'((0 . (one two three four five six))  
   (2 . (one two three four five))
   (4 . (one two three four))
   (5 . (one two three))
   (7 . (one two))
   (9 . (one))
   (10 . (two three))
   (11 . ())
   (12 . (two three four five six))
   (14 . (one two three four five))
   (16 . (one two three four))
   (17 . (one two three))
   (19 . (one two))
   (21 . (two three))
   (22 . (one))
   (23 . ())
   (24 . (one two three four five six)))


tinWhistle =
#(define-music-function (tone music)
                        (ly:pitch? ly:music?)
   #{
     <<
       \new Voice { $music }
       \new Dynamics = "diagramme" \with {
                  \override VerticalAxisGroup.nonstaff-relatedstaff-spacing
           = #'((basic-distance . 0)
                (minimum-distance . 0)
                (padding . 1)
                (stretchability . 0))
       } 
       {
         #(music-map
            (lambda (m)
              (if (music-is-of-type? m 'note-event)
                         ; Hauteur de la note jouée, en demi-tons depuis le do médian.
                  (let* ((base-pitch-semitones (ly:pitch-semitones (ly:music-property m 'pitch)))
                         ; Ramenée par rapport à la note donnée (on lui ajoute 12 car en
                         ; LilyPond, un simple `c` est un do une octave en-dessous du do
                         ; central, donc une hauteur de -12.
                         (transposed-pitch-semitones
                            (- base-pitch-semitones
                               (+ 12 (ly:pitch-semitones tone))))
                         ; Doigté à utiliser, vaut #f s'il n'est pas trouvé dans la liste.
                         (fingerings (assoc-get
                                       transposed-pitch-semitones
                                       tinWhistleFingerings)))
                    (if (not fingerings)
                        (ly:music-warning m "doigté de tin whistle non trouvé"))
                    (make-music
                      'SkipEvent
                      'duration
                      (ly:music-property m 'duration)
                      'articulations
                      (list
                        (make-music
                          'TextScriptEvent
                          'text
                          #{
                            \markup
                            \center-column {
                              \override #'(size . 0.45)
                              % Dans le cas où le doigté n'est pas trouvé, mettre des
                              % trous ouverts (un avertissement est levé plus haut).
                              \woodwind-diagram
                                #'tin-whistle
                                #`((cc . ,(or fingerings '()))
                                   (lh . ())
                                   (rh . ()))
                              % À partir d'une octave au-dessus du ton du Tin whistle,
                              % rajoute le signe plus sous le diagramme.                                
                              \vspace #-0.6                                
                              #(if (>= transposed-pitch-semitones 12)
                                   "+"
                                   #{ \markup \with-outline "+" \null #})                                
                          }
                        #}))))
                  m))
            music)
       }
     >>
   #})

% HEADER page de couverture
\header {
  title = "Foggy dew"
}
%==== FIN DES VARIABLES ==========

foggydew = \relative c' {
  \time 4/4
  \clef "treble_8"
  \key  e \minor
  \partial 4 b8 d
  e4 d8 b e4 d8 b
  a4. b8 d,4 e8 fis
  g[ b] a g  e4 d
  e2 r4 g'8 fis \break
  e4 d8 b e4 d8 b
  a4. b8 d,4 e8 fis
  g[ b] a g  e4 d
  e2 r4 e8 fis \break
  g4. b8 d4 c8 b
  a4 g8 a b4 g8 a
  b8 d g fis e d b d 
  e2.\fermata  g8 fis \break
  e4 d8 b e4 d8 b
  a4. b8 d,4 e8 fis 
  g8[ b] a g e4 d
  e2. r4
}

accords_foggy = \chordmode 
{
 s4 e1:m d e2:m d e1:m
 e:m d e2:m d e1:m
 g d2 g g1 c
 e:m d c2 c e:m
} 

\score{<<
  \context ChordNames {\accords_foggy}
  \context Voice {\tinWhistle d, \foggydew}>>
}

