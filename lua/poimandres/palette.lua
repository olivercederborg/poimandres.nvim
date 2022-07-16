local variants = {
	main = {
		yellow = '#FFFAC2',
		teal1 = '#5DE4C7',
		teal2 = '#5FB3A1',
		teal3 = '#42675A',
		blue1 = '#89DDFF',
		blue2 = '#ADD7FF',
		blue3 = '#91B4D5',
		blue4 = '#7390AA',
		pink1 = '#FAE4FC',
		pink2 = '#FCC5E9',
		pink3 = '#D0679D',
		blueGray1 = '#A6ACCD',
		blueGray2 = '#767C9D',
		background1 = '#506477',
		background2 = '#303340',
		background3 = '#1B1E28',
		text = '#E4F0FB',
		gray = '#2A2C34',
		none = 'NONE',
	},
}

local palette = {}

palette = variants.main

-- if vim.o.background == "light" then
-- 	palette = variants.main
-- else
-- 	palette = variants[(vim.g.poimandres_variant == "storm" and "storm") or "main"]
-- end

return palette
