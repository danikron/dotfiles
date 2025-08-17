return {
	{
		'mbbill/undotree',
		branch = 'master',
		lazy = true,
		keys = {
			{ '<leader>u', "<cmd>UndotreeToggle<CR>" }
		},
		config = function()
			vim.keymap.set('n', '<leader>u', '<cmd>UndotreeToggle<CR>')
			vim.g.undotree_WindowLayout = 4
			vim.g.undotree_SetFocusWhenToggle = true
		end
	}
}
