\version "2.20.0"
%======Sanz_1
\header {
  title = "Air de danse"
  subsubtitle = " Partie A "
  composer = "G. Sanz"
  arranger = "Tablature guitare"
  piece = "  "
  tagline = " "
}

#(set! paper-alist (cons '("format" . (cons (* 20 cm) (* 15 cm))) paper-alist))

%--- gestion couleur
#(define (override-color-for-all-grobs color)
   (lambda (context)
     (let loop ((x all-grob-descriptions))
       (if (not (null? x))
           (let ((grob-name (caar x)))
             (ly:context-pushpop-property context grob-name 'color color)
             (loop (cdr x)))))))

couleur = {\applyContext #(override-color-for-all-grobs (x11-color 'blue))
}
pascouleur = {\applyContext #(override-color-for-all-grobs (x11-color 'black))
}
%---------------

global= {
  \time 4/4
  \clef "treble_8"
  \key d \major}

%----- Air de danse (Sanz)
pouce = \relative c {
  \voiceTwo
  d1 d1 d2 fis4 e4 d1 \break
  d1 d1 d4. e8 fis4 gis4 a2 a,2 
}

doigts = \relative c' {
  \voiceOne	
  d4.-2 cis8-1 d4-2 e4\2-4 
  fis8 g fis e d4 e4
  fis4 d a' g
  fis8 g fis e d2 
  d4. cis8 d4 e4 
  fis8 g fis e d4 e4
  fis1 <cis e>2 s2 }

\bookpart{
  \score{<<
    \new StaffGroup = "classique et Tab"  << 
      \new Staff = "guitare traditionnelle" <<
        \global
        \context Voice = mel {\doigts }
        \context Voice = "le pouce" \pouce
      >>
      \new TabStaff = "guitare TAB" <<
        \tabFullNotation
        \context TabVoice = "le pouce" \pouce
        \context TabVoice = "les doigts" \doigts
      >>
    >>
         >>
         \layout {
           #(set-default-paper-size "format")
           indent = 0
           \context {
             \RhythmicStaff
             \remove "Time_signature_engraver"
             \remove "Clef_engraver"
             \override BarLine.transparent = ##t
             \override StaffSymbol.line-count = #0
           }
           \context {
             \StaffGroup
             \override StaffGrouper.staff-staff-spacing =
             #'((basic-distance . 5)
                (minimum-distance . 3)
                (padding . 0))
           }
         }
         \midi{}  
  }
}

%============= Sanz Phrase 1
pouce = \relative c {
  \voiceTwo
  %\applyContext #(override-color-for-all-grobs (x11-color 'blue))
  \couleur
  d1 d1 
  \hideNotes d2  fis4 e4 d1 \break
  d1 d1 d4. e8 fis4 gis4 a2 a,2 
}

doigts = \relative c' {
  \voiceOne	
  %\melodie
  %\applyContext #(override-color-for-all-grobs (x11-color 'blue))
  \couleur
  d4.( cis8 d4 \tweak color #red e4\2
  fis8   g fis \tweak color #red e\2 d4)
  \hideNotes e4
  fis4 d a' g
  fis8 g fis e d2 
  d4. cis8 d4 e4 
  fis8 g fis e d4 e4
  fis1 <cis e>2 s2 
}
%---------------------------------------
\bookpart{
  \score{<<
    \new StaffGroup = "classique et Tab"  << 
      \new Staff = "guitare traditionnelle" <<
        \global
        \context Voice = mel {\doigts }
        \context Voice = "le pouce" \pouce
      >>
      \new TabStaff = "guitare TAB" <<
        \tabFullNotation
        \context TabVoice = "le pouce" \pouce
        \context TabVoice = "les doigts" \doigts
      >>
    >>
         >>
         \layout {
           #(set-default-paper-size "format")
           indent = 0
           \context {
             \RhythmicStaff
             \remove "Time_signature_engraver"
             \remove "Clef_engraver"
             \override BarLine.transparent = ##t
             \override StaffSymbol.line-count = #0
           }
           \context {
             \StaffGroup
             \override StaffGrouper.staff-staff-spacing =
             #'((basic-distance . 5)
                (minimum-distance . 3)
                (padding . 0))
           }
         }
         \midi{}  
  }
  %----- note
  \markup{\line{"jouer le mi sur la corde 2"}}
}

