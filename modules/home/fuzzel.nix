{...}:

{
  programs.fuzzel = {
    enable = true;
    settings = {
      main = {
        font = "Terminess Nerd Font Mono:size=14";
        icons-enabled = false;
        prompt = "";
        dpi-aware = "yes";
        use-bold = false;
        inner-pad = 5;
        vertical-pad = 20;
        horizontal-pad = 20;
      };
      border = {
        width = 0;
        radius = 0;
      };
      colors = {
        background = "151515FF";
        border = "9ECE6AFF";
        text = "E8E3E3FF";
        match = "A988B0FF";
        placeholder = "9ECE6AFF";
        selection = "151515FF";
        selection-text = "8DA3B9FF";
        selection-match = "8C977DFF";
      };
    };
  };
}
