# Install TPM
if [ ! -d ~/.tmux/plugins/tpm ] || [ -z "$(ls -A ~/.tmux/plugins/tpm)" ]; then
  mkdir -p ~/.tmux/plugins/tpm
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
fi
