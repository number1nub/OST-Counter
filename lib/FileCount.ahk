FileCount(dir, recurse:="") {
	cnt:=0
	Loop, Files, %dir%, % "D" (recurse ? "R":"")
		cnt++
	return cnt
}