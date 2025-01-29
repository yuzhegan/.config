# function time_awm --description="Bash time_awm function"
#   command time_awm --portability $argv
# end

set -U fish_user_paths /opt/homebrew/bin $fish_user_paths
set -x TERM xterm-256color
set -x XDG_CONFIG_HOME $HOME/.config




export EDITOR=/opt/homebrew/bin/nvim
export VISUAL=/opt/homebrew/bin/nvim
export LC_CTYPE=zh_CN.UTF-8
export LANG=zh_CN.UTF-8

export ANTHROPIC_API_KEY=sk-dLXqhuWaEr7L0pfeBeA2B8Cc96Df4b6bAf7e77Ec8822938d
export OPENAI_API_KEY=sk-dLXqhuWaEr7L0pfeBeA2B8Cc96Df4b6bAf7e77Ec8822938d




function r
    # 创建一个临时文件
    set tmp (mktemp -t "yazi-cwd.XXXXX")
    # 调用yazi命令
    yazi $argv --cwd-file="$tmp"
    # 读取临时文件内容
    set cwd (cat -- "$tmp")
    # 检查目录是否需要改变
    if test -n "$cwd" -a "$cwd" != "$PWD"
        cd -- "$cwd"
    end
    # 删除临时文件
    rm -f -- "$tmp"
end

