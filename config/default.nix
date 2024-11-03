{
  imports = [
    ./options.nix
    ./plugins.nix
    ./keymaps.nix
  ];

  colorschemes.ayu = {
    enable = true;
    settings = {
      mirage = false;
    };
  };

  #config.extraconfiglua = ''
  #  vim.api.nvim_create_autocmd("lspattach", {                           
  #    callback = function(args)                                          
  #      local bufnr = args.buf ---@type number                           
  #      local client = vim.lsp.get_client_by_id(args.data.client_id)     
  #      if client.supports_method("textdocument/inlayhint") then         
  #        vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })             
  #        vim.keymap.set("n", "<leader>i", function()                    
  #          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })                                
  #        end, { buffer = bufnr })                                       
  #      end                                                              
  #    end,                                                               
  #  })
  #'';
}
