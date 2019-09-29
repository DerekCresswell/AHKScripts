
; Hotkeys related to the Mouse

; Directory ------------------------------
	
	; Any Window
		; #x - Sentinal, Exits script.
		; F1 - Press to toggle holding Mouse1, Hold to rapidly click Mouse1 

; Hotkeys ------------------------------

#SingleInstance Force
Exit 

#NoTrayIcon
#x:: 
	ExitApp 

F1:: Send % "{Click " . ( GetKeyState("LButton") ? "Up}" : "Down}" )
