return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-telescope/telescope.nvim",
	},
	keys = {
		{ "<leader>lg", "<cmd>LazyGit<cr>",                                               desc = "LazyGit" },
		{ "<leader>Lg", function() require("telescope").extensions.lazygit.lazygit() end, desc = "LazyGit" }
	},
	config = function()
		require("telescope").load_extension("lazygit")
	end,
}
