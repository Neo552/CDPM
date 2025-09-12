-- Simple icon shortcode replacement for Pandoc
-- Usage in Markdown: :check:, :info:, :warning:, :x:, :rocket:

local map = {
  ["check"] = "✓",
  ["done"] = "✓",
  ["ok"] = "✓",
  ["x"] = "✗",
  ["cross"] = "✗",
  ["warning"] = "⚠",
  ["info"] = "ℹ",
  ["tip"] = "💡",
  ["idea"] = "💡",
  ["rocket"] = "🚀",
  ["note"] = "📝",
}

function Str(el)
  local s = el.text
  local key = s:match("^:([%w%-%+_]+):$")
  if key then
    local rep = map[key]
    if rep then
      return pandoc.Str(rep)
    end
  end
  return nil
end

