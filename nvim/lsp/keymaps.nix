[
  {
    mode = [ "n" "v" "i" ];
    key = "<A-k>";
    action = ":lua vim.diagnostic.open_float()<cr>";
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
    lspBufAction = "format{async = true}";
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
