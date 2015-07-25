
function printf(s, ...)
	return io.write(s:format(...))
end

function xarray(N)
	return xvarray(N, 0)
end

function xvarray(N, init_val)
	local a = {}
	for i = 1, N do
		a[i] = init_val
	end
	return a
end

function xrandia(N, low, high)
	local a = {}
	for i = 1, N do
		a[i] = math.random(low, high)
	end
	return a
end

function _xprinta(a)
	for _, v in ipairs(a) do
		io.write(v .. ', ')
	end
	io.write('\n')
end

function xprinta(a, istart, iend)
	istart = istart or 1
	iend = iend or #a
	for i = istart, iend do
		io.write(a[i] .. ', ')
	end
	io.write('\n')
end

function xcopya(a)
	local na = {}
	for i, v in ipairs(a) do
		na[i] = v
	end
	return na
end

function xcopytoa(dst, src)
	for i, v in ipairs(src) do
		dst[i] = v
	end
end

function xselect_sort(a)
	local N = #a
	for i = 1, N - 1 do
		local mini = i
		for j = i + 1, N do
			if a[j] < a[mini] then
				mini = j
			end
		end
		if i ~= mini then
			a[i], a[mini] = a[mini], a[i]
		end
	end
end

function xinsert_sort(a)
	local N = #a
	for i = 2, N do
		local tmp = a[i]
		j = i - 1
		while j > 0 and tmp < a[j] do
			a[j+1] = a[j]
			j = j - 1
		end
		a[j+1] = tmp
	end
end

function xbubble_sort(a)
	local N = #a
	for i = 1, N - 1 do
		local stop = true
		for j = 1, N - i do
			if a[j+1] < a[j] then
				a[j], a[j+1] = a[j+1], a[j]
				stop = false
			end
		end
		if stop then break end
	end
end

function xidiv(a, b)
	return math.floor(a/b)
end

function _merge(a, istart, imid, iend, tmpa)
	local index1 = istart
	local index = istart
	local index2 = imid + 1
	while index1 <= imid and index2 <= iend do
		if a[index1] < a[index2] then
			tmpa[index] = a[index1]
			index1 = index1 + 1
		else
			tmpa[index] = a[index2]
			index2 = index2 + 1
		end
		index = index + 1
	end
	while index1 <= imid do
		tmpa[index] = a[index1]
		index = index + 1; index1 = index1 + 1
	end
	for i = istart, index2 - 1 do
		a[i] = tmpa[i]
	end
end

function _merge_sort(a, istart, iend, tmpa)
	if istart < iend then
		local imid = xidiv(istart + iend, 2)
		_merge_sort(a, istart, imid, tmpa)
		_merge_sort(a, imid + 1, iend, tmpa)
		_merge(a, istart, imid, iend, tmpa)
	end
end

function xmerge_sort(a)
	local N = #a
	local tmpa = xvarray(N, a[1])
	_merge_sort(a, 1, N, tmpa)
	tmpa = nil
end

function _quick_sort(a, istart, iend)
	if istart >= iend then return end
	local low, high, tmp = istart, iend, a[istart]
	while low ~= high do
		while low ~= high and tmp <= a[high] do
			high = high - 1
		end
		if low ~= high then a[low] = a[high] end
		while low ~= high and tmp >= a[low] do
			low = low + 1
		end
		if low ~= high then a[high] = a[low] end
	end
	a[low] = tmp
	_quick_sort(a, istart, low - 1)
	_quick_sort(a, low + 1, iend)
end

function xquick_sort(a)
	_quick_sort(a, 1, #a)
end

local function _percolate_down(a, i, N)
	local parent, tmp = i, a[i]
	while parent * 2 <= N do
		local child = parent * 2
		if child < N and a[child] < a[child + 1] then
			child = child + 1
		end
		if tmp < a[child] then
			a[parent] = a[child]
		else
			break
		end
		parent = child
	end
	a[parent] = tmp
end

function xheap_sort(a)
	local N = #a
	for i = xidiv(N, 2), 1, -1 do
		_percolate_down(a, i, N)
	end
	for i = N, 2, -1 do
		a[1], a[i] = a[i], a[1]
		_percolate_down(a, 1, i-1)
	end
end





