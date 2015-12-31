require 'test/unit'
require_relative '../autoload/serverspec.vim'

class TestServerspecVimRippy < Test::Unit::TestCase
  def test_resource_name
    src = File.read(File.expand_path('../data/serverspec_sample.rb', __FILE__))
    r = ServerspecVim::Rippy.new(src)
    assert{r.resource_name(1) == nil}

    r = ServerspecVim::Rippy.new(src)
    assert{r.resource_name(4) == 'user'}

    r = ServerspecVim::Rippy.new(src)
    assert{r.resource_name(3) == 'user'}

    r = ServerspecVim::Rippy.new(src)
    assert{r.resource_name(10) == 'port'}

    r = ServerspecVim::Rippy.new(src)
    assert{r.resource_name(13) == 'command'}

    r = ServerspecVim::Rippy.new(src)
    assert{r.resource_name(17) == 'default_gateway'}

    r = ServerspecVim::Rippy.new(src)
    assert{r.resource_name(21) == 'file'}
  end
end
