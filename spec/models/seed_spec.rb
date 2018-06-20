describe 'Seeds' do

  before do
    Rails.application.load_seed
  end

  after do
    DatabaseCleaner.clean_with(:truncation)
  end

  it "should seed correctly" do
    expect(Estate.first.address).to eq('Hackney Estate')
  end
end
