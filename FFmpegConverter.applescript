tell application "Finder" to set theList to selection as alias list
repeat with x in theList
    if folder of (info for x) ≠ true then
        set x to quoted form of POSIX path of x
        tell application "Terminal" to activate (do script "/usr/local/bin/ffmpeg -i" & space & x & space & "-acodec copy -vcodec copy" & space & x & ".mp4; read; exit")
    end if
end repeat
