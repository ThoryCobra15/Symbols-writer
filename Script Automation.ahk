#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
f12::
 MsgBox  put the names list in the clipboard and press enter 
 names:=clipboard
 areturn=`r`n
 names:=StrReplace(names, areturn , a_space)
 namesarray:=StrSplit(names,a_space)

 MsgBox  put the character list  in the clipboard and press enter 
 charactersarray:=object()
 characters:=clipboard 
 Loop, parse, characters, `n, `r  ; Specifying `n prior to `r allows both Windows and Unix files to be parsed.
  charactersarray.push(a_loopfield)

loop 10
 send % ":c:\" namesarray[a_index] "::" SubStr(charactersarray[a_index], 1, 1) "`r"
