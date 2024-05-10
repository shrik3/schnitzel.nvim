-- latex / markdown
return {
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
