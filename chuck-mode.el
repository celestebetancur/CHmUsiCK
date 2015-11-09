;;; ChucK major mode for editing ChucK code and hopefully in the
;;; future also updating a running ChucK engine
;;;
;;; (c) 2004 Mikael Johansson

;;; revised by Graham Coleman 2006
;;; TODO
;;; 2. revisit running the process
;;; 3. maybe display the running stats in a subwindow
;;; 4. remove req for saving the buffer, use temps
;;; 5. get remove to accept several shred numbers
;;; ->
;;; inf. build in audicle style revisions

;; mode hook for user defined actions
(defvar chuck-mode-hook nil)

;;; CHANGE THIS to something that fits your system!!!
(defvar chuck-exec "chuck")

;;; CHANGE THIS to list of commonly required classes
(defvar chuck-lib (list "Library.ck")) 

;; call chuck with some arguments
(defun run-chuck (ch-action &rest args)
  (apply 'call-process chuck-exec 
	 nil ;;no infile
	 ;;0 ;;discard output and return nil immediately
	 "*ChucK*" ;;don't throw away output just yet
	 nil ;;do not redisplay
	 ch-action ;;the action 
	 args)) ;;apply spreads the args

;; make a temp ck dir if you need it
(defun make-ck-dir ()
  (if (not (file-exists-p ".ck")) ;;if no dir
      (make-directory ".ck" nil))) ;;create it

;; save into a temp file and return filename, under construction
(defun save-temp ()
  (make-ck-dir)
  (let ((bname (format ".ck/temp.ck")))
    (write-region (point-min) (point-max) ;;write the whole buffer
		  bname ;;temp name
		  nil nil nil) ;;no append, mustbenew, or visit
    bname)) ;;return the filename

;; ChucK as an internal listener does not work well. Run it externally
;; and control it internally.
;(defun run-chuck ()
;  "Start a ChucK listener"
;  (interactive)
;  (start-process "ChucK" "*ChucK*" chuck-exec "--loop"))
;(defun kill-chuck ()
;  "Kills a running ChucK listener"
;  (interactive)
;  (call-process chuck-exec nil 0 "--kill"))

;;try running chuck as an internal listener
(defun start-chuck ()
  "Start a ChucK listener"
  (interactive)
  (let ((cproc 
	 (start-process "ChucK" "*ChucK*" chuck-exec "--loop")))
    ;;(set-process-coding-system cproc 
    ;;			       (keyboard-coding-system)
    ;;			       (terminal-coding-system))
    ;;(setq chuck-proc cproc)
    ;;(process-send-eof cproc)
    ;;(process-kill-without-query cproc)
    ;;(set-process-filter cproc 'chuck-insert-filter)
    ;;(set-process-sentinel cproc nil)) ;;the null sentinel
    )
  (switch-to-buffer-other-window "*ChucK*") ;;open in bottom
  )

;;filter
(defun chuck-insert-filter (proc string)
  (with-current-buffer (process-buffer proc)
    (let ((moving (= (point) (process-mark proc))))
      (save-excursion
	;; Insert the text, advancing the process marker.
	(goto-char (process-mark proc))
	(insert string)
	(set-marker (process-mark proc) (point)))
      (if moving (goto-char (process-mark proc))))))

(defun chuck-add-code () 
  "Add buffer to running ChucK"
  (interactive)
  (if (buffer-modified-p)
      (message "You need to save first")
    (run-chuck "--add" buffer-file-name)))

(defun chuck-add-code-nosave ()
  "Add buffer to running ChucK w/o requiring save"
  (interactive)
  (run-chuck "--add" (save-temp)))

(defun chuck-add-library ()
  "Add commonly required class files."
  (interactive)
  (dolist (f chuck-lib)
    (run-chuck "--add" f)))

(defun chuck-remove-code ()
  "Remove code snippet from running ChucK"
  (interactive)
  (run-chuck "--remove" 
	     (read-string "Remove which shred? ")))

(defun chuck-replace-code ()
  "Replace code snippet in running ChucK with buffer"
  (interactive)
  (if (buffer-modified-p)
      (message "You need to save first")
    (run-chuck "--replace"
	       (read-string "Replace which shred? ")
	       buffer-file-name)))

