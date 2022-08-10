return require("packer").startup(
  function()
    use("wbthomason/packer.nvim")
    use("folke/tokyonight.nvim")
    use{"nvim-telescope/telescope.nvim", tag = '0.1.0', requires = { {'nvim-lua/plenary.nvim'} }}
    use( "nvim-lua/plenary.nvim" )
    use{
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }
    use("ray-x/go.nvim")
    use{"neoclide/coc.nvim"}
end)

