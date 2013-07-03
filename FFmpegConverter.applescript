property ffmpeg : "/usr/local/bin/ffmpeg"

tell application "Finder" to set selections to selection as alias list
repeat with x in selections
	if folder of (info for x) ≠ true then
		set x to quoted form of POSIX path of x
		tell application "Terminal" to activate (do script ffmpeg & space & "-i" & space & x & space & "-acodec copy -vcodec copy" & space & x & ".mp4; read; exit")
	end if
end repeat
