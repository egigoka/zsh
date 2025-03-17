sudo make install
echo "/usr/local/bin/zsh" | sudo tee -a /etc/shells
echo "if you want, you can change your shell to it"
chsh -s /usr/local/bin/zsh
echo "if you want, you can change root shell to it or Ctrl+C to finish"
sudo chsh -s /usr/local/bin/zsh
