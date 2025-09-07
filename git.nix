{ config, pkgs }:
{
  enable = true;
  userName = "Danish Joseph";
  includes = [
    {
      condition = "gitdir:${config.home.homeDirectory}/Developer/Personal/";
      contents.user.email = "danishjoseph07@gmail.com";
    }
    {
      condition = "gitdir:${config.home.homeDirectory}/Developer/Work/";
      contents.user.email = "danish.joseph@buildingminds.com";
    }
  ];

}
