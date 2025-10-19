{pkgs, ...}: {
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "CozetteCrossedSevenVector:size=14";
        icons-enabled = false;
        prompt = "";
        dpi-aware = "yes";
        use-bold = false;
        inner-pad = 5;
        vertical-pad = 20;
        horizontal-pad = 20;
      };
      border = {
        width = 3;
        radius = 0;
      };
      colors = {
        background = "1C1917FF";
        border = "B4BDC3FF";
        text = "B4BDC3FF";
        match = "66A5ADFF";
        placeholder = "B77E64FF";
        selection = "1C1917FF";
        selection-text = "B279A7FF";
        selection-match = "819B69FF";
      };
    };
  };
}
