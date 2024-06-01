return {
	"LintaoAmons/cd-project.nvim",
	tag = "v0.6.1", -- Optional, You can also use tag to pin the plugin version for stability
	config = function()
		vim.keymap.set("n", "<leader>p", "<cmd>CdProject<cr>", { desc = "Select project" })

		require("cd-project").setup({
			-- this json file is acting like a database to update and read the projects in real time.
			-- So because it's just a json file, you can edit directly to add more paths you want manually
			projects_config_filepath = vim.fs.normalize(vim.fn.stdpath("config") .. "/cd-project.nvim.json"),
			-- this controls the behaviour of `CdProjectAdd` command about how to get the project directory
			project_dir_pattern = { ".git", ".gitignore", "Cargo.toml", "package.json", "go.mod" },
			choice_format = "name", -- optional, you can switch to "name" or "path"
			projects_picker = "telescope", -- optional, you can switch to `telescope`
			auto_register_project = false, -- optional, toggle on/off the auto add project behaviour
			hooks = {
				{
					callback = function(dir)
						vim.notify("Opening: " .. dir)
						vim.cmd("Neotree dir=" .. dir)
					end,
				},
			},
		})
	end,
}
