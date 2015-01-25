require 'spec_helper'

shared_examples_for 'tokenable' do
  let(:model) { described_class }

  before do
    allow(SecureRandom).to receive(:urlsafe_base64).and_return('MY_TOKEN')
  end

  it 'generates a token on creation' do
    instance = FactoryGirl.create(model.to_s.underscore.to_sym)
    expect(instance.token).to eq('MY_TOKEN')
  end
end