(defun chuck-replace-code-nosave ()
  "Replace shred in running ChucK without saving"
  (interactive)
  (run-chuck "--replace"
	     (read-string "Replace which shred? ")
	     (save-temp)))

(defun chuck-status ()
  "Tell ChucK to report status"
  (interactive)
  (run-chuck "--status"))

(defun chuck-remove-all ()
  "Remove all shreds"
  (interactive)
  (run-chuck "--removeall"))

;; keymap for ChucK mode
(defvar chuck-mode-map
  (let ((chuck-mode-map (make-keymap)))
    (define-key chuck-mode-map (kbd "<RET>") 'newline-and-indent)    
                                                 
    (define-key chuck-mode-map [menu-bar chuck]  
      (cons "ChucK" (make-sparse-keymap "ChucK")))    

    ;;TODO find a key binding for this
    (define-key chuck-mode-map [menu-bar chuck chuck-remove-all]
      '("Remove all shreds from running ChucK" . chuck-remove-all))

    (define-key chuck-mode-map "\M-l" 'chuck-add-library)
    (define-key chuck-mode-map [menu-bar chuck chuck-add-library]
      '("Add library to running ChucK" . chuck-add-library))
                                                 
    (define-key chuck-mode-map "\M-s" 'chuck-status)  
    ;; M-s is normally undefined                 
    (define-key chuck-mode-map [menu-bar chuck chuck-status]    
      '("Query ChucK status" . chuck-status))    
                                                 
    (define-key chuck-mode-map "\M-r" 'chuck-replace-code) 
    ;; M-r normally move-to-window-line          
    (define-key chuck-mode-map [menu-bar chuck chuck-replace-code]   
      '("Replace code in running ChucK with buffer" . chuck-replace-code))
                                                 
    (define-key chuck-mode-map "\M-e" 'chuck-remove-code)  
    ;; M-e is normally sentence-end              
    (define-key chuck-mode-map [menu-bar chuck chuck-remove-code]    
      '("Remove code from running ChucK" . chuck-remove-code))  
                                                 
    (define-key chuck-mode-map "\M-a" 'chuck-add-code)
    ;; M-e is normally forward-sentence          
    (define-key chuck-mode-map [menu-bar chuck chuck-add-code]  
      '("Add buffer to running ChucK" . chuck-add-code))

    chuck-mode-map)
  "Keymap for ChucK major mode")


;; Filename binding
(add-to-list 'auto-mode-alist '("\\.ck\\'" . chuck-mode))

;; Syntax highlighting
(defconst chuck-font-lock-keywords-1
  (list
   (cons (concat "\\<for\\>\\|" "\\<while\\>\\|" "\\<break\\>\\|" "\\<if\\>\\|"
	    "\\<else\\>\\|" "\\<then\\>\\|" "\\<NULL\\>\\|" "\\<null\\>\\|"
	    "\\<return\\>\\|" "\\<do\\>" "\\<repeat\\>\\|") 'font-lock-keyword-face)
   (cons (concat "\\<until\\>\\|" "\\<before\\>\\|" "\\<after\\>\\|"
	    "\\<at\\>\\|" "\\<function\\>\\|" "\\<fun\\>\\|" "\\<new\\>\\|"
	    "\\<class\\>\\|" "\\<extends\\>\\|" "\\<implements\\>\\|"
	    "\\<until\\>\\|" "\\<before\\>\\|" "\\<after\\>\\|" "\\<at\\>\\|"
	    "\\<function\\>\\|" "\\<fun\\>\\|" "\\<new\\>\\|" "\\<class\\>\\|"
	    "\\<extends\\>\\|" "\\<implements\\>\\|" "\\<public\\>\\|"
	    "\\<protected\\>\\|" "\\<private\\>\\|" "\\<static\\>\\|"
	    "\\<const\\>\\|" "\\<spork\\>") 'font-lock-keyword-face)
   (cons (concat "\\<=>\\>\\|" "\\<=<\\>\\|" "\\<!=>\\>\\|" "\\<->\\>\\|"
	    "\\<<-\\>\\|" "\\<+->\\>\\|" "\\<-->\\>\\|" "\\<*->\\>\\|"
	    "\\</->\\>\\|" "\\<&->\\>\\|" "\\<|->\\>\\|" "\\<^->\\>\\|"
	    "\\<>>->\\>\\|" "\\<<<->\\>\\|" "\\<%->\\>\\|" "\\<@=>\\>\\|"
	    "\\<+=>\\>\\|" "\\<-=>\\>\\|" "\\<*=>\\>\\|" "\\</=>\\>\\|"
	    "\\<&=>\\>\\|" "\\<|=>\\>\\|" "\\<^=>\\>\\|" "\\<>>=>\\>\\|"
	    "\\<<<=>\\>\\|" "\\<%=>\\>") 'font-lock-builtin-face)
   (cons (concat "\\<Std\\>\\|" "\\<abs\\>\\|" "\\<fabs\\>\\|"
	    "\\<rand\\>\\|" "\\<randf\\>\\|" "\\<rand2f\\>\\|" "\\<randi\\>\\|" "\\<rand2\\>\\|"
	    "\\<sgn\\>\\|" "\\<system\\>\\|" "\\<aoti\\>\\|" "\\<atof\\>\\|"
	    "\\<getenv\\>\\|" "\\<setenv\\>\\|" "\\<Math\\>\\|" "\\<sin\\>\\|"
	    "\\<cos\\>\\|" "\\<tan\\>\\|" "\\<asin\\>\\|" "\\<acos\\>\\|"
	    "\\<atan\\>\\|" "\\<atan2\\>\\|" "\\<sinh\\>\\|" "\\<cosh\\>\\|"
	    "\\<tanh\\>\\|" "\\<hypot\\>\\|" "\\<pow\\>\\|"
	    "\\<sqrt\\>\\|" "\\<exp\\>\\|" "\\<log\\>\\|" "\\<log2\\>\\|"
	    "\\<log10\\>\\|" "\\<floor\\>\\|" "\\<ceil\\>\\|" "\\<round\\>\\|"
	    "\\<trunc\\>\\|" "\\<fmod\\>\\|" "\\<remainder\\>\\|" "\\<min\\>\\|"
	    "\\<max\\>\\|" "\\<nextpow2\\>\\|" "\\<pi\\>\\|" "\\<twopi\\>\\|"
	    "\\<math.e\\>\\|" "\\<sin\\>\\|" "\\<cos\\>\\|"
	    "\\<tan\\>\\|" "\\<asin\\>\\|" "\\<acos\\>\\|" "\\<atan\\>\\|"
	    "\\<atan2\\>\\|" "\\<sinh\\>\\|" "\\<cosh\\>\\|" "\\<tanh\\>\\|"
	    "\\<hypot\\>\\|" "\\<pow\\>\\|" "\\<sqrt\\>\\|" "\\<exp\\>\\|"
	    "\\<log\\>\\|" "\\<log2\\>\\|" "\\<log10\\>\\|" "\\<floor\\>\\|"
	    "\\<ceil\\>\\|" "\\<round\\>\\|"
	    "\\<trunc\\>\\|" "\\<fmod\\>\\|" "\\<remainder\\>\\|" "\\<min\\>\\|"
	    "\\<max\\>\\|" "\\<nextpow2\\>\\|" "\\<Machine\\>\\|" "\\<add\\>\\|"
	    "\\<remove\\>\\|" "\\<replace\\>\\|" "\\<status\\>\\|" "\\<spork\\>\\|"
	    "\\<net\\>\\|" "\\<init\\>\\|" "\\<data\\>\\|" "\\<data\\>\\|"
	    "\\<send\\>\\|" "\\<bind\\>\\|" "\\<connect\\>") 
	 'font-lock-function-name-face)
   (cons (concat "\\<dac\\>\\|" "\\<adc\\>\\|"
		"\\<CHmUsiCK\\>\\|"
		"\\<Drum\\>\\|" "\\<FMSynth\\>\\|" "\\<Audio\\>\\|"
		"\\<Bass\\>\\|" "\\<Harmony\\>\\|" "\\<Notes\\>\\|"
		"\\<Melody\\>\\|" "\\<Rec\\>\\|" "\\<Sampler\\>\\|"
	    "\\<blackhole\\>\\|" "\\<Gain\\>\\|" "\\<Noise\\>\\|"
	    "\\<Impulse\\>\\|" "\\<Step\\>\\|" "\\<HalfRect\\>\\|"
	    "\\<fullrect\\>\\|" "\\<zerox\\>\\|" "\\<delayp\\>\\|"
	    "\\<SndBuf\\>\\|" "\\<phasor\\>\\|"
	    "\\<SinOsc\\>\\|" "\\<PulseOsc\\>\\|" "\\<SqrOsc\\>\\|"
	    "\\<TriOsc\\>\\|" "\\<SawOsc\\>\\|" "\\<netout\\>\\|"
	    "\\<netin\\>\\|" "\\<BandedWG\\>\\|" "\\<BlowBotl\\>\\|"
	    "\\<BlowHole\\>\\|" "\\<Bowed\\>\\|" "\\<Brass\\>\\|"
	    "\\<Clarinet\\>\\|" "\\<Flute\\>\\|"
	    "\\<Mandolin\\>\\|" "\\<ModalBar\\>\\|" "\\<Moog\\>\\|"
	    "\\<Saxofony\\>\\|" "\\<Shakers\\>\\|" "\\<Sitar\\>\\|"
	    "\\<StifKarp\\>\\|" "\\<VoicForm\\>\\|" "\\<FM\\>\\|"
	    "\\<BeeThree\\>\\|" "\\<FMVoices\\>\\|" "\\<HevyMetl\\>\\|"
	    "\\<PercFlut\\>\\|" "\\<Rhodey\\>\\|"
	    "\\<TubeBell\\>\\|" "\\<Wurley\\>\\|" "\\<Delay\\>\\|"
	    "\\<DelayA\\>\\|" "\\<DelayL\\>\\|" "\\<Echo\\>\\|" "\\<Envelope\\>\\|"
	    "\\<ADSR\\>\\|" "\\<BiQuad\\>\\|" "\\<Filter\\>\\|" "\\<OnePole\\>\\|" 
	    "\\<TwoPole\\>\\|" "\\<OneZero\\>\\|" "\\<TwoZero\\>\\|"
	    "\\<PoleZero\\>\\|" "\\<LPF\\>\\|" "\\<HPF\\>\\|" "\\<JCRev\\>\\|" 
		"\\<NRev\\>\\|" "\\<PRCRev\\>\\|"
	    "\\<Chorus\\>\\|" "\\<Modulate\\>\\|" "\\<PitShift\\>\\|"
	    "\\<SubNoise\\>\\|" "\\<WvIn\\>\\|" "\\<WaveLoop\\>\\|" "\\<WvOut\\>") 
    'font-lock-constant-face)
   (cons (concat "\\<NULL\\>\\|" "\\<adc\\>\\|"
	    "\\<array\\>\\|" "\\<blackhole\\>\\|" "\\<bunghole\\>\\|"
	    "\\<cherr\\>\\|" "\\<chout\\>\\|" "\\<class\\>\\|" "\\<code\\>\\|"
	    "\\<compiler\\>\\|" "\\<dac\\>\\|" "\\<day\\>\\|" "\\<double\\>\\|"
	    "\\<dur\\>\\|" "\\<endl\\>\\|" "\\<false\\>\\|" "\\<float\\>\\|"
	    "\\<function\\>\\|" "\\<global\\>\\|" "\\<host\\>\\|" "\\<hour\\>\\|"
	    "\\<int\\>\\|" "\\<language\\>\\|" "\\<machine\\>\\|" "\\<midiin\\>\\|"
	    "\\<midiout\\>\\|" "\\<minute\\>\\|" "\\<ms\\>\\|" "\\<now\\>\\|"
	    "\\<null\\>\\|" "\\<object\\>\\|"
	    "\\<pattern\\>\\|" "\\<math.pi\\>\\|" "\\<samp\\>\\|" "\\<second\\>\\|"
	    "\\<shred\\>\\|" "\\<single\\>\\|" "\\<start\\>\\|" "\\<stderr\\>\\|"
	    "\\<stdout\\>\\|" "\\<string\\>\\|" "\\<thread\\>\\|" "\\<time\\>\\|"
	    "\\<transport\\>\\|" "\\<true\\>\\|" "\\<tuple\\>\\|" "\\<ugen\\>\\|"
	    "\\<uint\\>\\|" "\\<void\\>\\|" "\\<week\\>") 'font-lock-type-face)
   '("\\('\\w*'\\)" . font-lock-variable-name-face))
  "Highlighting for ChucK mode")
(defvar chuck-font-lock-keywords chuck-font-lock-keywords-1
  "Default highlighting for ChucK mode")

;; Indenting for ChucK mode
(defun chuck-indent-line () 
  "Indent current line as ChucK code"
  (interactive)
  (beginning-of-line)
  (if (bobp)  ;; Start of buffer starts out unindented
      (indent-line-to 0)
    (let ((not-indented t) cur-indent)
      (if (looking-at ".*}") ; Closing a block
	  (progn
	    (save-excursion
	      (forward-line -1)
	      (setq cur-indent (- (current-indentation) default-tab-width)))
	    (if (< cur-indent 0)
		(setq cur-indent 0)))
	(save-excursion
	  (while not-indented
	    (forward-line -1)
	    (if (looking-at ".*}") ; Earlier block closed
		(progn
		  (setq cur-indent (current-indentation))
		  (setq not-indented nil))
	      (if (looking-at ".*{") ; In open block
		  (progn
		    (setq cur-indent (+ (current-indentation) default-tab-width))
		    (setq not-indented nil))
		(if (bobp)
		    (setq not-indented nil)))))))
      (if cur-indent
	  (indent-line-to cur-indent)
	(indent-line-to 0)))))

;; Syntax table
(defvar chuck-mode-syntax-table nil "Syntax table for ChucK mode")
(setq chuck-mode-syntax-table
  (let ((chuck-mode-syntax-table (make-syntax-table)))
    (modify-syntax-entry ?_ "_" chuck-mode-syntax-table)
    (modify-syntax-entry ?/ ". 12" chuck-mode-syntax-table)
    (modify-syntax-entry ?\n ">" chuck-mode-syntax-table)
    chuck-mode-syntax-table))

;; Entry point
(defun chuck-mode ()
  "Major mode for editing ChucK music/audio scripts"
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table chuck-mode-syntax-table)
  (use-local-map chuck-mode-map)
  (set (make-local-variable 'font-lock-defaults)
       '(chuck-font-lock-keywords))
  (set (make-local-variable 'indent-line-function)
       'chuck-indent-line)
  (setq major-mode 'chuck-mode)
  (setq mode-name "ChucK")
  (setq default-tab-width 4)
  (run-hooks 'chuck-mode-hook))

(provide 'chuck-mode)


; (setq foo (regexp-opt '("dac" "adc" "blackhole" "gain" "Noise" "Impulse" "step" "halfrect" "fullrect" "zerox" "delayp" "SndBuf" "phasor" "sinosc" "pulseosc" "sqrosc" "triosc" "sawosc" "netout" "netin" "BandedWG" "BlowBotl" "BlowHole" "Bowed" "Brass" "Clarinet" "Flute" "Mandolin" "ModalBar" "Moog" "Saxofony" "Shakers" "Sitar" "StifKarp" "VoicForm" "FM" "BeeThree" "FMVoices" "HevyMetl" "PercFlut" "Rhodey" "TubeBell" "Wurley" "Delay" "DelayA" "DelayL" "Echo" "Envelope" "ADSR" "BiQuad" "Filter" "OnePole" "TwoPole" "OneZero" "TwoZero" "PoleZero" "JCRev" "NRev" "PRCRev" "Chorus" "Modulate" "PitShift" "SubNoise" "WvIn" "WaveLoop" "WvOut")))

