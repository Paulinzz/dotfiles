set -g fish_greeting
if status is-interactive
    # Commands to run in interactive sessions can go here
end
function fish_prompt
    set_color purple
    echo -n '矢 '
    set_color normal
    echo -n (prompt_pwd) ' > '
end
