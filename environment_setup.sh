SCRIPT_SOURCE="${BASH_SOURCE[0]:-$0}"
SCRIPT_DIR=$(dirname $(readlink -f $SCRIPT_SOURCE))
DOTFILES_DIR="$SCRIPT_DIR/dotfiles"

echo
echo "Updating system before installation."
echo "------------------------------------"
sudo apt-get update
sudo apt-get upgrade

echo
echo "Installing required packages."
echo "-----------------------------"
sudo apt install ranger autojump zsh neovim fzf


echo 
echo "Installing oh-my-zsh"
echo "--------------------"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
git clone https://github.com/fdw/ranger-autojump ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/ranger-autojump


echo 
echo "Installing virtualenvwrapper."
echo "-----------------------------"
pip install virtualenvwrapper
bash virtualenvwrapper.sh


echo 
echo "Installing novim pluggings."
echo "---------------------------"
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
source $HOME/.local/bin/virtualenvwrapper.sh
mkvirtualenv nvim
workon nvim
pip install neovim numpy jedi pynvim setuptools wheel

echo
echo "Moving configuration files to home. Files will be overwriten."
echo "-------------------------------------------------------------"

cp -r $DOTFILES_DIR/. $HOME -v
