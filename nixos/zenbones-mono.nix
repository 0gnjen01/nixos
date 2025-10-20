{
  lib,
  stdenv,
  fetchFromGitHub,
}:

stdenv.mkDerivation rec {
  pname = "zenbones-mono";
  version = "2.400";

  src = fetchFromGitHub {
    owner = "mcchrish";
    repo = "${pname}";
    rev = "v${version}";
    sha256 = "104kid04mc526g9xaa9716b2bsrjmx7jgxi2h5731h6060b8ln4c";
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 *.ttf -t $out/share/fonts/truetype
    install -Dm644 *.woff2 -t $out/share/fonts/woff2

    runHook postInstall
  '';
  meta = with lib; {
    description = "Comfy. Condensed. Coding.

A custom Iosevka build drawing inspirations from various programming typefaces.";

    homepage = "https://github.com/zenbones-theme/${pname}";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
