
; Hotkeys related to the Command Prompt

; Directory ------------------------------
	
	; Any Window
		; #x - Sentinal, Exits script.

	; CMD
		; ^v - Pastes Clipboard at cursor
		; ^Del - Deletes all characters left of the cursor
		; ^Bs - Deletes entire line
		; ^g - Checks if your git repo is up to date with "origin/master"

	; File Explorer
		; ^cd - Opens CMD to the current directory
		;		& checks if git repo is up to date with "origin/master"

; Hotkeys ------------------------------

#SingleInstance Force
Exit 

#NoTrayIcon
#x:: 
	ExitApp 

#IfWinActive ahk_class ConsoleWindowClass 
	
	^v:: SendInput {Raw}%ClipBoard%

	^Del:: SendInput {Del 99}

	^Bs:: SendInput ^{Left}{Del 99}

	~g & f::
		KeyWait, Ctrl, D
		Gosub, ^Bs
		SendInput git fetch {Enter}
		SendInput git status origin/master {Enter}
		Return

	~g & s::
		KeyWait, Ctrl, D
		Gosub, ^Bs
		SendInput git status {Enter}
		Return

#IfWinActive

#IfWinActive ahk_class CabinetWClass

	^c:: 
		KeyWait, d, D
		Path = % GetPathFromExplorer()
		Run, cmd.exe, % Path
		
		; Future add a function to check for git files in higher dirs
		if(FileExist(Path . "/.git")) {
			WinWaitActive, ahk_class ConsoleWindowClass
			SendInput git fetch {Enter}
			SendInput git status origin/master {Enter}
		}

    	Return

#IfWinActive

; Functions ------------------------------

GetPathFromExplorer() {
	
	WinGet thisID, ID, A
	WinGetClass thisClass, ahk_id %thisID%
	WinGetText full_path, ahk_id %thisID%
	
	if (thisClass != "CabinetWClass") {
		Return -1
	}
	
	StringSplit, word_array, full_path, `n
	
	Loop, %word_array0% {
		IfInString, word_array%A_Index%, Address 
		{
			full_path := word_array%A_Index%
			break
		}
	}  

	full_path := RegExReplace(full_path, "^Address: ", "")

	StringReplace, full_path, full_path, `r, , all
	
	Return %full_path%
	
}