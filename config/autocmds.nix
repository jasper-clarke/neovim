{self, ...}: 
{
  autoGroups = {
    lsp_inlay_hints = {};
  };

  autoCmd = [
    {
      group = "lsp_inlay_hints";
      event = ["LspAttach"];
      pattern = "*";
      callback = {
        __raw = ''
	  local bufnr = buf ---@type number                           
          local client = vim.lsp.get_client_by_id(data.client_id)     
          if client.supports_method("textDocument/inlayHint") then         
            vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })             
            vim.keymap.set("n", "<leader>i", function()                    
             vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = bufnr }), { bufnr = bufnr })                                
            end, { buffer = bufnr })                                       
          end
	'';
      };
    }
  ];
}
