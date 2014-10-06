" Licensed to the Apache Software Foundation (ASF) under one
" or more contributor license agreements.  See the NOTICE file
" distributed with this work for additional information
" regarding copyright ownership.  The ASF licenses this file
" to you under the Apache License, Version 2.0 (the
" "License"); you may not use this file except in compliance
" with the License.  You may obtain a copy of the License at
" 
"     http://www.apache.org/licenses/LICENSE-2.0
" 
" Unless required by applicable law or agreed to in writing, software
" distributed under the License is distributed on an "AS IS" BASIS,
" WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
" See the License for the specific language governing permissions and
" limitations under the License.


" Vim syntax file
" Language:     dtl
" Maintainer:   auto generated
" Filenames:    *.dtl

" To setup and automatically load syntax hilighting for *.dtl files 
" Copy this file into ~./vim/syntax
" add the lines below to ~/.vimrc
" syntax enable
" autocmd BufRead,BufNewFile *.dtl set filetype=dtl

if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

" Always ignore case
syn case ignore

" Add "/" and "-" as a valid part of word 
setlocal iskeyword+=/
setlocal iskeyword+=-

" General keywords 
syn keyword dtlOptionKeyword    /COLLATINGSEQUENCE /CONDITION /CUSTOMTASK
syn keyword dtlOptionKeyword    /DATADICTIONARY /DATASIZE /DBCOLUMNSEXTRACT
syn keyword dtlOptionKeyword    /DBCONNECTION /DBDATA /DBINPUT /DBOUTPUT
syn keyword dtlOptionKeyword    /DEFAULTFLOW /DELIMITEDRECORDLAYOUT /DTL /END
syn keyword dtlOptionKeyword    /FILE /FILTER /FLOW /GROUPBY /INBUFFER /INFILE
syn keyword dtlOptionKeyword    /INMAXRECORDLENGTH /INPIPE /INPROCEDURE /JOINKEYS
syn keyword dtlOptionKeyword    /KEYS /LOGOPTIONS /MAPREDUCE /MEMORY
syn keyword dtlOptionKeyword    /MQCONNECTION /MQFIELDSEXTRACT /MQINPUT /MQOUTPUT
syn keyword dtlOptionKeyword    /NOPROMPT /NULLIF /OUTBUFFER /OUTFILE /OUTPIPE
syn keyword dtlOptionKeyword    /OUTPROCEDURE /PADBYTE /PARTITION /RECORDLAYOUT
syn keyword dtlOptionKeyword    /REFORMAT /SERVERCONNECTION /SFDCCONNECTION
syn keyword dtlOptionKeyword    /SFDCDATA /SFDCFIELDSEXTRACT /SFDCINPUT
syn keyword dtlOptionKeyword    /SFDCOUTPUT /STABLE /SUBJOB /SUMMARY /TASK
syn keyword dtlOptionKeyword    /TASKDOCUMENTATION /TASKTYPE /VALUE /WORKSPACE
syn keyword dtlOptionKeyword    /XMLEXTRACT

syn keyword sdkOptionKeyword    /AGGREGATE /BEGIN /CENTURYWINDOWSTART
syn keyword sdkOptionKeyword    /CHECKSEQUENCE /COLLECT /COLUMNS
syn keyword sdkOptionKeyword    /COMPRESSWORKFILES /CONVERTEDFIELD /COPY /DEBUG
syn keyword sdkOptionKeyword    /DEFINITION /DELETE /DERIVEDFIELD /DEVELOPEDON
syn keyword sdkOptionKeyword    /DIMENSIONSET /DISPLAY /DISPLAYTASK
syn keyword sdkOptionKeyword    /DOCUMENTATION /DYNAMICLAYOUT /EDIT /EXTRACTAS /F
syn keyword sdkOptionKeyword    /FI /FIELDS /HEADER /HIDEINFILESFROMSETSOURCE
syn keyword sdkOptionKeyword    /HIDEOUTFILESFROMSETTARGET /HIERARCHY /IGNORE
syn keyword sdkOptionKeyword    /INCLUDE /INSERT /JOIN /MERGE /MICROFOCUSJCL
syn keyword sdkOptionKeyword    /NOEXECUTE /NOINTERRUPT /NONULLCHARACTERS
syn keyword sdkOptionKeyword    /NOPRODUCTID /NOTSORTEDOUTPUT /OMIT
syn keyword sdkOptionKeyword    /OUTRECORDCOUNT /PADKEY /PADRECORD /PAGEFOOTER
syn keyword sdkOptionKeyword    /PAGEHEADER /QUIT /REPORT /RUN /RUNTIMEVARIABLES
syn keyword sdkOptionKeyword    /SAPCONNECTION /SAPINPUT /SAVE /SECTION
syn keyword sdkOptionKeyword    /SECTIONFOOTER /SECTIONHEADER /SILENT /SKIPBLANK
syn keyword sdkOptionKeyword    /SKIPRECORD /SKIPSHORT /STATISTICS /STOPAFTER /SU
syn keyword sdkOptionKeyword    /SUM /SUMM /SUMMA /SUMMAR /SUMMARIZE /TITLE
syn keyword sdkOptionKeyword    /TRAILER /UNIXSORTCOMPATIBLE /WARNINGS

