;;; dtl-mode-el -- Major mode for editing Syncsort DTL files

;; Author: Gregory Grubbs <gregory@dynapse.com>
;; Created: 11 Jun 2014
;; Keywords: DTL major-mode

;; Copyright (C) 2014 Gregory Grubbs <gregory@dynapse.com>

;; This program is free software; you can redistribute it and/or
;; modify it under the terms of the GNU General Public License as
;; published by the Free Software Foundation; either version 2 of
;; the License, or (at your option) any later version.

;; This program is distributed in the hope that it will be
;; useful, but WITHOUT ANY WARRANTY; without even the implied
;; warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR
;; PURPOSE.  See the GNU General Public License for more details.

;; You should have received a copy of the GNU General Public
;; License along with this program; if not, write to the Free
;; Software Foundation, Inc., 59 Temple Place, Suite 330, Boston,
;; MA 02111-1307 USA

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



(defvar dtl-mode-hook nil)

(defvar dtl-mode-map
  (let ((map (make-keymap)))
    (define-key map "\C-j" 'newline-and-indent)
    (define-key map (kbd "C-c C-c") 'dtl-run)
    map)
  "Keymap for DTL major mode")

;; (when (not dtl-mode-map)
;;   (setq dtl-mode-map (make-sparse-keymap))
;;   (define-key dtl-mode-map (kbd "C-c C-c") 'dtl-run))

;;;###autoload
(add-to-list 'auto-mode-alist '("\\.dtl$" . dtl-mode))

(defconst dtl-commands '("/COLLATINGSEQUENCE" "/CONDITION" "/DATADICTIONARY" "/DATASIZE" "/DELIMITEDRECORDLAYOUT" "/DTL" "/END" "/FILE" "/FILTER" "/GROUPBY" "/INFILE" "/INMAXRECORDLENGTH" "/JOINKEYS" "/KEYS" "/LOGOPTIONS" "/MEMORY" "/NOPROMPT" "/NULLIF" "/OUTFILE" "/PADBYTE" "/RECORDLAYOUT" "/REFORMAT" "/SERVERCONNECTION" "/STABLE" "/SUMMARY" "/TASKDOCUMENTATION" "/TASKTYPE" "/VALUE" "/WORKSPACE" "/CUSTOMTASK" "/DEFAULTFLOW" "/DTL" "/END" "/FLOW" "/MAPREDUCE" "/SUBJOB" "/TASK"))

(defconst dtl-keywords
  '("ABORTIF" "ACUCOBOL" "ADDROUT" "AGGREGATE" "ALIAS" "ALIGNED2" "ALIGNED4" "ALL" "ALLOWREORDERING" "ALLVALUELABELS" "ALWAYS" "AN" "AND" "ANSI" "ANY" "APPEND" "ARGUMENTS" "ASCENDING" "ASCII" "AUTHENTICATION" "AUTHOR" "AUTODETECT" "AVERAGE" "BASELAYOUT" "BIGENDIAN" "BITS" "BLOCKSIZE" "BOM" "BUCKET" "BYCONDITION" "BYDAY" "BYFIELD" "BYHOUR" "BYMINUTE" "BYMONTH" "BYSECOND" "BYTES" "BYYEAR" "BZIP2" "CALLONCE" "CALLREPEATEDLY" "CHARACTER" "CLIENT" "COBOL" "COLLATINGSEQUENCES" "COLUMNS" "COLUMNSPACING" "COMMENTS" "COMMITINTERVAL" "COMPANY" "COMPRESSED" "CONDITION" "CONDITIONS" "CONTIGUOUS" "COPY" "COUNT" "CP273GERMANY" "CP277DENMARK" "CP278SWEDEN" "CP280ITALY" "CP284SPAIN" "CP285UK" "CP297FRANCE" "CP37USA" "CP500GLOBAL" "CP871ICELAND" "CR" "CREATE" "CREATECOMPOSITE" "CRLF" "CT" "CUBE" "CUSTOMSTREAM" "DATABASECONNECTIONS" "DATE" "DATETIME" "DAY" "DB2" "DBMS" "DD" "DEFAULT" "DEFAULTFIXEDFORMAT" "DELETE" "DELIMITED" "DERIVEDFIELDS" "DESCENDING" "DFLOAT" "DIMENSIONSET" "DIMENSIONSETS" "DIRECT" "DISCARDAFTER" "DISCARDBLANK" "DISCARDFIRST" "DISCARDSHORT" "DISKBLOCKS" "DISPLAYRECORD" "DMEXPRESS" "DOCUMENTATION" "DROPNULLINFORMATION" "DTD" "DY" "DYNAMIC" "EACHPARTITION" "EBCDIC" "ELSE" "EMPTY" "EN" "ENCLOSEDBY" "ENCODING" "ENCRYPTEDPASSWORD" "ENDOFTASK" "EQ" "ERRLIMIT" "ERROR" "EXECUTABLE" "EXITSTATUS" "EXPANDWILDCARDS" "EXPORT" "EXTERNAL" "EXTRACT" "EXTRACTAS" "FASCII" "FASTLOAD" "FDISCARDAFTER" "FDISCARDBLANK" "FDISCARDFIRST" "FDISCARDSHORT" "FEBCDIC" "FIELD" "FIELDS" "FIELDSEPARATOR" "FILE" "FILLER" "FIRST" "FIXED" "FLOAT" "FLOW" "FOLDED" "FOLLOWINGTASK" "FORTRANUNFORMATTED" "FSKIPBLANK" "FSKIPRECORD" "FSTOPAFTER" "FTP" "FULLPATH" "FUNCTIONCALL" "GE" "GENERATEJOBSCRIPT" "GIGABYTES" "GT" "GZIP" "HDFS" "HEADER" "HFTP" "HIERARCHIES" "HIERARCHY" "HIGH" "HIGHCOMPRESSION" "HOUR" "IEEE" "IF" "INCLUDE" "INCLUDEAFTER" "INCLUDEBEFORE" "INDEXED" "INSERT" "INSTANCES" "INTEGER" "JOIN" "KEYEDINDEX" "KILOBYTES" "LAST" "LAYOUT" "LAYOUTS" "LE" "LEAF" "LEFTSIDE" "LEVEL" "LF" "LINES" "LOB" "LOCALE" "LOW" "LP" "LS" "LT" "LZ" "MAINFRAMEFIXED" "MAINFRAMEJOBCARD" "MAINFRAMEUNBLOCKEDVARIABLE" "MAINFRAMEVARIABLE" "MAINFRAMEVSAM" "MAPPINGS" "MAPTO" "MATCH" "MAXIMUM" "MEGABYTES" "MERGE" "METADATAID" "MFCOBOL" "MFFIXED" "MFLINESEQUENTIAL" "MFVARIABLE" "MINIMUM" "MINUTE" "MIXEDENCODINGS" "MM" "MN" "MODIFICATION" "MON" "MONTH" "MOVEAFTER" "MOVEBEFORE" "MQCONNECTIONS" "MT" "MULTINATIONAL" "NAME" "NAMEDPIPE" "NAMESRECORD" "NC" "NE" "NEWLINE" "NEWPAGE" "NL" "NM" "NOBLANK" "NOCOLUMNHEADINGS" "NODETAIL" "NODUPLICATE" "NOEMPTY" "NOFIELDENCODINGS" "NOFIELDSEPARATOR" "NONDICTIONARY" "NONE" "NONPRINTABLE" "NORMALIZE" "NOSKIP" "NOT" "NOTDIRECT" "NOTENCLOSED" "NOTNULLABLE" "NOWARN" "NULL" "NULLABLE" "NULLBYTEPREFIX" "NULLCHAR" "NULLIFEMPTY" "NUMBER" "OBJECT" "ODBC" "OFF" "OFFSPRING" "OMIT" "ON" "ONBREAK" "ONLY" "OPEN" "OR" "ORACLE" "ORPHANVALUES" "OS" "OUTPUT" "OUTRECORDCOUNT" "OVERWRITE" "PAGENUMBER" "PAGESTART" "PAGETOP" "PAIRED" "PARAMETEREXTRACT" "PARAMETERFILE" "PARAMETERIN" "PARAMETERS" "PARENT" "PARTITION" "PARTITIONCOUNT" "PARTITIONSIZE" "PD" "PORT" "POSITIONAL" "PREAGGREGATED" "PRESERVENULLINFORMATION" "PRESORTED" "PREVIOUSTASK" "PRIMARYKEY" "PUBLICKEY" "QUERY" "QUEUE" "RANDOM" "RDW4" "RECORDNUMBER" "RECORDS" "RECURSIVE" "RELATIVE" "REPEAT" "REPLACEWITH" "RETAINARRAY" "RETAINCOMPOSITE" "RETAINIF" "RFA" "RFM" "RIDX" "RIGHTSIDE" "ROLLUP" "ROOT" "RUNCOUNT" "RUNTIMEVARIABLES" "RUNTOTAL" "SAPCONNECTIONS" "SCHEMA" "SECOND" "SEQUENTIAL" "SERVERCONNECTION" "SERVERCONNECTIONS" "SESSIONS" "SFDCCONNECTIONS" "SFTP" "SHOWOPTIONS" "SIDE1" "SIDE2" "SKIPFIELDS" "SKIPLEVELS" "SLEEP" "SN" "SOR" "SORT" "SORTED" "SORTEDOUTPUT" "SOURCE" "SOURCEANDTARGET" "SOURCECOMPRESSIONFORMAT" "SOURCEENCODING" "SOURCES" "SQL" "START" "STATISTICS" "STATUS" "STCL" "STCR" "STDIN" "STDOUT" "STLF" "STR" "STREAM" "STRING" "SUBCUBE" "SUBSTRING" "SUCCESSIF" "SYBASE" "SYMBOLS" "SYNCSORT" "TABLE" "TARGETS" "TASKDOCUMENTATION" "TASKID" "TASKSETTING" "TBLOCK" "TENACITY" "TERABYTES" "TERADATA" "TEXT" "THEN" "TIME" "TIMEMASK" "TIMESTAMP" "TIMEZONE" "TIMEZONEHOUR" "TIMEZONEMINUTE" "TITLE" "TODAY" "TOTAL" "TP" "TREATAS" "TRUNCATE" "TRUNCATEANDINSERT" "TS" "UINTEGER" "UNALIGNED" "UNCOMPRESSED" "UNIX" "UNIXSORTDEFAULT" "UNPAIRED" "UNSELECTEDRECORDS" "UPDATE" "UPPER" "USER" "UTF-16" "UTF-16BE" "UTF-16LE" "UTF-32" "UTF-32BE" "UTF-32LE" "UTF-8" "UTILITY" "VAL" "VALU" "VALUE" "VALUES" "VARIABLE" "VERIFY" "VERIFYORDER" "VERSION" "VFC" "VIEWAS" "VSAM" "VSCOBOL" "WARN" "WARNINGS" "WHENMATCHED" "WHENNOTMATCHED" "WIDTH" "WINDOWS" "WORKDATABASE" "XML" "YEAR" "YY" "Z"))

(defconst dtl-types
  '("COPY" "MERGE" "AGGREGATE" "JOIN" "SORT"))

(defvar dtl-font-lock-defaults
  `((
     ;; stuff between "
     ;; ; : , ; { } =>  @ $ = are all special elements
     ("\\${?[#?]?\\([[:alpha:]_][[:alnum:]_]*}?\\|0\\)" . font-lock-variable-name-face) ;; $BLAH and ${BLAH}, but not %BLAH%
     ("\"\\.\\*\\?" . font-lock-string-face)
     ( ,(mapconcat 'identity dtl-commands "\\|") . font-lock-builtin-face)
     ;; ( ,(regexp-opt dtl-commands 'words) . font-lock-builtin-face)
     ( ,(regexp-opt dtl-keywords 'words) . font-lock-constant-face)
     ( ,(regexp-opt dtl-types 'words) . font-lock-type-face)
     (":\\|;\\|=\\|\\!=\\|/" . font-lock-keyword-face)
     )))

;; /DTL and /END are indent level 0
;; default for everything following a /DTL is indent level 1
;; if { appears in a previous line without a closing }, cur-indent += 1
;; if } appears in current line without an opening {. cur-indent -= 1
;; TODO: line continuations should indent past command (?)

(defun dtl-indent-line ()
  "Indent current line as DTL code."
  (interactive)
  (beginning-of-line)
  (let ((cur-level 1) (not-indented t))
    (cond ((looking-at "^[ \t]*\\(/DTL\\|/END\\)")
	   (setq cur-level 0))
	  ((looking-at "^[^{\n]*}")
	   (setq cur-level 1))
	  (t
	   (save-excursion
	     (while (and not-indented (not (bobp)))
	       (forward-line -1)
	       (cond
		((looking-at "^[^{\n]*{[^}\n]*$") ;; opening brace without closing brace on line
		 (progn
		   (setq cur-level (+ cur-level 1))
		   (setq not-indented nil)))
		((looking-at "^[^{\n]*}") ;; closing brace without opening brace on line
		 (progn
		   ;; (setq cur-level (- cur-level 1))
		   (setq not-indented nil))))))))
    (if cur-level
	(indent-line-to (* cur-level dtl-indent-level)))))

(defvar dtl-mode-syntax-table
  (let ((dtl-mode-syntax-table (make-syntax-table)))
    
					; This is added so entity names with underscores can be more easily parsed
    (modify-syntax-entry ?_ "w" dtl-mode-syntax-table)
    
					; Comment styles are same as C++
    (modify-syntax-entry ?/ ". 124b" dtl-mode-syntax-table)
    (modify-syntax-entry ?* ". 23" dtl-mode-syntax-table)
    (modify-syntax-entry ?\n "> b" dtl-mode-syntax-table)
    dtl-mode-syntax-table)
  "Syntax table for dtl-mode")

(defun dtl-run ()
  (interactive)
  (save-some-buffers)
  (save-excursion
    (let* ((fname (buffer-file-name))
	   (fdir (file-name-directory fname)))
      (cd fdir)
      (set (make-local-variable 'compile-command) (format ". ./job-envvars.sh && dmexpress /run %s" fname))
      ;; (call-interactively 'compile)
      (compile compile-command nil)
      )))


(defun dtl-mode ()
  "Major mode for editing Syncsort DTL dataflow language files"
  (interactive)
  (kill-all-local-variables)
  (set-syntax-table dtl-mode-syntax-table)
  (use-local-map dtl-mode-map)
  ;; set up font lock
  (set (make-local-variable 'font-lock-defaults) dtl-font-lock-defaults)
  ;; register our indentation function
  (set (make-local-variable 'indent-line-function) 'dtl-indent-line)  
  (require 'compile)
  (require 'cl) ;; needed for 'pushnew'
  (pushnew '(dtl "^DMExpress : (\\([A-Z]+\\))\\|at line \\([0-9]+\\) of \\(.+\\)" 3 2) compilation-error-regexp-alist-alist)
  (pushnew 'dtl compilation-error-regexp-alist)
  (setq major-mode 'dtl-mode)
  (setq mode-name "DTL")
  (run-hooks 'dtl-mode-hook))

(provide 'dtl-mode)

;; dtl-mode.el ends here
