{ stdenv, fetchPypi, buildPythonPackage }:

buildPythonPackage rec {
  pname = "camxes";
  version = "0.2";

  src = fetchPypi {
    inherit pname version;
    sha256 = "1rhj40a60gq7giypxbhnbhlbz9if7ars1ba9vm1ak2izvdzh4mph";
  };

  propagatedBuildInputs = [ colorama ];

  # No tests on PyPI
  doCheck = false;

  meta = with stdenv.lib; {
    homepage = "https://github.com/lojban/python-camxes";
    description = "A library to access KeePass 1.x/KeePassX (v3) and KeePass 2.x (v4) files";
    license = licenses.gpl2Plus;
    maintainers = with maintainers; [ jqueiroz ];
  };
}