syn keyword dtlDataTypeKeyword    AN BIT CHARACTER DATE DATETIME DFLOATEN
syn keyword dtlDataTypeKeyword    FLOATINT LOB LP LS LZ PD SN TP TS UINT ZD

syn keyword dtlOperatorKeyword    AND CT GE GT LE LT MT NOT OR

syn keyword dtlArgumentKeyword    ABORTIF ACUCOBOL ADDROUT AGGREGATE ALIAS
syn keyword dtlArgumentKeyword    ALIGNED2 ALIGNED4 ALL ALLOWREORDERING
syn keyword dtlArgumentKeyword    ALLVALUELABELS ALWAYS ANSI ANY APACHEAVRO
syn keyword dtlArgumentKeyword    APACHEPARQUET APPEND ARGUMENTS ASCENDING ASCII
syn keyword dtlArgumentKeyword    AUTHENTICATION AUTHOR AUTODETECT AVERAGE
syn keyword dtlArgumentKeyword    BASELAYOUT BIGENDIAN BITS BL BLO BLOC BLOCK
syn keyword dtlArgumentKeyword    BLOCKED BLOCKSIZE BOM BUCKET BYCONDITION BYDAY
syn keyword dtlArgumentKeyword    BYFIELD BYHOUR BYMINUTE BYMONTH BYSECOND BYSIZE
syn keyword dtlArgumentKeyword    BYTES BYYEAR BZIP2 CALLONCE CALLREPEATEDLY
syn keyword dtlArgumentKeyword    CLIENT COBOL COLLATINGSEQUENCES COLUMNS
syn keyword dtlArgumentKeyword    COLUMNSPACING COMMENTS COMMITINTERVAL COMPANY
syn keyword dtlArgumentKeyword    COMPRESSED CONDITION CONDITIONS CONNECTDIRECT
syn keyword dtlArgumentKeyword    CONTIGUOUS COPY COUNT CP273GERMANY CP277DENMARK
syn keyword dtlArgumentKeyword    CP278SWEDEN CP280ITALY CP284SPAIN CP285UK
syn keyword dtlArgumentKeyword    CP297FRANCE CP37USA CP500GLOBAL CP871ICELAND CR
syn keyword dtlArgumentKeyword    CREATE CREATECOMPOSITE CRLF CUBE CUSTOMSTREAM
syn keyword dtlArgumentKeyword    DATABASECONNECTIONS DAY DB2 DBMS DD DEFAULT
syn keyword dtlArgumentKeyword    DEFAULTFIXEDFORMAT DELETE DELIMITED
syn keyword dtlArgumentKeyword    DERIVEDFIELDS DESCENDING DFLOAT DIMENSIONSET
syn keyword dtlArgumentKeyword    DIMENSIONSETS DIRECT DISCARDAFTER DISCARDBLANK
syn keyword dtlArgumentKeyword    DISCARDFIRST DISCARDSHORT DISKBLOCKS
syn keyword dtlArgumentKeyword    DISPLAYRECORD DMEXPRESS DOCUMENTATION
syn keyword dtlArgumentKeyword    DROPNULLINFORMATION DTD DY DYNAMIC
syn keyword dtlArgumentKeyword    EACHPARTITION EBCDIC ELSE EMPTY EN ENCLOSEDBY
syn keyword dtlArgumentKeyword    ENCODING ENCRYPTEDPASSWORD ENDOFTASK EQ
syn keyword dtlArgumentKeyword    ERRLIMIT ERROR EXECUTABLE EXITSTATUS
syn keyword dtlArgumentKeyword    EXPANDWILDCARDS EXPORT EXTERNAL EXTRACT
syn keyword dtlArgumentKeyword    EXTRACTAS FASCII FASTLOAD FDISCARDAFTER
syn keyword dtlArgumentKeyword    FDISCARDBLANK FDISCARDFIRST FDISCARDSHORT
syn keyword dtlArgumentKeyword    FEBCDIC FIELD FIELDS FIELDSEPARATOR FILE FILLER
syn keyword dtlArgumentKeyword    FIRST FIXED FLOAT FLOW FOLDED FOLLOWINGTASK
syn keyword dtlArgumentKeyword    FORTRANUNFORMATTED FSKIPBLANK FSKIPRECORD
syn keyword dtlArgumentKeyword    FSTOPAFTER FTP FULLPATH FUNCTIONCALL
syn keyword dtlArgumentKeyword    GENERATEJOBSCRIPT GIGABYTES GZIP HDFS HEADER
syn keyword dtlArgumentKeyword    HFTP HIERARCHIES HIERARCHY HIGH HIGHCOMPRESSION
syn keyword dtlArgumentKeyword    HOUR HTTP HTTPS IEEE IF INCLUDE INCLUDEAFTER
syn keyword dtlArgumentKeyword    INCLUDEBEFORE INDEXED INSERT INSTANCES INTEGER
syn keyword dtlArgumentKeyword    JOIN KERBEROSAD KEYEDINDEX KILOBYTES LAST
syn keyword dtlArgumentKeyword    LAYOUT LAYOUTNAME LAYOUTS LEAF LEFTSIDE LEVEL
syn keyword dtlArgumentKeyword    LF LINES LOCALE LOW MAINFRAME MAINFRAMEFIXED
syn keyword dtlArgumentKeyword    MAINFRAMEJOBCARD MAINFRAMEUNBLOCKEDVARIABLE
syn keyword dtlArgumentKeyword    MAINFRAMEVARIABLE MAINFRAMEVSAM MAPPINGS MAPTO
syn keyword dtlArgumentKeyword    MATCH MAXIMUM MEGABYTES MERGE METADATAID
syn keyword dtlArgumentKeyword    MFCOBOL MFFIXED MFLINESEQUENTIAL MFVARIABLE
syn keyword dtlArgumentKeyword    MINIMUM MINUTE MIXEDENCODINGS MM MN
syn keyword dtlArgumentKeyword    MODIFICATION MON MONTH MOVEAFTER MOVEBEFORE
syn keyword dtlArgumentKeyword    MQCONNECTIONS MULTINATIONAL NAME NAMEDPIPE
syn keyword dtlArgumentKeyword    NAMESRECORD NC NE NEWLINE NEWPAGE NL NM NOBLANK
syn keyword dtlArgumentKeyword    NOCOLUMNHEADINGS NODETAIL NODUPLICATE NOEMPTY
syn keyword dtlArgumentKeyword    NOFIELDENCODINGS NOFIELDSEPARATOR NONDICTIONARY
syn keyword dtlArgumentKeyword    NONE NONPRINTABLE NORMALIZE NOSKIP NOTDIRECT
syn keyword dtlArgumentKeyword    NOTENCLOSED NOTNULLABLE NOWARN NULL NULLABLE
syn keyword dtlArgumentKeyword    NULLBYTEPREFIX NULLCHAR NULLIFEMPTY NUMBER
syn keyword dtlArgumentKeyword    OBJECT ODBC OFF OFFSPRING OMIT ON ONBREAK ONLY
syn keyword dtlArgumentKeyword    OPEN OPENBRACKET ORACLE ORPHANVALUES OS OUTPUT
syn keyword dtlArgumentKeyword    OUTRECORDCOUNT OVERWRITE PAGENUMBER PAGESTART
syn keyword dtlArgumentKeyword    PAGETOP PAIRED PARAMETEREXTRACT PARAMETERFILE
syn keyword dtlArgumentKeyword    PARAMETERIN PARAMETERS PARENT PARTITION
syn keyword dtlArgumentKeyword    PARTITIONCOUNT PARTITIONSIZE PNODE PORT
syn keyword dtlArgumentKeyword    POSITIONAL PREAGGREGATED
syn keyword dtlArgumentKeyword    PRESERVENULLINFORMATION PRESORTED PREVIOUSTASK
syn keyword dtlArgumentKeyword    PRIMARYKEY PUBLICKEY QUERY QUEUE RANDOM RDW4
syn keyword dtlArgumentKeyword    RECORDNUMBER RECORDS RECURSIVE RELATIVE REPEAT
syn keyword dtlArgumentKeyword    REPLACEWITH RETAINARRAY RETAINCOMPOSITE
syn keyword dtlArgumentKeyword    RETAINIF RFA RFM RIDX RIGHTSIDE ROLLUP ROOT
syn keyword dtlArgumentKeyword    ROUNDROBIN ROUNDSIZE RUNCOUNT RUNTIMEVARIABLES
syn keyword dtlArgumentKeyword    RUNTOTAL SAPCONNECTIONS SCHEMA SECOND
syn keyword dtlArgumentKeyword    SEQUENTIAL SERVERCONNECTION SERVERCONNECTIONS
syn keyword dtlArgumentKeyword    SESSIONS SFDCCONNECTIONS SFTP SHOWOPTIONS SIDE1
syn keyword dtlArgumentKeyword    SIDE2 SIZE SKIPFIELDS SKIPLEVELS SLEEP SOR SORT
syn keyword dtlArgumentKeyword    SORTED SORTEDOUTPUT SOURCE SOURCEANDTARGET
syn keyword dtlArgumentKeyword    SOURCECOMPRESSIONFORMAT SOURCEENCODING SOURCES
syn keyword dtlArgumentKeyword    SQL SQRT START STATISTICS STATUS STCL STCR
syn keyword dtlArgumentKeyword    STDIN STDOUT STLF STR STREAM STRING SUBCUBE
syn keyword dtlArgumentKeyword    SUBSTRING SUCCESSIF SYBASE SYMBOLS SYNCSORT TAB
syn keyword dtlArgumentKeyword    TABL TABLE TABLEA TABLEAU TARGETS
syn keyword dtlArgumentKeyword    TASKDOCUMENTATION TASKID TASKSETTING TBLOCK
syn keyword dtlArgumentKeyword    TENACITY TERABYTES TERADATA TEXT THEN TIME
syn keyword dtlArgumentKeyword    TIMEMASK TIMESTAMP TIMEZONE TIMEZONEHOUR
syn keyword dtlArgumentKeyword    TIMEZONEMINUTE TITLE TODAY TOTAL TOTEXT TREATAS
syn keyword dtlArgumentKeyword    TRUNCATE TRUNCATEANDINSERT UINTEGER UNALIGNED
syn keyword dtlArgumentKeyword    UNCOMPRESSED UNIX UNIXSORTDEFAULT UNPAIRED
syn keyword dtlArgumentKeyword    UNSELECTEDRECORDS UPDATE UPPER USER UTF-16
syn keyword dtlArgumentKeyword    UTF-16BE UTF-16LE UTF-32 UTF-32BE UTF-32LE
syn keyword dtlArgumentKeyword    UTF-8 UTILITY VAL VALU VALUE VALUES VARIABLE
syn keyword dtlArgumentKeyword    VERIFY VERIFYORDER VERSION VFC VIEWAS VSAM
syn keyword dtlArgumentKeyword    VSCOBOL WARN WARNINGS WEBHDFS WHENMATCHED
syn keyword dtlArgumentKeyword    WHENNOTMATCHED WIDTH WINDOWS WORKDATABASE
syn keyword dtlArgumentKeyword    WORKDIR XML YEAR YY

