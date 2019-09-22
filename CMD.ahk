
; Hotkeys related to the Command Prompt

#NoTrayIcon
#x:: 
	ExitApp 

#IfWinActive ahk_class ConsoleWindowClass 
	
	^v:: SendInput {Raw}%ClipBoard%

#IfWinActive