return {
	{
		"bluz71/vim-moonfly-colors",
		name = "moonfly",
		lazy = false,
		priority = 1000,
		config = function()
			require("moonfly").custom_colors({
				bg = "#161819",
				fg = "#c5c8c6",
			})
			vim.cmd.colorscheme('moonfly')
		end,
	},
}
