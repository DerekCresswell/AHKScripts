
; Hotkeys related to the Command Prompt

; Directory
	
	; Any Window
		; #x - Sentinal, Exits script.

	; CMD
		; ^v - Pastes Clipboard at cursor
		; ^Del - Deletes all characters left of the cursor
		; ^Bs - Deletes entire line

#NoTrayIcon
#x:: 
	ExitApp 

#IfWinActive ahk_class ConsoleWindowClass 
	
	^v:: SendInput {Raw}%ClipBoard%

	^Del:: SendInput {Del 99}

	^Bs:: SendInput ^{Left}{Del 99}

#IfWinActive

