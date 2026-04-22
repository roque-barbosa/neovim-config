local REPLACE_PREFIX = "           →  "
local REPLACE_NS = vim.api.nvim_create_namespace("replace_picker")

local function parse_replace_input(input)
	local sep = input:find("/")
	if not sep then
		vim.notify("Use format: search/replace", vim.log.levels.WARN)
		return nil, nil
	end
	local search = input:sub(1, sep - 1)
	local replace = input:sub(sep + 1)
	if search == "" then return nil, nil end
	return search, replace
end

local function build_replace_items(qf_items, search, replace)
	local items = {}
	for i, qf in ipairs(qf_items) do
		local fname = vim.fn.bufname(qf.bufnr)
		local current_text = vim.trim(qf.text)
		local after_text = current_text:gsub(vim.pesc(search), replace)
		table.insert(items, {
			text = fname .. ":" .. qf.lnum .. "  " .. current_text,
			bufnr = qf.bufnr,
			lnum = qf.lnum,
			pair_id = i,
			is_preview = false,
		})
		table.insert(items, {
			text = REPLACE_PREFIX .. after_text,
			bufnr = qf.bufnr,
			lnum = qf.lnum,
			pair_id = i,
			is_preview = true,
		})
	end
	return items
end

local function show_replace_items(buf_id, items_to_show, search, replace)
	local lines = vim.tbl_map(function(i) return i.text end, items_to_show)
	vim.api.nvim_buf_set_lines(buf_id, 0, -1, false, lines)
	vim.api.nvim_buf_clear_namespace(buf_id, REPLACE_NS, 0, -1)

	for i, item in ipairs(items_to_show) do
		local li = i - 1
		if not item.is_preview then
			local sep = item.text:find("  ", 1, true)
			if sep then
				vim.api.nvim_buf_add_highlight(buf_id, REPLACE_NS, "Comment", li, 0, sep - 1)
			end
			local s = item.text:find(search, 1, true)
			if s then
				vim.api.nvim_buf_add_highlight(buf_id, REPLACE_NS, "DiffDelete", li, s - 1, s - 1 + #search)
			end
		else
			vim.api.nvim_buf_add_highlight(buf_id, REPLACE_NS, "Comment", li, 0, #REPLACE_PREFIX)
			if replace ~= "" then
				local s = item.text:find(replace, #REPLACE_PREFIX + 1, true)
				if s then
					vim.api.nvim_buf_add_highlight(buf_id, REPLACE_NS, "DiffAdd", li, s - 1, s - 1 + #replace)
				end
			end
		end
	end
end

local function open_replace_picker(search, replace, items)
	local pick = require("mini.pick")
	local remaining = items

	local function get_source_item(current)
		if not current.is_preview then return current end
		for _, item in ipairs(remaining) do
			if item.pair_id == current.pair_id and not item.is_preview then
				return item
			end
		end
		return current
	end

	local function remove_pair(current)
		remaining = vim.tbl_filter(function(i)
			return i.pair_id ~= current.pair_id
		end, remaining)
		pick.set_picker_items(remaining)
	end

	pick.start({
		source = {
			name = "Replace: " .. search .. " → " .. replace,
			items = items,
			show = function(buf_id, items_to_show, query)
				show_replace_items(buf_id, items_to_show, search, replace)
			end,
		},
		mappings = {
			replace_item = {
				char = "<C-r>",
				func = function()
					local current = pick.get_picker_matches().current
					if not current then return end
					local source = get_source_item(current)
					if not vim.api.nvim_buf_is_loaded(source.bufnr) then
						vim.fn.bufload(source.bufnr)
					end
					vim.api.nvim_buf_call(source.bufnr, function()
						vim.cmd(source.lnum .. "s/" .. vim.fn.escape(search, "/\\") .. "/" .. vim.fn.escape(replace, "/\\") .. "/")
						vim.cmd("update")
					end)
					remove_pair(current)
				end,
			},
			discard_item = {
				char = "<C-d>",
				func = function()
					local current = pick.get_picker_matches().current
					if not current then return end
					remove_pair(current)
				end,
			},
		},
	})
end

local function replace_picker(global)
	local input = vim.fn.input("Old/New: ")
	if input == "" then return end
	local search, replace = parse_replace_input(input)
	if not search then return end
	local target = global and "." or vim.fn.shellescape(vim.fn.expand("%"))
	vim.cmd("silent! grep! " .. vim.fn.shellescape(search) .. " " .. target)
	local qf_items = vim.fn.getqflist()
	if #qf_items == 0 then vim.notify("No matches found", vim.log.levels.INFO) return end
	open_replace_picker(search, replace, build_replace_items(qf_items, search, replace))
end

local function buffers_picker()
	local pick = require("mini.pick")
	pick.builtin.buffers({}, {
		mappings = {
			delete_buffer = {
				char = "<C-d>",
				func = function()
					local current = pick.get_picker_matches().current
					if not current then return end
					local bufnr = type(current) == "table" and current.bufnr or vim.fn.bufnr(current)
					if not bufnr or bufnr == -1 then return end
					vim.api.nvim_buf_delete(bufnr, { force = false })
					local new_items = vim.tbl_filter(function(item)
						local bnr = type(item) == "table" and item.bufnr or vim.fn.bufnr(item)
						return bnr ~= bufnr
					end, pick.get_picker_items() or {})
					pick.set_picker_items(new_items)
				end,
			},
		},
	})
end

return {
	{
		"echasnovski/mini.pick",
		version = false,
		config = function()
			local pick = require("mini.pick")
			local extra = require("mini.extra")

			pick.setup({
				mappings = {
					scroll_down = "<C-d>",
					scroll_up = "<C-u>",
				},
				window = {
					config = function()
						return {
							anchor = "NW",
							row = vim.o.lines - vim.o.cmdheight - 2,
							col = 0,
							width = vim.o.columns,
							height = math.floor(vim.o.lines * 0.35),
						}
					end,
				},
			})
			extra.setup()

			vim.keymap.set("n", "<leader><leader>", buffers_picker, { desc = "[ ] Find existing buffers" })
			vim.keymap.set("n", "<leader>ff", pick.builtin.files, { desc = "[F]ind [F]iles" })
			vim.keymap.set("n", "<leader>fw", pick.builtin.grep_live, { desc = "[F]ind [W]ord (grep)" })
			vim.keymap.set("n", "<leader>/", function() extra.pickers.buf_lines({ scope = "current" }) end, { desc = "[/] Search in current buffer" })
			vim.keymap.set("n", "<leader>rs", function() replace_picker(false) end, { desc = "[R]eplace in file" })
			vim.keymap.set("n", "<leader>rS", function() replace_picker(true) end, { desc = "[R]eplace globally" })
		end,
	},
	{ "echasnovski/mini.extra", version = false },
}
