require 'lspconfig'.ccls.setup {
    init_options = {
    compilationDatabaseDirectory = "build";
    index = {
      threads = 0;
    };
    clang = {
      excludeArgs = { "-frounding-math"} ;
    };
  }

}
require'lspconfig'.rust_analyzer.setup{}
require'lspconfig'.jedi_language_server.setup{}
