;;; dtl-mode-el -- Major mode for editing Syncsort DTL files

;; Author: Gregory Grubbs <gregory@dynapse.com>
;; Created: 11 Jun 2014
;; Keywords: DTL major-mode

;; Copyright (C) 2014 Gregory Grubbs <gregory@dynapse.com>

;; Licensed to the Apache Software Foundation (ASF) under one
;; or more contributor license agreements.  See the NOTICE file
;; distributed with this work for additional information
;; regarding copyright ownership.  The ASF licenses this file
;; to you under the Apache License, Version 2.0 (the
;; "License"); you may not use this file except in compliance
;; with the License.  You may obtain a copy of the License at

;;     http://www.apache.org/licenses/LICENSE-2.0

;; Unless required by applicable law or agreed to in writing, software
;; distributed under the License is distributed on an "AS IS" BASIS,
;; WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
;; See the License for the specific language governing permissions and
;; limitations under the License.
;;
;;; Commentary:
;; 
;; Syncsort DTL mode

;;; Code:
;;;; User Customization
(defgroup dtl nil
  "Customization variables for DTL mode."
  :tag "Syncsort DTL"
  :group 'languages)

(defcustom dtl-indent-level 4
  "Number of spaces for each indentation step in `dtl-mode'."
  :type 'integer
  :safe 'integerp
  :group 'dtl)

(defcustom dtl-ac-dict-file "~/emacs/dtl-mode/dtl-mode.dict"
  "Auto-complete dictionary file with DTL commands, keywords and function names.  Should be distributed with `dtl-mode'."
  :type 'file
  :safe 'file
  :group 'dtl)

(defvar dtl-mode-hook nil)

(defvar dtl-mode-map
  (let ((map (make-keymap)))
    (define-key map "\C-j" 'newline-and-indent)
    (define-key map (kbd "C-c C-c") 'dtl-run)
    (define-key map (kbd "M-RET") 'insert-new-line-and-indent)
    map)
  "Keymap for DTL major mode.")

(add-to-list 'auto-mode-alist '("\\.dtl$" . dtl-mode))

(defconst dtl-commands '("/COLLATINGSEQUENCE" "/CONDITION" "/DATADICTIONARY" "/DATASIZE" "DBCONNECTION" "/DBINPUT" "/DELIMITEDRECORDLAYOUT" "/DTL" "/END" "/FILE" "/FILTER" "/GROUPBY" "/INFILE" "/INPIPE" "/INMAXRECORDLENGTH" "/JOINKEYS" "/KEYS" "/LOGOPTIONS" "/MEMORY" "/NOPROMPT" "/NULLIF" "/OUTFILE" "/OUTPIPE" "/PADBYTE" "/RECORDLAYOUT" "/REFORMAT" "/SERVERCONNECTION" "/STABLE" "/SUMMARY" "/TASKDOCUMENTATION" "/TASKTYPE" "/VALUE" "/WORKSPACE" "/CUSTOMTASK" "/DEFAULTFLOW" "/FLOW" "/MAPREDUCE" "/SUBJOB" "/TASK"))

(defconst dtl-keywords
  '("ABORTIF" "ACUCOBOL" "ADDROUT" "AGGREGATE" "ALIAS" "ALIGNED2" "ALIGNED4" "ALL" "ALLOWREORDERING" "ALLVALUELABELS" "ALWAYS" "AN" "AND" "ANSI" "ANY" "APPEND" "ARGUMENTS" "ASCENDING" "ASCII" "AUTHENTICATION" "AUTHOR" "AUTODETECT" "AVERAGE" "BASELAYOUT" "BIGENDIAN" "BITS" "BLOCKSIZE" "BOM" "BUCKET" "BYCONDITION" "BYDAY" "BYFIELD" "BYHOUR" "BYMINUTE" "BYMONTH" "BYSECOND" "BYTES" "BYYEAR" "BZIP2" "CALLONCE" "CALLREPEATEDLY" "CHARACTER" "CLIENT" "COBOL" "COLLATINGSEQUENCES" "COLUMNS" "COLUMNSPACING" "COMMENTS" "COMMITINTERVAL" "COMPANY" "COMPRESSED" "CONDITION" "CONDITIONS" "CONTIGUOUS" "COPY" "COUNT" "CP273GERMANY" "CP277DENMARK" "CP278SWEDEN" "CP280ITALY" "CP284SPAIN" "CP285UK" "CP297FRANCE" "CP37USA" "CP500GLOBAL" "CP871ICELAND" "CR" "CREATE" "CREATECOMPOSITE" "CRLF" "CT" "CUBE" "CUSTOMSTREAM" "DATABASECONNECTIONS" "DATE" "DATETIME" "DAY" "DB2" "DBMS" "DD" "DD0" "DEFAULT" "DEFAULTFIXEDFORMAT" "DELETE" "DELIMITED" "DERIVEDFIELDS" "DESCENDING" "DFLOAT" "DIMENSIONSET" "DIMENSIONSETS" "DIRECT" "DISCARDAFTER" "DISCARDBLANK" "DISCARDFIRST" "DISCARDSHORT" "DISKBLOCKS" "DISPLAYRECORD" "DMEXPRESS" "DOCUMENTATION" "DROPNULLINFORMATION" "DTD" "DY" "DYNAMIC" "EACHPARTITION" "EBCDIC" "ELSE" "EMPTY" "EN" "ENCLOSEDBY" "ENCODING" "ENCRYPTEDPASSWORD" "ENDOFTASK" "EQ" "ERRLIMIT" "ERROR" "EXECUTABLE" "EXITSTATUS" "EXPANDWILDCARDS" "EXPORT" "EXTERNAL" "EXTRACT" "EXTRACTAS" "FASCII" "FASTLOAD" "FDISCARDAFTER" "FDISCARDBLANK" "FDISCARDFIRST" "FDISCARDSHORT" "FEBCDIC" "FIELD" "FIELDS" "FIELDSEPARATOR" "FILE" "FILLER" "FIRST" "FIXED" "FLOAT" "FLOW" "FOLDED" "FOLLOWINGTASK" "FORTRANUNFORMATTED" "FSKIPBLANK" "FSKIPRECORD" "FSTOPAFTER" "FTP" "FULLPATH" "FUNCTIONCALL" "GE" "GENERATEJOBSCRIPT" "GIGABYTES" "GT" "GZIP" "HDFS" "HEADER" "HFTP" "HIERARCHIES" "HIERARCHY" "HIGH" "HIGHCOMPRESSION" "HOUR" "IEEE" "IF" "INCLUDE" "INCLUDEAFTER" "INCLUDEBEFORE" "INDEXED" "INSERT" "INSTANCES" "INTEGER" "JOIN" "KEYEDINDEX" "KILOBYTES" "LAST" "LAYOUT" "LAYOUTS" "LE" "LEAF" "LEFTSIDE" "LEVEL" "LF" "LINES" "LOB" "LOCALE" "LOW" "LP" "LS" "LT" "LZ" "MAINFRAMEFIXED" "MAINFRAMEJOBCARD" "MAINFRAMEUNBLOCKEDVARIABLE" "MAINFRAMEVARIABLE" "MAINFRAMEVSAM" "MAPPINGS" "MAPTO" "MATCH" "MAXIMUM" "MEGABYTES" "MERGE" "METADATAID" "MFCOBOL" "MFFIXED" "MFLINESEQUENTIAL" "MFVARIABLE" "MI" "MI0" "MINIMUM" "MINUTE" "MIXEDENCODINGS" "MM" "MN" "MN0" "MODIFICATION" "MON" "MONTH" "MOVEAFTER" "MOVEBEFORE" "MQCONNECTIONS" "MT" "MULTINATIONAL" "NAME" "NAMEDPIPE" "NAMESRECORD" "NC" "NE" "NEWLINE" "NEWPAGE" "NL" "NM" "NOBLANK" "NOCOLUMNHEADINGS" "NODETAIL" "NODUPLICATE" "NOEMPTY" "NOFIELDENCODINGS" "NOFIELDSEPARATOR" "NONDICTIONARY" "NONE" "NONPRINTABLE" "NORMALIZE" "NOSKIP" "NOT" "NOTDIRECT" "NOTENCLOSED" "NOTNULLABLE" "NOWARN" "NULL" "NULLABLE" "NULLBYTEPREFIX" "NULLCHAR" "NULLIFEMPTY" "NUMBER" "OBJECT" "ODBC" "OFF" "OFFSPRING" "OMIT" "ON" "ONBREAK" "ONLY" "OPEN" "OR" "ORACLE" "ORPHANVALUES" "OS" "OUTPUT" "OUTRECORDCOUNT" "OVERWRITE" "PAGENUMBER" "PAGESTART" "PAGETOP" "PAIRED" "PARAMETEREXTRACT" "PARAMETERFILE" "PARAMETERIN" "PARAMETERS" "PARENT" "PARTITION" "PARTITIONCOUNT" "PARTITIONSIZE" "PD" "PORT" "POSITIONAL" "PREAGGREGATED" "PRESERVENULLINFORMATION" "PRESORTED" "PREVIOUSTASK" "PRIMARYKEY" "PUBLICKEY" "QUERY" "QUEUE" "RANDOM" "RDW4" "RECORDNUMBER" "RECORDS" "RECURSIVE" "RELATIVE" "REPEAT" "REPLACEWITH" "RETAINARRAY" "RETAINCOMPOSITE" "RETAINIF" "RFA" "RFM" "RIDX" "RIGHTSIDE" "ROLLUP" "ROOT" "RUNCOUNT" "RUNTIMEVARIABLES" "RUNTOTAL" "SAPCONNECTIONS" "SCHEMA" "SE" "SE0" "SECOND" "SEQUENTIAL" "SERVERCONNECTION" "SERVERCONNECTIONS" "SESSIONS" "SFDCCONNECTIONS" "SFTP" "SHOWOPTIONS" "SIDE1" "SIDE2" "SKIPFIELDS" "SKIPLEVELS" "SLEEP" "SN" "SOR" "SORT" "SORTED" "SORTEDOUTPUT" "SOURCE" "SOURCEANDTARGET" "SOURCECOMPRESSIONFORMAT" "SOURCEENCODING" "SOURCES" "SQL" "START" "STATISTICS" "STATUS" "STCL" "STCR" "STDIN" "STDOUT" "STLF" "STR" "STREAM" "STRING" "SUBCUBE" "SUBSTRING" "SUCCESSIF" "SYBASE" "SYMBOLS" "SYNCSORT" "TABLE" "TARGETS" "TASKDOCUMENTATION" "TASKID" "TASKSETTING" "TBLOCK" "TENACITY" "TERABYTES" "TERADATA" "TEXT" "THEN" "TIME" "TIMEMASK" "TIMESTAMP" "TIMEZONE" "TIMEZONEHOUR" "TIMEZONEMINUTE" "TITLE" "TODAY" "TOTAL" "TP" "TREATAS" "TRUNCATE" "TRUNCATEANDINSERT" "TS" "UINTEGER" "UNALIGNED" "UNCOMPRESSED" "UNIX" "UNIXSORTDEFAULT" "UNPAIRED" "UNSELECTEDRECORDS" "UPDATE" "UPPER" "USER" "UTF-16" "UTF-16BE" "UTF-16LE" "UTF-32" "UTF-32BE" "UTF-32LE" "UTF-8" "UTILITY" "VAL" "VALU" "VALUE" "VALUES" "VARIABLE" "VERIFY" "VERIFYORDER" "VERSION" "VFC" "VIEWAS" "VSAM" "VSCOBOL" "WARN" "WARNINGS" "WHENMATCHED" "WHENNOTMATCHED" "WIDTH" "WINDOWS" "WORKDATABASE" "XML" "YEAR" "YY" "Z"))

(defconst dtl-types
  '("COPY" "MERGE" "AGGREGATE" "JOIN" "SORT"))

(defconst dtl-functions
  '("Abs" "CharacterLengthOf" "CRC32" "DateAdd" "DateDiff" "DateLastDay" "DatePart" "Encode" "EvaluateExpressionList" "Extract" "FindContainedValue" "GetExternalFunctionValue" "GetUserDefinedValue" "IfCompares" "IfContainsAny" "IfEqualsAny" "IfMatches" "IfRecordJoined" "IfRecordOrigin" "IfThenElse" "InString" "IsValidDate" "IsValidNumber" "LengthOf" "Lookup" "MD5" "Mod" "Pad" "Pow" "Rand" "RegExReplace" "Replace" "Round" "SetUserDefinedValue" "SourceFullName" "SourceName" "Sqrt" "Substring" "TargetRecordNumber" "ToDate" "Today" "ToFile" "ToLower" "ToNumber" "ToText" "ToUpper" "Translate" "Trim" "Truncate" "URLDecode"))


(defvar dtl-font-lock-defaults
  `((
     ("\\(\\${?\\|%\\)\\([[:alpha:]_][[:alnum:]_]*[}%]?\\)" . font-lock-variable-name-face) ;; $BLAH, ${BLAH}, or %BLAH%
     ("\"\\.\\*\\?" . font-lock-string-face)
     ( ,(mapconcat 'identity dtl-commands "\\|") . font-lock-keyword-face)
     ;; ( ,(regexp-opt dtl-commands 'words) . font-lock-builtin-face)
     ( ,(regexp-opt dtl-keywords 'words) . font-lock-constant-face)
     ( ,(regexp-opt dtl-functions 'words) . font-lock-function-name-face)
     ( ,(regexp-opt dtl-types 'words) . font-lock-type-face)
     (":\\|;\\|=\\|\\!=\\|/" . font-lock-builtin-face)
     )))

;; /DTL and /END are indent level 0
;; default for everything following a /DTL is indent level 1
;; if { appears in a previous line without a closing }, cur-indent += 1
;; if } appears in current line without an opening {. cur-indent -= 1
;; line continuations should indent past previous command
;; TODO: Comments should align to first following non-comment line
(defun dtl-indent-line ()
  "Indent current line as DTL code."
  (interactive)
  (beginning-of-line)
  (let ((cur-level 1) (not-indented t))
    (cond ((looking-at "^[ \t]*\\(/DTL\\|/END\\)")
	   (setq cur-level 0))
	  ;; ((looking-at "^[^{\n]*}")
	  ;;  (setq cur-level 1))
	  ((looking-at "^[ \t]*\\/[^*]")
	   (setq cur-level 1))
	  ((looking-at "^[ \t]*[a-z]")
	   (setq cur-level 2))
	  (t
	   (save-excursion
	     (while (and not-indented (not (bobp)))
	       (forward-line -1)
	       (cond
		((looking-at "^[^{\n]*{[^}\n]*") ;; opening brace without closing brace on line
		 (progn
		   (setq cur-level (+ cur-level 1))
		   (setq not-indented nil)))
		((looking-at "^[^{\n]*}") ;; closing brace without opening brace on line
		 (progn
		   ;; (setq cur-level (- cur-level 1))
		   (setq not-indented nil))))))))
    (if cur-level
	(indent-line-to (* cur-level dtl-indent-level)))))

(defun insert-new-line-and-indent ()
  "Insert a new line and indent to correct position."
(interactive)
  (newline)
  (dtl-indent-line))

(defun dtl-generate-following-task ()
  "Generate next task based on target of current task."
  (interactive)
  (let ((bogus-name "next-task.dtl"))

    (save-excursion
      (goto-char (point-min))
      (when (re-search-forward "^\s*/OUTFILE\s+\\([^ ]+\\)\\(.\\|\n\\)+\s*/REFORMAT\s+.+?LAYOUT\s+\\([-a-z_0-9]+\\)\s+.+VALUES\\(\\(.\\|\n\\)+?\\)/[a-z]" (point-max) nil)
	(let ((pwd default-directory)
	      (outfile-name (match-string-no-properties 1))
	      (buffer-name (format "%s.dtx" (uuid-string)))
	      (layout-name (match-string-no-properties 3))
	      (target-field-list (match-string-no-properties 4)))
	  (message (format "Layout name is %s" layout-name))
	  (set-buffer (get-buffer-create buffer-name))
	  (cd pwd)
	  (delete-region (point-min) (point-max))
	  (goto-char (point-min))
	  (insert (format "/DTL\n/TASKTYPE COPY\n/INFILE %s STLF FIELDSEPARATOR X\"09\" NOTENCLOSED LAYOUT %s\n/DELIMITEDRECORDLAYOUT %s { %s }\n/END"
			  outfile-name layout-name layout-name target-field-list))
	  (dtl-mode)
	  (goto-char (point-min))
	  (set-mark-command nil)
	  (goto-char (point-max))
	  (indent-for-tab-command)
	  (switch-to-buffer buffer-name)
	  ))
      ) ;; save-excursion
    ) ;; let
  ) ;; function dtl-generate-following-task

;;;###autoload
(defvar dtl-mode-syntax-table
  (let ((dtl-mode-syntax-table (make-syntax-table)))
    
					; This is added so entity names with underscores can be more easily parsed
    (modify-syntax-entry ?_ "w" dtl-mode-syntax-table)
    
    ;; 					; Comment styles are same as C++
    ;; (modify-syntax-entry ?/ ". 124b" dtl-mode-syntax-table)
    ;; (modify-syntax-entry ?* ". 23" dtl-mode-syntax-table)
    ;; (modify-syntax-entry ?\n "> b" dtl-mode-syntax-table)
	;; define comment for this style: “/* … */”
	(modify-syntax-entry ?\/ ". 14" dtl-mode-syntax-table)
	(modify-syntax-entry ?* ". 23" dtl-mode-syntax-table)
    dtl-mode-syntax-table)
  "Syntax table for `dtl-mode'.")

(defun dtl-run ()
  "Run current task or job in a compilation buffer."
 (interactive)
  (save-some-buffers)
  (save-excursion
    (let* ((cmd (save-excursion
		  (goto-char (point-min))
		  (setq case-fold-search t)
		  (if (re-search-forward "^[ \t]*/TASKTYPE" nil t)
		      "dmexpress"
		    "dmxjob")))
	   (envvars (if (file-exists-p "envvars.sh")
			". ./envvars.sh && " ""))
	   (fname (buffer-file-name))
	   (fdir (file-name-directory fname)))
      (cd fdir)
      (set (make-local-variable 'compile-command) (format "%s %s /run %s" envvars cmd fname))
      ;; (call-interactively 'compile)
      (compile compile-command nil)
      )))


(defun dtl-mode ()
  "Major mode for editing Syncsort DTL dataflow language files."
  (interactive)
  (kill-all-local-variables)
  (setq case-fold-search t)
  (set-syntax-table dtl-mode-syntax-table)
  (use-local-map dtl-mode-map)
  ;; set up font lock
  (set (make-local-variable 'font-lock-defaults) dtl-font-lock-defaults)
  ;; (set (make-local-variable 'font-lock-keywords-case-fold-search) t)
  ;; (set (make-local-variable 'font-lock-defaults)
  ;;      (list 'dtl-font-lock-defaults nil t))  ;; register our indentation function
  (set (make-local-variable 'indent-line-function) 'dtl-indent-line)
  ;; C-style comments
  (set (make-local-variable 'comment-start) "/*")
  (set (make-local-variable 'comment-end) "*/")
  ;; set up compilation buffer to run DTL jobs and tasks
  (require 'compile)
  (require 'cl) ;; needed for 'pushnew'
  (pushnew '(dtl "^DMExpress : (\\([A-Z]+\\))\\|at line \\([0-9]+\\) of \\(.+\\)" 3 2) compilation-error-regexp-alist-alist)
  (pushnew 'dtl compilation-error-regexp-alist)
  (setq major-mode 'dtl-mode)
  (setq mode-name "DTL")
  (run-mode-hooks 'dtl-mode-hook))

(provide 'dtl-mode)

(provide 'dtl-mode)

;;; dtl-mode.el ends here
