
; Hotkeys related to the Command Prompt

#NoTrayIcon
#x:: 
	ExitApp 

#IfWinActive ahk_class ConsoleWindowClass 
	
	^v:: SendInput {Raw}%ClipBoard%

	^Del:: SendInput {Del 99}

	^Bs:: SendInput ^{Left}{Del 99}

#IfWinActive