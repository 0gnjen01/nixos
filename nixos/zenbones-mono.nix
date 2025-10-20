{
  lib,
  stdenv,
  fetchzip,
}:

stdenv.mkDerivation rec {
  pname = "zenbones-mono";
  version = "2.400";

  src = fetchzip {
    url = "https://github.com/zenbones-theme/zenbones-mono/releases/download/v${version}/Zenbones-Mono-TTF.zip";
    sha256 = "0avwa96ipwcayi5mqh1hfbq6nj1i2hqn05v1x5h217953vkczx0p";
  };

  installPhase = ''
    runHook preInstall

    install -Dm644 *.ttf -t $out/share/fonts/truetype

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
