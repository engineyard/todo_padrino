require 'spec_helper'

describe "List Model" do
  let(:list) { List.new }
  it 'can be created' do
    list.should_not be_nil
  end
end
