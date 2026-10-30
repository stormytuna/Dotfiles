local M = {}

function M.new(opts, _config)
  opts = opts or {}
  local min_chars = opts.min_chars or 2
  local max_items = opts.max_items or 50
  local source = {}

  function source:enabled()
    local ok, api = pcall(require, "obsidian.api")
    if not ok then
      return false
    end
    local bufname = vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf())
    if bufname == "" then
      return false
    end
    return api.find_workspace(bufname) ~= nil
  end

  function source:get_completions(context, callback)
    local row, col = context.cursor[1] - 1, context.cursor[2]
    local before_cursor = context.line:sub(1, col)
    local word = before_cursor:match "[%w%p%-_']+"
    if not word or #word < min_chars then
      return callback(nil)
    end

    if before_cursor:match "%[%[[^%]]*$" then
      return callback(nil)
    end

    local ok, search = pcall(require, "obsidian.search")
    if not ok then
      return callback(nil)
    end

    local insert_start = col - #word
    local responded = false
    local function respond(items)
      if not responded then
        responded = true
        callback({
          is_incomplete_forward = true,
          is_incomplete_backward = false,
          items = items,
        })
      end
    end

    search.find_notes_async(word, function(notes)
      local items = {}
      for i, note in ipairs(notes) do
        if i > max_items then
          break
        end
        local label = note:display_name()
        items[#items + 1] = {
          label = label,
          kind = vim.lsp.protocol.CompletionItemKind.Reference,
          filterText = label,
          detail = tostring(note.path),
          textEdit = {
            range = {
              start = { line = row, character = insert_start },
              ["end"] = { line = row, character = col },
            },
            newText = note:format_link(),
          },
        }
      end
      respond(items)
    end)

    return function()
      responded = true
    end
  end

  return source
end

return M
