{...}:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "JetBrainsMono Nerd Font:size=14";
        icons-enabled = false;
        prompt = "";
        dpi-aware = "yes";
        use-bold = false;
        inner-pad = 5;
        vertical-pad = 20;
        horizontal-pad = 20;
      };
      border = {
        width = 1;
        radius = 0;
      };
      colors = {
        background = "1C1917FF";
        border = "1C1917FF";
        text = "B4BDC3FF";
        match = "819B69FF";
        placeholder = "B77E64FF";
        selection = "6099C0FF";
        selection-text = "B279A7FF";
        selection-match = "66A5ADFF";
      };
    };
  };
}
