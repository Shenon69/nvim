return {
	"folke/noice.nvim",
	event = "VeryLazy",
	enabled = true,
	opts = {},
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			notify = {
				enabled = true,
				view = "notify",
			},
			lsp = {
				-- Override markdown rendering to use Treesitter for **cmp** and other plugins
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},
			-- Enable presets for easier configuration
			presets = {
				bottom_search = true, -- Use a classic bottom cmdline for search
				command_palette = true, -- Position the cmdline and popupmenu together
				long_message_to_split = true, -- Send long messages to a split
				inc_rename = false, -- Disable an input dialog for inc-rename.nvim
				lsp_doc_border = true, -- Add a border to hover docs and signature help
			},
		})

		-- Setup nvim-notify with custom styling
		require("notify").setup({
			background_colour = "#000000",
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
		})
	end,
}
