--- @param config CsharpConfig
return function(config)
  return {
    getFormatOnSavePattern = function()
      if config.format_on_save then
        return { "*.cs" }
      end
      return {}
    end,

    getTSEnsureList = function()
      return { "c_sharp" }
    end,

    getLSPEnsureList = function()
      return { "csharp_ls" }
    end,

    getLSPConfigMap = function()
      return {
        csharp_ls = require("insis.lsp.config.csharp"),
      }
    end,

    getToolEnsureList = function()
      if config.formatter == "clang-format" then
        return { "clang-format" }
      end
      return {}
    end,

    getNulllsSources = function()
      local null_ls = pRequire("null-ls")
      if not null_ls then
        return {}
      end
      if config.formatter == "clang-format" then
        return { null_ls.builtins.formatting.clang_format }
      end
      return {}
    end,

    getNeotestAdapters = function()
      return {}
    end,
  }
end
