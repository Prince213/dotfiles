{
  programs.tmux = {
    enable = true;
    terminal = "tmux-256color";
    extraConfig = ''
      bind-key -N "Open Navi" -T prefix C-g split-window \
        "$SHELL -l -i -c 'navi --print | tmux load-buffer -b tmp - && \
          tmux paste-buffer -d -p -b tmp -t {last}'"
    '';
  };
}
