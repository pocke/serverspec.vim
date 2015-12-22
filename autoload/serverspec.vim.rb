require 'json'
module ServerspecVim
  Info = JSON.parse(File.read(File.expand_path('../serverspec_info.json', __FILE__)))

  class << self
    # ServerspecDoc command の補完候補
    def doc_candidates
      return_to_vim 's:ret', Info.keys.join("\n")
    end

    # return_to_vim function is copied from https://github.com/todesking/ruby_hl_lvar.vim
    # The MIT License (MIT)
    #
    # Copyright (c) 2014 todesking
    def return_to_vim(var_name, content)
      ::Vim.command "let #{var_name} = #{content.inspect}"
    end
  end
end
