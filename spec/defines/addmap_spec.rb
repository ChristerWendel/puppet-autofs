require 'spec_helper'

describe 'autofs::addmap', :type => :define do
  context 'auto.disk with minimal options' do
    let(:title) { 'disk' }
    let(:params) do
      { :mountpoint => '/mnt/disk' }
    end

    it { should contain_file('disk.autofs')
        .with_path('/etc/auto.master.d/disk.autofs')
        .with_content(/\/mnt\/disk auto.disk/)
    }

    it { should contain_file('disk')
        .with_path('/etc/auto.disk')
        .with_content('')
    }
  end

  context 'auto.disk with full options' do
    let(:title) { 'disk' }
    let(:params) do
      { :mountpoint => '/mnt/disk',
        :options    => '--ghost',
        :content    =>
        [
         { 'key'      => 'share',
           'options'  => '-fstype=auto',
           'location' => ':/dev/sdb1' },
         { 'key'      => 'net',
           'options'  => '-fstype=auto',
           'location' => ':/dev/sdc1' }
        ]
      }
    end

    it { should contain_file('disk.autofs')
        .with_path('/etc/auto.master.d/disk.autofs')
        .with_content(/\/mnt\/disk auto.disk --ghost/)
    }

    it { should contain_file('disk')
        .with_path('/etc/auto.disk')
        .with_content(/share.*-fstype=auto.*:\/dev\/sdb1/)
        .with_content(/net.*-fstype=auto.*:\/dev\/sdc1/)
    }
  end

  context 'auto.net with minimal options' do
    let(:title) { 'net' }
    let(:params) do
      { :mountpoint => '/mnt/net' }
    end

    it { should contain_file('net.autofs')
        .with_path('/etc/auto.master.d/net.autofs')
    }

    it { should contain_file('net')
        .with_path('/etc/auto.net')
    }
  end
end
