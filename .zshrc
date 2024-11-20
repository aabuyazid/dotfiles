# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# export PATH="/home/arkan/sw/intellij/bin:/usr/local/bin:$PATH:/usr/local/go/bin:/home/arkan/go"
# export LD_LIBRARY_PATH="/home/arkan/sw/lib:$LD_LIBRARY_PATH"
# export JAVA_HOME=$(dirname $(dirname $(readlink -f $(which java))))
# export PATH=$PATH:$JAVA_HOME/bin

# LLVM
# export PATH="/usr/local/opt/llvm/bin:$PATH"
# export LDFLAGS="-L/usr/local/opt/llvm/lib"
# export CPPFLAGS="-I/usr/local/opt/llvm/include"

# TBDEngine
export VULKAN_SDK_PATH="/Users/arkan/Documents/TBDEngine/lib/VulkanSDK"

# Graphics
export GLEW_DIR="${HOME}/Documents/TAMU/Graphics/lib/glew"
export GLFW_DIR="${HOME}/Documents/TAMU/Graphics/lib/glfw"
export GLM_INCLUDE_DIR="${HOME}/Documents/TAMU/Graphics/lib/glm"

function lcd() {
    if [[ $# < 1 ]]; then
        echo Too many arguments
        return 1
    fi

    cd $@ && ls .

    return 0
}

function toggleTheme() {
    # Verifying certain files exist
    verified=1

    if [[ ! -f ~/.tmux.conf ]]; then
        echo "~/.tmux.conf does not exist"
        verified=0
    fi

    if [[ ! -f ~/.tmux.conf.dark && ! -f ~/.tmux.conf.light ]]; then
        echo ".tmux.conf.dark and .tmux.conf.light does not exist"
        verified=0
    fi

    if [[ ! -f ~/.config/alacritty/alacritty.toml ]]; then
        echo "~/.config/alacritty/alacritty.toml does not exist"
        verified=0
    fi

    if [[ ! -f ~/.config/alacritty/alacritty.toml.dark && ! -f ~/.config/alacritty/alacritty.toml.light ]]; then
        echo "alacritty.toml.dark and alacritty.toml.light does not exist"
        verified=0
    fi

    if [[ ! -f ~/.config/nvim/lua/user/init.lua ]]; then
        echo "~/.config/nvim/lua/user/init.lua does not exist"
        verified=0
    fi

    if [[ ! -f ~/.config/nvim/lua/user/init.lua.dark && ! -f ~/.config/nvim/lua/user/init.lua.light ]]; then
        echo "init.lua.dark and init.lua.light does not exist"
        verified=0
    fi

    if [[ verified -eq 0 ]]; then
        exit 1
    fi


    theme=0

    # Actual Toggle Mechanism
    if [[ -f ~/.tmux.conf.dark ]]; then
        echo "Changing to Dark Mode"
        cp ~/.tmux.conf ~/.tmux.conf.light
        mv ~/.tmux.conf.dark ~/.tmux.conf
    else
        echo "Changing to Light Mode"
        cp ~/.tmux.conf ~/.tmux.conf.dark
        mv ~/.tmux.conf.light ~/.tmux.conf
        theme=1
    fi

    if [[ -f ~/.config/alacritty/alacritty.toml.dark ]]; then
        # Change from light -> dark
        cp ~/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml.light
        mv ~/.config/alacritty/alacritty.toml.dark ~/.config/alacritty/alacritty.toml
    else
        # Change from dark -> light
        cp ~/.config/alacritty/alacritty.toml ~/.config/alacritty/alacritty.toml.dark
        mv ~/.config/alacritty/alacritty.toml.light ~/.config/alacritty/alacritty.toml
    fi

    if [[ -f ~/.config/nvim/lua/user/init.lua.dark ]]; then
        # Change from light -> dark
        cp ~/.config/nvim/lua/user/init.lua ~/.config/nvim/lua/user/init.lua.light
        mv ~/.config/nvim/lua/user/init.lua.dark ~/.config/nvim/lua/user/init.lua
 
    else
        # Change from dark -> light
        cp ~/.config/nvim/lua/user/init.lua ~/.config/nvim/lua/user/init.lua.dark
        mv ~/.config/nvim/lua/user/init.lua.light ~/.config/nvim/lua/user/init.lua
    fi

    if [[ $(uname) == "Darwin" ]]; then
        # Switch to Dark Mode
        if [[ $theme -eq 0 ]]; then 
            osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to true'
        else
            osascript -e 'tell app "System Events" to tell appearance preferences to set dark mode to false'
        fi
    fi

    if [[ -n "$TMUX" ]]; then
        tmux source-file ~/.tmux.conf
    fi
}

alias cd='lcd'

alias glow="clear && glow"

# alias tgtheme="toggleTheme"

# Setting vi controls in bash
set -o vi
bindkey -v
bindkey '^R' history-incremental-search-backward
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/arkan/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/arkan/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/arkan/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/arkan/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

conda deactivate 
conda activate base


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
