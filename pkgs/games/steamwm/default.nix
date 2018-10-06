{ stdenv, fetchFromGitHub, steam, xorg }:
stdenv.mkDerivation rec {
  name = "steamwm-unstable-${version}";
  version = "2015-07-29";
   src = fetchFromGitHub {
    owner  = "dscharrer";
    repo   = "steamwm";
    rev    = "ade83733715d07dea6cf9324f59b6265c91662b8";
    sha256 = "139ba7prs2kzmw5p7d1q66r37953x88mpq3gwinwcqmpgwrf4sza";
  };
   buildInputs = [ xorg.libX11 ];
   propagatedBuildInputs = [ steam ];
  buildPhase = ''
    g++ -shared -fPIC -x c++ "steamwm.cpp" -o "steamwm.so" -lX11 -static-libgcc -static-libstdc++ -O3 -Wall -Wextra -DSONAME="steamwm.so"
  '';
   installPhase = ''
    echo "#!/bin/sh" > steamwm
    echo "LD_PRELOAD="$out/lib/steamwm.so" ${steam}/bin/steam \$*" >> steamwm
    install -Dm644 steamwm.so $out/lib/steamwm.so
    install -Dm755 steamwm $out/bin/steamwm
  '';
   meta = with stdenv.lib; {
    homepage = https://github.com/dscharrer/steamwm;
    description = "Wrapper around Spotify that correctly sets class name before opening the window";
    license = licenses.unknown;
    platforms = platforms.linux;
    maintainers = with maintainers; [ jqueiroz ];
  };
}
