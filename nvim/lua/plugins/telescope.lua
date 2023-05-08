return {
	"nvim-telescope/telescope.nvim",
	dependencies = {"nvim-lua/plenary.nvim"},
    keys = {
        { "<leader><space>", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
        { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
        { "<leader>/", "<cmd>Telescope live_grep<cr>", desc = "Live Grep" },
    }
}
