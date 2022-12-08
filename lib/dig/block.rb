require "dig/block/version"
require "ostruct"

module Dig
  module Block
    def dig(*)
      ret = super
      return ret unless ret.nil?
      yield if block_given?
    end
  end
end

::Hash.prepend Dig::Block
::Array.prepend Dig::Block
::Struct.prepend Dig::Block
::OpenStruct.prepend Dig::Block
