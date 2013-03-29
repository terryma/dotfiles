tell application "iTerm"
	activate
	
	-- Count number of terminal windows
	set termcount to count of terminal
	
	-- If there are no terminal windows open, create a new one
	if termcount is 0 then
		set term to (make new terminal)
	else
		set term to (terminal 0)
	end if
	
	tell term
		-- Make a new session
		launch session "terryma"
		tell the last session
			set name to "desktop"
			write text "work"
		end tell
		launch session "terryma"
		tell the last session
			set name to "laptop"
			write text "tmux kill-session"
			write text "tmux attach -d"
			delay 1
			write text "t laptop"
		end tell
		
		-- Terminate first session
		terminate session 0
		-- Put it in the right place
		tell i term application "System Events" to keystroke "l" using {command down, control down, shift down, option down}
		tell i term application "System Events" to keystroke return
	end tell
end tell
