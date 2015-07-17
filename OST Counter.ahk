#NoEnv
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%

TrayMenu()
rootDir   := GetRootDir()
ostCounts := {ost:[], none:[]}
ostStats  := {}
tmpMax    := {}

SplashImage,, y50 w645 h150 B1, Please wait..., % "Analyzing " FileCount(rootDir) " Tool Folders`n`n",
Loop, Files, %rootDir%, D
{
	RegExMatch(A_LoopFileName, "i)RSS\s*(?P<Num>\d{4,})", rss)
	cnt := FileCount(A_LoopFileFullPath "\*OST*")
	cnt > 1 ? cnt-- : null
	ostCounts[cnt>0 ? "ost":"none"].Push(cnt)
	tmpMax := cnt>tmpMax.val ? {val:cnt, tool:rssNum} : tmpMax
}
;************** DEBUGGING **************
if (m(tmpMax.val " for tool " tmpMax.tool, "btn:yn", "ico:!") != "YES")
	ExitApp
;*************************************** 
ostCounts.Max := tmpMax
SplashImage, Off

ostStats := {Avg:Average(ostCounts.ost), Total:FileCount(rootDir), OstCount:ostCounts.MaxIndex(), Max:}


;Get average number of OSTs
m("The average number of OSTs for the " ostStats.OstCount " tool(s) that had at least 1 OST is:", ostStats.Avg, "", "ico:i")
ExitApp



#Include lib\m.ahk
#Include lib\FileCount.ahk
#Include lib\GetRootDir.ahk
#Include lib\Average.ahk
#Include lib\Exit.ahk
#Include lib\Reload.ahk
#Include lib\TrayMenu.ahk