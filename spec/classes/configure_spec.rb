require 'spec_helper'

describe 'autofs', :type => :class do
  let(:title) { 'autofs::configure' }

  it { should contain_file('/etc/auto.master')
  }

  it { should contain_file('/etc/auto.master.d')
  }
end
