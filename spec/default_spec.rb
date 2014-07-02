require 'spec_helper'

describe 'yum-cloudstack-apt-get::default' do
  context 'yum-cloudstack-apt-get::default uses default attributes' do
    let(:chef_run) do
      ChefSpec::Runner.new do |node|
        node.set['yum']['cloudstack-apt-get']['managed'] = true
      end.converge(described_recipe)
    end

    %w( cloudstack-apt-get ).each do |repo|
      it "creates yum_repository[#{repo}}]" do
        expect(chef_run).to create_yum_repository(repo)
      end
    end

  end
end
