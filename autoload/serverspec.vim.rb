require 'json'
require 'ripper'

module ServerspecVim
  Info = JSON.parse(File.read(File.expand_path('../serverspec_info.json', __FILE__)))

  class << self
    # ServerspecDoc command の補完候補
    def doc_candidates
      return_to_vim Info.keys.join("\n")
    end

    # @param [Integer] bufnr バッファ番号
    # @param [Integer] line 行番号
    def resource_name_by_line(bufnr, line)
      return_to_vim ServerspecVim::Rippy.new(code(bufnr)).resource_name(line) || ""
    end

    private
    # return_to_vim function is copied from https://github.com/todesking/ruby_hl_lvar.vim
    # The MIT License (MIT)
    #
    # Copyright (c) 2014 todesking
    def return_to_vim(content)
      ::Vim.command "let s:ret = #{content.inspect}"
    end

    def code(bufnr)
      ::Vim.evaluate("getbufline(#{bufnr}, 1, '$')").join("\n")
    end
  end
end

class ServerspecVim::Rippy < Ripper
  def initialize(src, filename = "(ripper)", lineno = 1)
    super
    @describe_arg_flag = false # 今 describe の引数見てるフラグ
    @resource_name = nil
  end

  def on_ident(*args) # @ident に遭遇すると呼ばれる
    return if lineno > @line # 行を過ぎてたらスキップ

    name = args[0]
    if @describe_arg_flag
      @resource_name = name
      @describe_arg_flag = false
    else
      @describe_arg_flag = %w[context describe].include? name
    end
  end

  # @param [Integer] line cursor のいる行番号
  # @return [String]
  def resource_name(line)
    @line = line
    self.parse
    return @resource_name
  end
end
