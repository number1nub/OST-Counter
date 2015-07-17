Average(info) {
	if (!IsObject(info))
		return
	sum := 0
	for c, v in info
		sum += v
	return (sum // info.MaxIndex())
}