-- latex / markdown
return {
	{
		"lervag/vimtex",
		ft = { "tex" },
		config = function()
			vim.g.vimtex_view_general_viewer = "zathura"
			vim.g.vimtex_quickfix_mode = 1
			vim.g.tex_conceal = ""
			-- the default item indent is stupid
			vim.g.tex_indent_items = 0
		end,
	},

	-- latex preview... (kinda redundant ??)
	{
		"xuhdev/vim-latex-live-preview",
		ft = { "tex" },
		config = function()
			vim.g.livepreview_previewer = "okular"
			vim.g.livepreview_use_biber = 1
		end,
	},

	-- vim-markdown , for markdown editing--
	{
		"plasticboy/vim-markdown",
		ft = { "markdown" },
		config = function()
			vim.g.vim_markdown_math = 1
			vim.g.vim_markdown_folding_disabled = 1
			vim.g.vim_markdown_auto_insert_bullets = 0
		end,
	},

	-- markdown previewer
	-- install without yarn or npm
	{
		"iamcco/markdown-preview.nvim",
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = { "markdown" },
		config = function()
			vim.cmd([[
            let g:mkdp_open_to_the_world = 1
            let g:mkdp_browser = 'firefox'
            let g:mkdp_open_ip = '127.0.0.1'
            let g:mkdp_port = 6789
            let g:mkdp_refresh_slow = 1
            let g:mkdp_theme = 'light'
            let g:mkdp_preview_options = {
                \ 'mkit': {},
                \ 'katex': {},
                \ 'uml': {},
                \ 'maid': {},
                \ 'disable_sync_scroll': 1,
                \ 'sync_scroll_type': 'middle',
                \ 'hide_yaml_meta': 1,
                \ 'sequence_diagrams': {},
                \ 'flowchart_diagrams': {},
                \ 'content_editable': v:false,
                \ 'disable_filename': 0
                \ }

                ]])
		end,
	},
}
