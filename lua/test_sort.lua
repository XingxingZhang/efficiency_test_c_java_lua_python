
require 'xutils'
require 'torch'

local function runSort(arr, sort_alg, sort_alg_lbl)
	local tmp_arr = xcopya(arr)
	print(string.format('==%s demo==', sort_alg_lbl))
	print 'before sort'
	if #arr <= 20 then
		xprinta(arr)
	end
	local tstart = os.clock()
	sort_alg(arr)
	printf('time spend %f s\n', os.clock() - tstart)
	print 'after sort'
	if #arr <= 20 then
		xprinta(arr)
	end
	print(string.format('==%s demo done==\n', sort_alg_lbl))
	xcopytoa(arr, tmp_arr)
	tmp_arr = nil
end

local function loadRandNumbers(infile)
	local tstart = os.clock()
	local fin = io.open(infile, 'r')
	local line = nil
	local arr = {}
	while true do
		line = fin:read()
		if not line then break end
		table.insert(arr, tonumber(line))
	end
	fin:close()
	printf('load time %f s\n', os.clock() - tstart)

	printf('arr size = %d\n', #arr)

	return arr
end

local function loadRandNumbers2(infile)
	local tstart = os.clock()
	local fin = io.open(infile, 'r')
	local line = nil
	local arr = {}
	while true do
		line = fin:read('*number')
		if not line then break end
		table.insert(arr, line)
	end
	fin:close()
	printf('load time %f s\n', os.clock() - tstart)

	printf('arr size = %d\n', #arr)

	return arr
end

local function getArgs()
	local cmd = torch.CmdLine()
	cmd:text('test Lua native sort algorithm and qsort I implmented')
	cmd:option('-infile', '', 'input number file')
	
	return cmd:parse(arg)
end

local function main()
	local opts = getArgs()
	local arr = loadRandNumbers2(opts.infile)
	runSort(arr, table.sort, 'native sort')
	runSort(arr, xquick_sort, 'quick sort')
end

main()

