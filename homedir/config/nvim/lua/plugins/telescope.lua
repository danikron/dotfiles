return {
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.8',
		dependencies = {
			'nvim-lua/plenary.nvim',
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
		},
		config = function()
			require('telescope').setup {
				-- pickers = {
				-- 	find_files = {
				-- 		theme = "ivy"
				-- 	}
				-- },
				extensions = {
					fzf = {}
				}
			}
			require('telescope').load_extension('fzf')
			vim.keymap.set("n", "<leader>fd", require('telescope.builtin').find_files, { desc = 'Telescope find files' })
			vim.keymap.set("n", "<leader>fh", require('telescope.builtin').help_tags, { desc = 'Telescope help tags' })
			vim.keymap.set("n", "<leader>fg", require('telescope.builtin').live_grep, { desc = 'Telescope live grep' })
			vim.keymap.set("n", "<leader>en", function()
				require('telescope.builtin').find_files {
					cwd = vim.fn.stdpath("config")
				}
			end)
			vim.keymap.set("n", "<leader>ep", function()
				require('telescope.builtin').find_files {
					cwd = vim.fs.joinpath(vim.fn.stdpath("data"), "lazy")
				}
			end, { desc = 'Telescope config files' })
			vim.keymap.set('n', '<leader>/', function()
				require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
					previewer = false,
				})
			end, { desc = 'Telescope fuzzily search in current buffer' })
		end
	}
}
