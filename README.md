serverspec.vim
===========

Neosnippet source for [Serverspec](http://serverspec.org/).


Installation
----------

```vim
NeoBundle 'Shougo/neosnippet'
NeoBundle 'pocke/serverspec.vim'
```

Usage
------

```vim
:set ft=ruby.serverspec
```

or

```vim
:NeoBundleSource ~/.vim/bundle/serverspec.vim/neosnippets/ruby.serverspec.snip
```

![serverspec](https://cloud.githubusercontent.com/assets/4361134/11917890/8696822e-a75d-11e5-9c0e-9846ba507d36.gif)

Development
-----------

### Requirements

- Ruby 2.0 or later
- bundler
- make


### How to update

```sh
bundle update
make
```
