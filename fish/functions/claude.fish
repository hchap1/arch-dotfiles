function claude --description "Route Claude Code to the work or personal account based on cwd"
    # An explicitly exported CLAUDE_CONFIG_DIR always wins, so manual overrides
    # and nested/child sessions keep whatever config dir they were given.
    if set -q CLAUDE_CONFIG_DIR; and test -n "$CLAUDE_CONFIG_DIR"
        command claude $argv
        return
    end

    set -l work_root (path resolve $HOME/work)
    set -l here (path resolve $PWD)

    if test "$here" = "$work_root"; or string match -q -- "$work_root/*" "$here"
        # Work: Bovision account. Default config dir (~/.claude), which is where
        # the org-managed remote settings and deny rules land.
        command claude $argv
    else
        # Everywhere else: personal account.
        CLAUDE_CONFIG_DIR=$HOME/.claude-personal command claude $argv
    end
end
