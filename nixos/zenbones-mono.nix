{
  lib,
  stdenv,
  fetchzip,
  tree,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "zenbones-mono";
  version = "2.400";

  srcs = [
    # (fetchzip {
    #   url = "https://github.com/zenbones-theme/zenbones-mono/releases/download/v${finalAttrs.version}/Zenbones-Brainy-TTF-Unhinted.zip";
    #   hash = "sha256-Wrn9BYNs0Z9BDau60u2eX/LleXzcH1MuIJph6XfIRTE=";
    # })
    (fetchzip {
      url = "https://github.com/zenbones-theme/zenbones-mono/releases/download/v${finalAttrs.version}/Zenbones-Brainy-TTF.zip";
      hash = "sha256-Wrn9BYNs0Z9BDau60u2eX/LleXzcH1MuIJph6XfIRTE=";
    })
    # (fetchzip {
    #   url = "https://github.com/zenbones-theme/zenbones-mono/releases/download/v${finalAttrs.version}/Zenbones-Brainy-WOFF2-Unhinted.zip";
    #   hash = "sha256-QydoLvxIg/94IDGFfgTSmmDKbRZ+XAiFnDs+az08A0A=";
    # })
    (fetchzip {
      url = "https://github.com/zenbones-theme/zenbones-mono/releases/download/v${finalAttrs.version}/Zenbones-Brainy-WOFF2.zip";
      hash = "sha256-hAXXZRwN1XvP6ivZKCcIvBDDUscpFGmMaOTB30WhBVs=";
    })
    # (fetchzip {
    #   url = "https://github.com/zenbones-theme/zenbones-mono/releases/download/v${finalAttrs.version}/Zenbones-Mono-TTF-Unhinted.zip";
    #   hash = "sha256-si73IUcBc8UUlt1FVtIkDbvfDjQI4P4RQ6otglBJVDU=";
    # })
    (fetchzip {
      url = "https://github.com/zenbones-theme/zenbones-mono/releases/download/v${finalAttrs.version}/Zenbones-Mono-TTF.zip";
      hash = "sha256-Q7G1s6jueTX0a4Vj83N8lFc2dGp0Rq//BNZ6UiMASSY=";
    })
    # (fetchzip {
    #   url = "https://github.com/zenbones-theme/zenbones-mono/releases/download/v${finalAttrs.version}/Zenbones-Mono-WOFF2-Unhinted.zip";
    #   hash = "sha256-yjvITcXJhBR0dQkyQGDb+dkGXbRwavT2YdOBRn2yy/4=";
    # })
    (fetchzip {
      url = "https://github.com/zenbones-theme/zenbones-mono/releases/download/v${finalAttrs.version}/Zenbones-Mono-WOFF2.zip";
      hash = "sha256-bpjv7ed1P9pp8Tw2gfFQ9KJSCJoWt+WxOsmUYH3BkZ0=";
    })
    # (fetchzip {
    #   url = "https://github.com/zenbones-theme/zenbones-mono/releases/download/v${finalAttrs.version}/Zenbones-Prose-TTF-Unhinted.zip";
    #   hash = "sha256-si73IUcBc8UUlt1FVtIkDbvfDjQI4P4RQ6otglBJVDU=";
    # })
    (fetchzip {
      url = "https://github.com/zenbones-theme/zenbones-mono/releases/download/v${finalAttrs.version}/Zenbones-Prose-TTF.zip";
      hash = "sha256-sha256-ZBFY4eCLgaCiv7vXJgtdKKkgsIGKSsjtQqbfSqamswA=";
    })
  ];

  dontUnpack = true;

  buildInputs = [ tree ];
  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/fonts/truetype $out/share/fonts/woff2
    tree $srcs
    find $srcs -name '*.ttf' | xargs install -m644 --target $out/share/fonts/truetype -D
    find $srcs -name '*.ttf' | xargs install -m644 --target $out/share/fonts/woff2 -D
    runHook postInstall
  '';

  meta = {
    description = "Comfy. Condensed. Coding. A custom Iosevka build drawing inspirations from various programming typefaces";
    homepage = "https://github.com/zenbones-theme/zenbones-mono";
    license = lib.licenses.ofl;
    platforms = lib.platforms.all;
    maintainers = with lib.maintainers; [
    ];
  };
})
