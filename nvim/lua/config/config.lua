vim.opt.number = true

-- Don't show the "[2/4]" search match-count message (e.g. after `*` on a
-- word like `Some` in Rust) — noice renders this as part of its search
-- popup, and the "S" shortmess flag is what turns it off entirely.
vim.opt.shortmess:append("S")

-- OneDrive (onedriver FUSE mount) does a blocking Graph API call on rename
-- and on deleting an already-synced file. Neovim's default save strategy
-- (backupcopy=auto) renames the original file out of the way and deletes
-- the old backup, hitting both of those on every write. Overwriting the
-- file in place avoids both, so saves stay local and the upload queues
-- asynchronously (also means saves work fine while offline).
vim.opt.backupcopy = "yes"