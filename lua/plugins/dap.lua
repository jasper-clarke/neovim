return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			require("dapui").setup()

			-- local path = require("mason-registry").get_package("php-debug-adapter"):get_install_path()

			-- dap.adapters.php = {
			-- 	type = "executable",
			-- 	command = "node",
			-- 	args = { path .. "/extension/out/phpDebug.js" },
			-- }
		end,
	},
	"mfussenegger/nvim-lint",
	config = function()
		require("lint").linters_by_ft = {
			-- php = { "phpcs" },
		}
	end,
}
