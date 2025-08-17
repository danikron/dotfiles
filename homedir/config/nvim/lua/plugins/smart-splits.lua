return {
	{
		'mrjones2014/smart-splits.nvim',
		build = './kitty/install-kittens.bash',
		config = function()
			vim.keymap.set('n', '<A-h>', require('smart-splits').resize_left)
			vim.keymap.set('n', '<A-j>', require('smart-splits').resize_down)
			vim.keymap.set('n', '<A-k>', require('smart-splits').resize_up)
			vim.keymap.set('n', '<A-l>', require('smart-splits').resize_right)
			vim.keymap.set('n', '<A-Left>', require('smart-splits').resize_left)
			vim.keymap.set('n', '<A-Down>', require('smart-splits').resize_down)
			vim.keymap.set('n', '<A-Up>', require('smart-splits').resize_up)
			vim.keymap.set('n', '<A-Right>', require('smart-splits').resize_right)
			-- moving between splits
			vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
			vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
			vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
			vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
			vim.keymap.set('n', '<C-Left>', require('smart-splits').move_cursor_left)
			vim.keymap.set('n', '<C-Down>', require('smart-splits').move_cursor_down)
			vim.keymap.set('n', '<C-Up>', require('smart-splits').move_cursor_up)
			vim.keymap.set('n', '<C-Right>', require('smart-splits').move_cursor_right)
			vim.keymap.set('n', '<C-\\>', require('smart-splits').move_cursor_previous)
			-- swapping buffers between windows
			vim.keymap.set('n', '<leader><leader>h', require('smart-splits').swap_buf_left)
			vim.keymap.set('n', '<leader><leader>j', require('smart-splits').swap_buf_down)
			vim.keymap.set('n', '<leader><leader>k', require('smart-splits').swap_buf_up)
			vim.keymap.set('n', '<leader><leader>l', require('smart-splits').swap_buf_right)
		end
	}
}
