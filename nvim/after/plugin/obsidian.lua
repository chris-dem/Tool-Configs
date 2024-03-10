require("obsidian").setup({
    -- A list of workspace names, paths, and configuration overrides.
    -- If you use the Obsidian app, the 'path' of a workspace should generally be
    -- your vault root (where the `.obsidian` folder is located).
    -- When obsidian.nvim is loaded by your plugin manager, it will automatically set
    -- the workspace to the first workspace in the list whose `path` is a parent of the
    -- current markdown file being edited.
    workspaces = {
        {
            name = "personal",
            path = "~/vaults/personal",
        },
    },

    -- Alternatively - and for backwards compatibility - you can set 'dir' to a single path instead of
    -- 'workspaces'. For example:
    -- dir = "~/vaults/work",

    -- Optional, if you keep notes in a specific subdirectory of your vault.
    -- notes_subdir = "notes",

    -- Optional, set the log level for obsidian.nvim. This is an integer corresponding to one of the log
    -- levels defined by "vim.log.levels.*".
    -- log_level = vim.log.levels.INFO,

    daily_notes = {
        -- Optional, if you keep daily notes in a separate directory.
        folder = "notes/dailies",
        -- Optional, if you want to change the date format for the ID of daily notes.
        date_format = "%Y-%m-%d",
        -- Optional, if you want to change the date format of the default alias of daily notes.
        alias_format = "%B %-d, %Y",
        -- Optional, if you want to automatically insert a template from your template directory like 'daily.md'
        template = nil
    },

    -- Optional, completion of wiki links, local markdown links, and tags using nvim-cmp.
    completion = {
        -- Set to false to disable completion.
        nvim_cmp = true,
        -- Trigger completion at 2 chars.
        min_chars = 2,
    },

    -- Optional, configure key mappings. These are the defaults. If you don't want to set any keymappings this
    -- way then set 'mappings = {}'.
    mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ["gf"] = {
            action = function()
                return require("obsidian").util.gf_passthrough()
            end,
            opts = { noremap = false, expr = true, buffer = true },
        },
        -- Toggle check-boxes.
        ["<leader>ch"] = {
            action = function()
                return require("obsidian").util.toggle_checkbox()
            end,
            opts = { buffer = true },
        },
    },

    -- Where to put new notes. Valid options are
    --  * "current_dir" - put new notes in same directory as the current buffer.
    --  * "notes_subdir" - put new notes in the default notes subdirectory.
    new_notes_location = "current_dir",

    -- Optional, customize how note IDs are generated given an optional title.
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
        -- Create note IDs in a Zettelkasten format with a timestamp and a suffix.
        -- In this case a note with the title 'My new note' will be given an ID that looks
        -- like '1657296016-my-new-note', and therefore the file name '1657296016-my-new-note.md'
        local suffix = ""
        if title ~= nil then
            -- If title is given, transform it into valid file name.
            suffix = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
        else
            -- If title is nil, just add 4 random uppercase letters to the suffix.
            for _ = 1, 4 do
                suffix = suffix .. string.char(math.random(65, 90))
            end
        end
        return suffix
        -- return tostring(os.time()) .. "-" .. suffix
    end,
    --
    -- -- Optional, customize how note file names are generated given the ID, target directory, and title.
    -- ---@param spec { id: string, dir: obsidian.Path, title: string|? }
    -- ---@return string|obsidian.Path The full path to the new note.
    -- note_path_func = function(spec)
        --     -- This is equivalent to the default behavior.
        --     local path = spec.dir / tostring(spec.id)
        --     return path:with_suffix(".md")
        -- end,

        -- Optional, customize how wiki links are formatted. You can set this to one of:
        --  * "use_alias_only", e.g. '[[Foo Bar]]'
        --  * "prepend_note_id", e.g. '[[foo-bar|Foo Bar]]'
        --  * "prepend_note_path", e.g. '[[foo-bar.md|Foo Bar]]'
        --  * "use_path_only", e.g. '[[foo-bar.md]]'
        -- Or you can set it to a function that takes a table of options and returns a string, like this:
        wiki_link_func = "prepend_note_id",

        -- Optional, customize how markdown links are formatted.
        markdown_link_func = function(opts)
            return require("obsidian.util").markdown_link(opts)
        end,

        -- Either 'wiki' or 'markdown'.
        preferred_link_style = "markdown",

        -- Optional, customize the default name or prefix when pasting images via `:ObsidianPasteImg`.
        ---@return string
        image_name_func = function()
            -- Prefix image names with timestamp.
            return string.format("%s-", os.time())
        end,

        -- -- Optional, for templates (see below).
        -- templates = {
            --     subdir = "templates",
            --     date_format = "%Y-%m-%d",
            --     time_format = "%H:%M",
            --     -- A map for custom variables, the key should be the variable and the value a function
            --     substitutions = {},
            -- },

            picker = {
                -- Set your preferred picker. Can be one of 'telescope.nvim', 'fzf-lua', or 'mini.pick'.
                name = "telescope.nvim",
                -- Optional, configure key mappings for the picker. These are the defaults.
                -- Not all pickers support all mappings.
                mappings = {
                    -- Create a new note from your query.
                    new = "<C-x>",
                    -- Insert a link to the selected note.
                    insert_link = "<leader>l",
                },
            },

            -- Optional, configure additional syntax highlighting / extmarks.
            -- This requires you have `conceallevel` set to 1 or 2. See `:help conceallevel` for more details.ob
            ui = {
                enable = true,  -- set to false to disable all additional syntax features
                update_debounce = 200,  -- update delay after a text change (in milliseconds)
                -- Define how various check-boxes are displayed
                checkboxes = {
                    -- NOTE: the 'char' value has to be a single character, and the highlight groups are defined below.
                    [" "] = { char = "󰄱", hl_group = "ObsidianTodo" },
                    ["x"] = { char = "", hl_group = "ObsidianDone" },
                    [">"] = { char = "", hl_group = "ObsidianRightArrow" },
                    ["~"] = { char = "󰰱", hl_group = "ObsidianTilde" },
                    -- Replace the above with this if you don't have a patched font:
                    -- [" "] = { char = "☐", hl_group = "ObsidianTodo" },
                    -- ["x"] = { char = "✔", hl_group = "ObsidianDone" },

                    -- You can also add more custom ones...
                },
                -- Use bullet marks for non-checkbox lists.
                bullets = { char = "•", hl_group = "ObsidianBullet" },
                external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                -- Replace the above with this if you don't have a patched font:
                -- external_link_icon = { char = "", hl_group = "ObsidianExtLinkIcon" },
                reference_text = { hl_group = "ObsidianRefText" },
                highlight_text = { hl_group = "ObsidianHighlightText" },
                tags = { hl_group = "ObsidianTag" },
                block_ids = { hl_group = "ObsidianBlockID" },
                hl_groups = {
                    -- The options are passed directly to `vim.api.nvim_set_hl()`. See `:help nvim_set_hl`.
                    ObsidianTodo = { bold = true, fg = "#f78c6c" },
                    ObsidianDone = { bold = true, fg = "#89ddff" },
                    ObsidianRightArrow = { bold = true, fg = "#f78c6c" },
                    ObsidianTilde = { bold = true, fg = "#ff5370" },
                    ObsidianBullet = { bold = true, fg = "#89ddff" },
                    ObsidianRefText = { underline = true, fg = "#c792ea" },
                    ObsidianExtLinkIcon = { fg = "#c792ea" },
                    ObsidianTag = { italic = true, fg = "#89ddff" },
                    ObsidianBlockID = { italic = true, fg = "#89ddff" },
                    ObsidianHighlightText = { bg = "#75662e" },
                },
            },

            -- Specify how to handle attachments.
            attachments = {
                -- The default folder to place images in via `:ObsidianPasteImg`.
                -- If this is a relative path it will be interpreted as relative to the vault root.
                -- You can always override this per image by passing a full path to the command instead of just a filename.
                img_folder = "assets/imgs",  -- This is the default
                -- A function that determines the text to insert in the note when pasting an image.
                -- It takes two arguments, the `obsidian.Client` and an `obsidian.Path` to the image file.
                -- This is the default implementation.
                ---@param client obsidian.Client
                ---@param path obsidian.Path the absolute path to the image file
                ---@return string
                img_text_func = function(client, path)
                    local link_path
                    local vault_relative_path = client:vault_relative_path(path)
                    if vault_relative_path ~= nil then
                        -- Use relative path if the image is saved in the vault dir.
                        link_path = vault_relative_path
                    else
                        -- Otherwise use the absolute path.
                        link_path = tostring(path)
                    end
                    local display_name = vim.fs.basename(link_path)
                    return string.format("![%s](%s)", display_name, link_path)
                end,
            },
        })
