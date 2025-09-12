-- Unicode fallback mappings for Pandoc → LaTeX/PDF
-- Replaces characters missing in main text fonts with LaTeX equivalents.

local function replace_arrow_in_str(s)
  local parts = {}
  local i = 1
  while true do
    local a, b = s:find('↔', i, true)
    if not a then
      if i <= #s then table.insert(parts, pandoc.Str(s:sub(i))) end
      break
    end
    if a > i then table.insert(parts, pandoc.Str(s:sub(i, a - 1))) end
    table.insert(parts, pandoc.RawInline('latex', '\\ensuremath{\\leftrightarrow}'))
    i = b + 1
  end
  return parts
end

function Str(el)
  if not FORMAT:match('latex') then
    return nil
  end
  local s = el.text
  if s:find('↔', 1, true) then
    return replace_arrow_in_str(s)
  end
  return nil
end

