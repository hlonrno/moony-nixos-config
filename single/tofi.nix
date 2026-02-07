{
  settings = {
    # Font
    font = toString ../JetBrainsMonoNerdFont-Regular.ttf;
    font-size = 17; # pt

    # Text theming 
    # All pieces of text have the same theming attributes available: 
    # *-color 
    #     Foreground color 
    # *-background 
    #     Background color 
    # *-background-padding 
    #     Background padding in pixels (comma-delimited, CSS-style list). 
    #     See "DIRECTIONAL VALUES" under `man 5 tofi` for more info. 
    # *-background-corner-radius 
    #     Radius of background box corners in pixels 
    text-color = "#bebebe";
    Prompt-color = "#bebebe";
    Placeholder-color = "#bebebea0";
    Input-color = "#bebebe";
    default-result-color = "#c8c8c8";
    selection-color = "#c8c8c8";

    prompt-background = "#00000000";
    input-background = "#00000000";
    placeholder-background = "#00000000";
    default-result-background = "#00000000";
    selection-background = "#484848";
 
    # Window theming 
    width = "25%";
    height = "40%";
    background-color = "#323232";
    border-color = "#787878";
    outline-width = 0; # px
    border-width = 5; # px

    padding-top    = 7;
    padding-bottom = 7;
    padding-left   = 7;
    padding-right  = 7;

    # Text cursor theme 
    text-cursor-style = "underscore";
    text-cursor-thickness = 4;
 
    # Text layout 
    prompt-text = ">";
    prompt-padding = 7; # px 
    placeholder-text = "search...";
    num-results = 13;

    ### Behaviour 
    text-cursor = true;
    matching-algorithm = "fuzzy";
    drun-launch = true;
  }; 
} 
