
require 'torch'

local function getOpts()
	local cmd = torch.CmdLine()
	cmd:text('Generator random integers')
	cmd:text()
	cmd:option('-nrand', 10000, 'number of random integers to be generated')
	cmd:option('-seed', 1, 'random seed')
	cmd:option('-maxv', 10000, 'maximum value')
	cmd:option('-minv', 1, 'minimum value')
	cmd:option('-outfile', 'rnd.txt', 'output file for random numbers')

	return cmd:parse(arg)
end

local function generateRandomNumbers(opts)
	math.randomseed(opts.seed)
	local fout = io.open(opts.outfile, 'w')
	for i = 1, opts.nrand do
		local val = math.random(opts.minv, opts.maxv)
		fout:write(string.format('%d\n', val))
	end
	fout:close()
end

local function main()
	local opts = getOpts()
	print(opts)
	generateRandomNumbers(opts)
end

main()