%===========Sanz Phrase 2
pouce = \relative c {
  \voiceTwo
  d1 d1 
  \applyContext #(override-color-for-all-grobs (x11-color 'blue))
  d2  fis4-3 e4-1 d1 \break
  \hideNotes
  d1 d1 d4. e8 fis4 gis4 a2 a,2 
}

doigts = \relative c' {
  \voiceOne	
  d4.( cis8 d4 e4\2
  fis8   g fis e\2 d4)
  \applyContext #(override-color-for-all-grobs (x11-color 'blue))
  e4 (
  fis4 d a' g
  fis8 g fis \tweak color #red  e\2 d2)
  \hideNotes
  d4. cis8 d4 e4 
  fis8 g fis e d4 e4
  fis1 <cis e>2 s2 
}

\bookpart{
  \score{<<
    \new StaffGroup = "classique et Tab"  << 
      \new Staff = "guitare traditionnelle" <<
        \global
        \context Voice = mel {\doigts }
        \context Voice = "le pouce" \pouce
      >>
      %}
      \new TabStaff = "guitare TAB" <<
        \tabFullNotation
        \context TabVoice = "le pouce" \pouce
        \context TabVoice = "les doigts" \doigts
      >>
    >>
         >>
         \layout {
           #(set-default-paper-size "format")
           indent = 0
           \context {
             \RhythmicStaff
             \remove "Time_signature_engraver"
             \remove "Clef_engraver"
             \override BarLine.transparent = ##t
             \override StaffSymbol.line-count = #0
           }
           \context {
             \StaffGroup
             \override StaffGrouper.staff-staff-spacing =
             #'((basic-distance . 5)
                (minimum-distance . 3)
                (padding . 0))
           }
         }
         \midi{}  
  }
}

%===== Sanz Phrase 3
pouce = \relative c {
  \voiceTwo
  d1 d1 
  d2  fis4 e4 d1 \break
  \applyContext #(override-color-for-all-grobs (x11-color 'blue))
  d1 d1 
  \hideNotes
  d4. e8 fis4 gis4 a2 a,2 
}

doigts = \relative c' {
  \voiceOne	
  d4.( cis8 d4 e4\2
  fis8   g fis e\2 d4)
  e4 (
  fis4 d a' g
  fis8 g fis e\2 d2)
  \applyContext #(override-color-for-all-grobs (x11-color 'blue))
  d4.( cis8 d4 \tweak color #red e4\2
  fis8 g fis \tweak color #red e\2 d4 ) e4
  \hideNotes
  fis1 <cis e>2 s2 
}

\bookpart{
  \score{<<
    \new StaffGroup = "classique et Tab"  << 
      \new Staff = "guitare traditionnelle" <<
        \global
        \context Voice = mel {\doigts}
        \context Voice = "le pouce" \pouce
      >>
      %}
      \new TabStaff = "guitare TAB" <<
        \tabFullNotation
        \context TabVoice = "le pouce" \pouce
        \context TabVoice = "les doigts" \doigts
      >>
    >>
         >>
         \layout {
           #(set-default-paper-size "format")
           indent = 0
           \context {
             \RhythmicStaff
             \remove "Time_signature_engraver"
             \remove "Clef_engraver"
             \override BarLine.transparent = ##t
             \override StaffSymbol.line-count = #0
           }
           \context {
             \StaffGroup
             \override StaffGrouper.staff-staff-spacing =
             #'((basic-distance . 5)
                (minimum-distance . 3)
                (padding . 0))
           }
         }
         \midi{}  
  }
  \markup{\line{"répétition de la phrase 1"}}
}


%=========Sanz Phrase 4
pouce = \relative c {
  \voiceTwo
  d1 d1 
  d2  fis4 e4 d1 \break
  d1 d1 
  \applyContext #(override-color-for-all-grobs (x11-color 'blue))
  d4. e8 fis4 gis4 
  a2  a,2 
}

