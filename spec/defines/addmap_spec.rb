require 'spec_helper'

describe 'autofs::addmap', :type => :define do
  describe 'disk' do
    let(:title) { 'disk' }
    let(:params) do
      { :mountpoint => '/mnt/disk' }
    end

    it { should contain_file('disk.autofs').with_path('/etc/auto.master.d/disk.autofs') }

    it { should contain_file('disk').with_path('/etc/auto.disk') }
  end

  describe 'net' do
    let(:title) { 'net' }
    let(:params) do
      { :mountpoint => '/mnt/net' }
    end

    it { should contain_file('net.autofs').with_path('/etc/auto.master.d/net.autofs') }

    it { should contain_file('net').with_path('/etc/auto.net') }
  end
end
