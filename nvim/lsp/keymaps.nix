[
  {
    mode = "n";
    key = "<A-K>";
    action = ":lua vim.diagnostic.open_float()<cr>";
  }
  {
    key = "<A-k>";
    action = ":lua vim.diagnostic.jump({count = -1, float = true})<cr>";
  }
  {
    key = "<A-j>";
    action = ":lua vim.diagnostic.jump({count = 1, float = true})<cr>";
  }
  {
    key = "K";
    lspBufAction = "hover";
  }
  {
    key = "<A-d>";
    lspBufAction = "definition";
  }
  {
    key = "<A-D>";
    lspBufAction = "declaration";
  }
  {
    key = "<A-i>";
    lspBufAction = "implementation";
  }
  {
    key = "<A-t>";
    lspBufAction = "type_definition";
  }
  {
    key = "<A-r>";
    lspBufAction = "references";
  }
  {
    key = "<A-h>";
    lspBufAction = "signature_help";
  }
  {
    key = "cn";
    lspBufAction = "rename";
  }
  {
    key = "cf";
    action = ":lua vim.lsp.buf.format({async = true})<cr>";
  }
  {
    key = "<A-.>";
    lspBufAction = "code_action";
  }
  {
    key = "<C-.>";
    lspBufAction = "completion";
  }
]
