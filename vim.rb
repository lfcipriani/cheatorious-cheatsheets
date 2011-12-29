# encoding: UTF-8
cheatsheet_for "VIM" do
  
    description "VIM Quick reference card (under the terms of GNU license)"
    author      "Laurent Grégorie", "http://tnerual.eriogerg.free.fr/"
    version     "1.7"
  
    key_separator ""
  
    key :control, "^"
    key :enter  , "<enter>"
    key :esc    , "<esc>"
  
    section "Basic Movement" do
        __ "character left, right, line up, line down", "h", "l", "k", "j"
        __ "word/token left, right"                   , "b", "w"
        __ "end of word/token left, right"            , "ge", "g"
        __ "beginning of previous, next paragraph"    , "{", "}"
        __ "beginning of previous, next sequence"     , "[", "]"
        __ "beginning, middle of line"                , "0", "gm"
        __ "first, last character of line"            , "^", "$"
        __ "line n, default the last, first"          , "<n>G", "<n>ngg"
        __ "percentage n of the file"                 , "<n>%"
        __ "column n of current line"                 , "<n>|"
        __ "match of next brace, bracket, comment, #define", "%"
        __ "line n from start, bottom of window"      , "<n>H", "<n>L"
        __ "middle line of window"                    , "M"
    end
  
    section "Insertion & replace -> insertion mode" do
        __ "insert before, after cursor"                  , "i", "a"
        __ "insert at beginning, end of line"             , "I", "A"
        __ "insert text in ﬁrst column"                   , "gI"
        __ "open a new line below, above the current line", "o", "O"
        __ "replace character under cursor with c"        , "r<c>"
        __ "like r, but without aﬀecting layout"          , "gr<c>"
        __ "replace characters starting at the cursor"    , "R"
        __ "like R, but without aﬀecting layout"          , "gR"
        __ "change text of movement command m"            , "c<m>"
        __ "change current line"                          , "cc", "S"
        __ "change to the end of line"                    , "C"
        __ "change one character and insert"              , "s"
        __ "switch case and advance cursor"               , "~"
        __ "switch case of movement command m"            , "g~<m>"
        __ "lowercase, uppercase text of movement m"      , "gu<m>", "gU<m>"
        __ "shift left, right text of movement m"         , "<m", ">m"
        __ "shift n lines left, right"                    , "n<<", "n>>" 
    end

    section "Deletion" do
        __ "delete character under, before cursor"     , "x", "X"
        __ "delete text of movement command m"         , "d<m>"
        __ "delete current line, to the end of line"   , "dd", "D"
        __ "join current line with next, without space", "J", "gJ"
        __ "delete range r lines"                      , ":rd#{_enter}"
        __ "delete range r lines into register x"      , ":rdx#{_enter}"
    end
    
    section "Insertion mode" do
        # ˆVc ˆVn . . . . . . . . . insert char c literally, decimal value n
        # ˆA . . . . . . . . . . . . . . . . . . . . . . insert previously inserted text
        # ˆ@. . . . . . .same as ˆA and stop insert → command mode
        # ˆRx ˆRˆRx . . . . . . . . . insert content of register x, literally
        # ˆN ˆP . . . . . . . . . . . . . . text completion before, after cursor
        # ˆW . . . . . . . . . . . . . . . . . . . . . . . . . . . delete word before cursor
        # ˆU . . . . . . . . . . delete all inserted character in current line
        # ˆD ˆT . . . . . . . . . . . . . . . . . . . shift left, right one shift width
        # ˆKc1 c2 or c1←c2 . . . . . . . . . . . . . . . . . . enter digraph {c1 , c2 }
        # ˆOc . . . . . . . . . . . . execute c in temporary command mode
        # ˆXˆE ˆXˆY . . . . . . . . . . . . . . . . . . . . . . . . . . . . . scroll up, down
        # 〈esc〉 or ˆ[ . . . . . . . . . abandon edition → command mode
    end
    
    section "Copying" do
        # "x . . . . . . . . . . . . use register x for next delete, yank, put
        # :reg←↪ . . . . . . . . . . . . . . . show the content of all registers
        # :reg x←↪ . . . . . . . . . . . . . . show the content of registers x
        # ym . . . . . . . . . . . yank the text of movement command m
        # yy or Y . . . . . . . . . . . . . . . . . . . yank current line into register
        # p P . . . . . . . . . . . put register after, before cursor position
        # ]p [p . . . . . . . . . . . . . . . . . . . like p, P with indent adjusted
        # gp gP . . . . . . . . . . . like p, P leaving cursor after new text
    end
    
    section "Advanced insertion" do
        # g?m . . . . . . . . . . perform rot13 encoding on movement m
        # nˆA nˆX . . . . . . . . . . . . . . +n, −n to number under cursor
        # gqm . . . . . . . format lines of movement m to ﬁxed width
        # :rce w←↪ . . . . . . . . . . . center lines in range r to width w
        # :rle i←↪ . . . . . . . left align lines in range r with indent i
        # :rri w←↪ . . . . . . right align lines in range r to width w
        # !mc←↪ . ﬁlter lines of movement m through command c
        # n!!c←↪ . . . . . . . . . . . . . . ﬁlter n lines through command c
        # :r!c←↪ . . . . . . . . . ﬁlter range r lines through command c
    end

    section "Visual mode" do
        # v V ˆV . . start/stop highlighting characters, lines, block
        # o . . . exchange cursor position with start of highlighting
        # gv . . . . . . . . . . . start highlighting on previous visual area
        # aw as ap . . . . . . . select a word, a sentence, a paragraph
        # ab aB . . . . . . . . . . . . . . . . . . . select a block ( ), a block { }
    end

    section "Undoing, repeating & registers" do
        # u U . . . . . . undo last command, restore last changed line
        # . ˆR. . . . . . . . . . . . . . . .repeat last changes, redo last undo
        # n. . . . . . . repeat last changes with count replaced by n
        # qc qC . . . .record, append typed characters in register c
        # q . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . stop recording
        # @c . . . . . . . . . . . . . . . . . . . . execute the content of register c
        # @@ . . . . . . . . . . . . . . . . . . . . . . . . repeat previous @ command
        # :@c←↪ . . . . . . . . . . . execute register c as an Ex command
        # :rg/p/c←↪. . . . . . . . . .execute Ex command c on range r
        # ⌊ where pattern p matches
    end

    section "Complex movement" do
        # - + . . . . . . . . . line up, down on ﬁrst non-blank character
        # B W . . . . . . . . . . . . . . . . . . . space-separated word left, right
        # gE E . . . . . . . . . . . end of space-separated word left, right
        # n . . . . . . . . down n − 1 line on ﬁrst non-blank character
        # g0 . . . . . . . . . . . . . . . . . . . . . . . . . . . . beginning of screen line
        # g^ g$ . . . . . . . . . . . . . . . . ﬁrst, last character of screen line
        # gk gj . . . . . . . . . . . . . . . . . . . . . . . . . . . . screen line up, down
        # fc Fc . . . . . . . . . . next, previous occurence of character c
        # tc Tc . . . . . . . . . . . . . before next, previous occurence of c
        # ; , . . . . . . . . . . . . . repeat last fFtT, in opposite direction
        # [[ ]] . . . . . . . . . . . . . . start of section backward, forward
        # [] ][ . . . . . . . . . . . . . . . end of section backward, forward
        # [( ]) . . . . . . . . . . . . . . . . . unclosed (, ) backward, forward
        # [{ ]} . . . . . . . . . . . . . . . . unclosed {, } backward, forward
        # [m ]m . . . . . . . . start of backward, forward Java method
        # [# ]# . unclosed #if, #else, #endif backward, forward
        # [* ]* . . . . . . . . . . start, end of /* */ backward, forward
    end

    section "Search and substitution" do
        # /s←↪ ?s←↪ . . . . . . . . . . . . . search forward, backward for s
        # /s/o←↪ ?s?o←↪ . . . . . search fwd, bwd for s with oﬀset o
        # n or /←↪ . . . . . . . . . . . . . . . . . . . . . repeat forward last search
        # N or ?←↪ . . . . . . . . . . . . . . . . . . . repeat backward last search
        # # * . . . search backward, forward for word under cursor
        # g# g* . . . . . . . . . . . . . same, but also ﬁnd partial matches
        # gd gD . . . local, global deﬁnition of symbol under cursor
        # :rs/f /t/x←↪ . . . . . . . . . . . . . . substitute f by t in range r
        # ⌊ x : g—all occurrences, c—conﬁrm changes
        # :rs x←↪ . . . . . . . . . . . repeat substitution with new r & x
    end

    section "Special characters in search patterns" do
        # . ˆ $ . . . . . . . . . . . any single character, start, end of line
        # \< \> . . . . . . . . . . . . . . . . . . . . . . . . . . . . . start, end of word
        # [c1 -c2 ] . . . . . . . . . . . . . . a single character in range c1 ..c2
        # [ˆc1 -c2 ]. . . . . . . . . . . . . . . .a single character not in range
        # \i \k \I \K . . . . . . . an identiﬁer, keyword; excl. digits
        # \f \p \F \P . . a ﬁle name, printable char.; excl. digits
        # \s \S . . . . . . . . . . . . . . . . a white space, a non-white space
        # \e \t \r \b . . . . . . . . . . . . . . . . . . . 〈esc〉, 〈tab〉, 〈←↪〉, 〈←〉
        # \= * \+ . . . . match 0..1, 0..∞, 1..∞ of preceding atoms
        # \| . . . . . . . . . . . . . . . . . . . . . . . separate two branches (≡ or )
        # \( \) . . . . . . . . . . . . . . . . . . . . group patterns into an atom
        # \& \n . . . . . . . the whole matched pattern, nth () group
        # \u \l . . . . . . . . . . . next character made upper, lowercase
        # \c \C . . . . . . . . . . . . . . ignore, match case on next pattern
    end

    section "Offsets in search commands" do
        # n or +n . . . . . . . . . . . . . . . . . . . n line downward in column 1
        # -n . . . . . . . . . . . . . . . . . . . . . . . . . n line upward in column 1
        # e+n e-n . . . . . . . n characters right, left to end of match
        # s+n s-n . . . . . . n characters right, left to start of match
        # ;sc . . . . . . . . . . . . . . . . . . execute search command sc next
    end

    section "Marks and motions" do
        # mc . . . . . . . . . mark current position with mark c ∈ [a..Z]
        # ‘c ‘C . . . . . . . . . . . go to mark c in current, C in any ﬁle
        # ‘0..9 . . . . . . . . . . . . . . . . . . . . . . . . . . . go to last exit position
        # ‘‘ ‘" . . . . . . . . . . go to position before jump, at last edit
        # ‘[ ‘] . . . . . go to start, end of previously operated text
        # :marks←↪ . . . . . . . . . . . . . . . . . . . print the active marks list
        # :jumps←↪ . . . . . . . . . . . . . . . . . . . . . . . . . . print the jump list
        # nˆO . . . . . . . . . . . . . . . go to nth older position in jump list
        # nˆI . . . . . . . . . . . . . . go to nth newer position in jump list
    end

    section "Key mappings & abbreviations" do
        # :map c e←↪. . . . . . .map c ↦→ e in normal & visual mode
        # :map! c e←↪ . . . . map c ↦→ e in insert & cmd-line mode
        # :unmap c←↪ :unmap! c←↪ . . . . . . . . . . remove mapping c
        # :mk f ←↪ . . . write current mappings, settings... to ﬁle f
        # :ab c e←↪ . . . . . . . . . . . . . . . . . add abbreviation for c ↦→ e
        # :ab c←↪ . . . . . . . . . . . . show abbreviations starting with c
        # :una c←↪ . . . . . . . . . . . . . . . . . . . . . . . remove abbreviation c
    end

    section "Tags" do
        # :ta t←↪ . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . jump to tag t
        # :nta←↪ . . . . . . . . . . . . . . . . . . jump to nth newer tag in list
        # ˆ] ˆT . . . jump to the tag under cursor, return from tag
        # :ts t←↪ . . . . list matching tags and select one for jump
        # :tj t←↪ . . jump to tag or select one if multiple matches
        # :tags←↪ . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . print tag list
        # :npo←↪ :nˆT←↪ . . . . . . jump back from, to nth older tag
        # :tl←↪ . . . . . . . . . . . . . . . . . . . . . . jump to last matching tag
        # ˆW} :pt t←↪ . . . . . . . . . . . preview tag under cursor, tag t
        # ˆW] . . . . . . . . . . . split window and show tag under cursor
        # ˆWz or :pc←↪ . . . . . . . . . . . . . . . . . close tag preview window
    end

    section "Scrolling & multi-windowing" do
        # ˆE ˆY . . . . . . . . . . . . . . . . . . . . . . . . . . . . . scroll line up, down
        # ˆD ˆU . . . . . . . . . . . . . . . . . . . . . . scroll half a page up, down
        # ˆF ˆB . . . . . . . . . . . . . . . . . . . . . . . . . . . . scroll page up, down
        # zt or z←↪ . . . . . . . . . . . . . set current line at top of window
        # zz or z. . . . . . . . . . . . set current line at center of window
        # zb or z- . . . . . . . . . . . set current line at bottom of window
        # zh zl . . . . . . . . . . . . scroll one character to the right, left
        # zH zL . . . . . . . . . . . . . scroll half a screen to the right, left
        # ˆWs or :split←↪ . . . . . . . . . . . . . . . . . . . split window in two
        # ˆWn or :new←↪. . . . . . . . . . . . . . . .create new empty window
        # ˆWo or :on←↪ . . . . . . . make current window one on screen
        # ˆWj ˆWk . . . . . . . . . . . . . . . . . move to window below, above
        # ˆWw ˆWˆW. . . . . . . . .move to window below, above (wrap)
    end

    section "Ex commands (#{_enter})" do
        # :e f . . . . . . . edit ﬁle f , unless changes have been made
        # :e! f . . . . edit ﬁle f always (by default reload current)
        # :wn :wN . . . . . . . . . write ﬁle and edit next, previous one
        # :n :N . . . . . . . . . . . . . . . . . . . . edit next, previous ﬁle in list
        # :rw . . . . . . . . . . . . . . . . . . . . . . . write range r to current ﬁle
        # :rw f . . . . . . . . . . . . . . . . . . . . . . . . . . .write range r to ﬁle f
        # :rw> . . . . . . . . . . . . . . . . . . . . . . . append range r to ﬁle f
        # >f
        # :q :q! . . . . . quit and conﬁrm, quit and discard changes
        # :wq or :x or ZZ . . . . . . . . . . . . . write to current ﬁle and exit
        # 〈up〉 〈down〉 . . . . recall commands starting with current
        # :r f . . . . . . . . . . . . . . insert content of ﬁle f below cursor
        # :r! c . . . . . . . . insert output of command c below cursor
        # :args . . . . . . . . . . . . . . . . . . . . . . . display the argument list
        # :rco a :rm a . . . . . . . . . copy, move range r below line a
    end

    section "Ex ranges" do
        # , ; . . . . . . separates two lines numbers, set to ﬁrst line
        # n . . . . . . . . . . . . . . . . . . . . . . . . . . . an absolute line number n
        # . $ . . . . . . . . . . . . . . . . the current line, the last line in ﬁle
        # % * . . . . . . . . . . . . . . . . . . . . . . . . . . . . . entire ﬁle, visual area
        # ’t . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . position of mark t
        # /p/ ?p? . . . . . . . the next, previous line where p matches
        # +n -n . . . . . . . . . . . +n, −n to the preceding line number
    end

    section "Folding" do
        # zfm . . . . . . . . . . . . . . . . . . . . . . . create fold of movement m
        # :rfo. . . . . . . . . . . . . . . . . . . . . . . . . . . .create fold for range r
        # zd zE . . . . . . . . . . . . . . delete fold at cursor, all in window
        # zo zc zO zC . . . . . . . . . . open, close one fold; recursively
        # [z ]z . . . . . . . . . . move to start, end of current open fold
        # zj zk . . . . . . . . move down, up to start, end of next fold
    end

    section "Miscellaneous" do
        # :sh←↪ :!c←↪ . . . start shell, execute command c in shell
        # K . . . . . . . . . . . . . . . lookup keyword under cursor with man
        # :make←↪ . . . . . . start make, read errors and jump to ﬁrst
        # :cn←↪ :cp←↪ . . . . . . . . . . display the next, previous error
        # :cl←↪ :cf←↪ . . . . . . . list all errors, read errors from ﬁle
        # ˆL ˆG . . . . . . . redraw screen, show ﬁlename and position
        # gˆG . . . show cursor column, line, and character position
        # ga . . . . . . . . . show ASCII value of character under cursor
        # gf. . . . . . . . . . . . .open ﬁle which ﬁlename is under cursor
        # :redir>f ←↪ . . . . . . . . . . . . . . . . . . redirect output to ﬁle f
        # :mkview [f ] . . . . . . . . . save view conﬁguration [to ﬁle f ]
        # :loadview [f ] . . . . load view conﬁguration [from ﬁle f ]
        # ˆ@ ˆK ˆ \ Fn ˆFn . . . . . . . . . . . . . . . . . . . . unmapped keys
    end
  
end