doigts = \relative c' {
  \voiceOne	
  %\melodie
  d4.( cis8 d4 e4\2
  fis8   g fis e\2 d4)
  e4 (
  fis4 d a' g
  fis8 g fis e d2)
  d4.( cis8 d4 e4 
  fis8 g fis e d4 ) e4
  \applyContext #(override-color-for-all-grobs (x11-color 'blue))
  fis1 <cis e>2 s2 
}


\bookpart{
  \score{<<
    \new StaffGroup = "classique et Tab"  << 
      \new Staff = "guitare traditionnelle" <<
        \global
        \context Voice = mel {\doigts }
        \context Voice = "le pouce" \pouce
      >>
      \new TabStaff = "guitare TAB" <<
        \tabFullNotation
        \context TabVoice = "le pouce" \pouce
        \context TabVoice = "les doigts" \doigts
      >>
    >>
         >>
         \layout {
           #(set-default-paper-size "format")
           indent = 0
           \context {
             \RhythmicStaff
             \remove "Time_signature_engraver"
             \remove "Clef_engraver"
             \override BarLine.transparent = ##t
             \override StaffSymbol.line-count = #0
           }
           \context {
             \StaffGroup
             \override StaffGrouper.staff-staff-spacing =
             #'((basic-distance . 5)
                (minimum-distance . 3)
                (padding . 0))
           }
         }
         \midi{}  
}}

%===== partie A complète Sanz_1
pouce = \relative c {
  \voiceTwo
  d1 d1 d2 fis4 e4 d1 \break
  d1 d1 d4. e8 fis4 gis4 a2 a,2 
}

doigts = \relative c' {
  \voiceOne	
  d4.-2 cis8-1 d4-2 e4\2-4 
  fis8 g fis e d4 e4
  fis4 d a' g
  fis8 g fis e d2 
  d4. cis8 d4 e4 
  fis8 g fis e d4 e4
  fis1 <cis e>2 s2 }

\bookpart{
  \score{<<
    \new StaffGroup = "classique et Tab"  << 
      \new Staff = "guitare traditionnelle" <<
        \global
        \context Voice = mel {\doigts }
        \context Voice = "le pouce" \pouce
      >>
      \new TabStaff = "guitare TAB" <<
        \tabFullNotation
        \context TabVoice = "le pouce" \pouce
        \context TabVoice = "les doigts" 
        \doigts
      >>
    >>
         >>
         \layout {
           #(set-default-paper-size "format")
           indent = 0
           \context {
             \RhythmicStaff
             \remove "Time_signature_engraver"
             \remove "Clef_engraver"
             \override BarLine.transparent = ##t
             \override StaffSymbol.line-count = #0
           }
           \context {
             \StaffGroup
             \override StaffGrouper.staff-staff-spacing =
             #'((basic-distance . 5)
                (minimum-distance . 3)
                (padding . 0))
           }
         }
         \midi{}  
}}

%===== sans tablature
pouce = \relative c {
  \voiceTwo
  d1 d1 d2 fis4 e4 d1 \break
  d1 d1 d4. e8 fis4 gis4 a2 a,2 
}

doigts = \relative c' {
  \voiceOne	
  d4.-2 cis8-1 d4-2 e4\2-4 
  fis8 g fis e\2 d4 e4
  fis4 d a' g
  fis8 g fis e d2 
  d4. cis8 d4 e4\2 
  fis8 g fis e\2 d4 e4
  fis1 <cis e>2 s2 }

\bookpart{
  \score{<<
    \new StaffGroup = "classique et Tab"  << 
      \new Staff = "guitare traditionnelle" <<
        \global
        \context Voice = mel {\doigts }
        \context Voice = "le pouce" \pouce
      >>
    >>
         >>
         \layout {
           #(set-default-paper-size "format")
           indent = 0
           \context {
             \RhythmicStaff
             \remove "Time_signature_engraver"
             \remove "Clef_engraver"
             \override BarLine.transparent = ##t
             \override StaffSymbol.line-count = #0
           }
           \context {
             \StaffGroup
             \override StaffGrouper.staff-staff-spacing =
             #'((basic-distance . 5)
                (minimum-distance . 3)
                (padding . 0))
           }
         }
         \midi{}  
  }
}