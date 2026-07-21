{
  gitCredentialHelper.hosts = [ "https://github.com" ];

  settings = {
    git_protocol = "https";
    prompt = "true";
    aliases = {
      rv = "repo view";
      rc = "repo clone";
    };
  };
}