syn keyword dtlFunction    Abs CRC32 CharacterLengthOf DateAdd DateDiff
syn keyword dtlFunction    DateLastDay DatePart Encode EvaluateExpressionList
syn keyword dtlFunction    Extract FindContainedValue GetExternalFunctionValue
syn keyword dtlFunction    GetUserDefinedValue IfCompares IfContainsAny
syn keyword dtlFunction    IfEqualsAny IfMatches IfNull IfRecordJoined
syn keyword dtlFunction    IfRecordOrigin IfThenElse InString IsSubcubeRecord
syn keyword dtlFunction    IsValidDate IsValidNumber LengthOf Lookup MD5 Mod Pad
syn keyword dtlFunction    Pow Rand RegExReplace Replace Round
syn keyword dtlFunction    SetUserDefinedValue SourceFullName SourceName Sqrt
syn keyword dtlFunction    Substring TargetRecordNumber ToChar ToDate ToFile
syn keyword dtlFunction    ToLower ToNumber ToText ToUpper Today Translate Trim
syn keyword dtlFunction    Truncate URLDecode

" Strings (single- and double-quote)
syn region dtlString           start=+"+  skip=+\\\\\|\\"+  end=+"+
syn region dtlString           start=+'+  skip=+\\\\\|\\'+  end=+'+
syn region dtlComment          start="/\*"  end="\*/"


" Define the default highlighting.
if version >= 508 || !exists("did_dtl_syn_inits")
  if version < 508
    let did_dtl_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink dtlOptionKeyword            Statement
  HiLink sdkOptionKeyword            Special
  HiLink dtlArgumentKeyword            PreProc
  HiLink dtlFunction            FUNCTION
  HiLink dtlDataTypeKeyword            TYPE
  HiLink dtlOperatorKeyword            Operator
  HiLink dtlString            String
  HiLink dtlComment            Comment

  delcommand HiLink
endif 

let b:current_syntax = "dtl"

