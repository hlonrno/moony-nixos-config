{
  gitCredentialHelper.hosts = [ "https://github.com" ];

  settings = {
    git_protocol = "https";
    prompt = "true";
    aliases = {
      pc = "pr checkout";
      pv = "pr view";
      rv = "repo view";
      rc = "repo clone";
    };
  };
}

