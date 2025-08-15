return {
	{
		"m4xshen/smartcolumn.nvim",
		opts = {},
		config = function()
			require("smartcolumn").setup({
				colorcolumn = "100",
				disabled_filetypes = { "help", "text", "markdown", "startup" }
			})
		end
	}
}
