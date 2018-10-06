{ stdenv, buildGoPackage, fetchFromGitHub }:

buildGoPackage rec {
  name = "git-annex-remote-mega-${version}";
  version = "20160911-${stdenv.lib.strings.substring 0 7 rev}";
  rev = "369a810d3f3481fb9fe7e74f6a9f17be0b5ba8eb";
  owner = "dxtr";
  repo = "megaannex-go";

  goPackagePath = "github.com/${owner}/${repo}";
  src = fetchFromGitHub {
    inherit owner;
    inherit repo;
    inherit rev;
    sha256 = "0ix7bflc5f0i7c77gzbar7gqrnc8nm1h0vhgd62p2bliaf8il8n5";
  };

  goDeps = ./deps.nix;

  meta = with stdenv.lib; {
    description = "A git-annex remote for mega";
    license = licenses.mit;
    homepage = https://github.com/dxtr/megaannex-go;
    maintainers = with maintainers; [ jqueiroz ];
  };
}
