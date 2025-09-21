{...}:

{
  programs.zathura = {
    enable = true;

    mappings = {
      "<c-tab>" =  "toggle_statusbar";
    };

    options = {
      selection-clipboard = "clipboard";
      window-title-home-tilde = true;
      statusbar-home-tilde = true;
      adjust-open = "best-fit";

      recolor = true;
      recolor-keephue = true;
      guioptions = "";

      completion-bg = "#151515";

      completion-fg = "#424242";
      completion-group-bg = "#151515";
      completion-group-fg = "#e8e3e3";
      completion-highlight-bg = "#151515";
      completion-highlight-fg = "#e8e3e3";

      default-bg = "#151515";
      default-fg = "#e8e3e3";

      highlight-active-color = "#A988B0";
      highlight-color = "#D9BC8C";

      index-active-bg = "#151515";
      index-active-fg = "#e8e3e3";
      index-bg = "#151515";
      index-fg = "#e8e3e3";

      inputbar-bg = "#151515";
      inputbar-fg = "#e8e3e3";

      notification-bg = "#151515";
      notification-error-bg = "#B66467";
      notification-error-fg = "#e8e3e3";
      notification-fg = "#e8e3e3";
      notification-warning-bg = "#D9BC8C";
      notification-warning-fg = "#424242";

      recolor-darkcolor = "#e8e3e3";
      recolor-lightcolor = "#151515";

      render-loading = true;
      render-loading-bg = "#e8e3e3";
      render-loading-fg = "#151515";

      statusbar-bg = "#151515";
      statusbar-fg = "#e8e3e3";
    };  
  };
}


