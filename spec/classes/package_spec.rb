require 'spec_helper'

describe 'autofs', :type => :class do
  let(:title) { 'autofs' }

  it { should contain_class('autofs::install') }
end
