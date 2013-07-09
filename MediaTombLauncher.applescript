(*
    Compile command:
        osacompile -s -o MediaTomb.app MediaTombLauncher.applescript
*)

property mediatomb : "/opt/local/bin/mediatomb"
property PID : null

on run
    set NIC to {}
    try
        set NIC to every paragraph of (do shell script "ifconfig | awk -F : '$1 ~ /^en[0-9]/ { print $1 }'")
    end try
    
    if length of NIC = 0 then
        display alert "有効なインターフェイスが見つかりませんでした" as warning
        quit
    else if length of NIC ≥ 2 then
        set NIC to choose from list NIC default items item 1 of NIC with title "MediaTomb"
        if NIC is false then quit
    end if
    
    try
        set PID to (do shell script mediatomb & space & "-e" & space & NIC & space & "&>/dev/null & echo $!")
    on error
        display alert "MediaTomb を起動できませんでした" message "パスが正しく設定されているか確認してください。" as warning
        quit
    end try
end run

on quit
    if PID ≠ null then
        try
            do shell script "kill" & space & PID
        on error
            display alert "MediaTomb の終了に失敗しました" message "手動で終了してください。" as warning
        end try
    end if
    continue quit
end quit