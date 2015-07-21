require File.expand_path('../../spec_helper.rb', __FILE__)

describe 'Site' do
  let(:id) { nil }
  let(:attributes) { { id: id } }
  let(:site) { Siteleaf::Site.new(attributes) }

  describe '#theme' do
    subject { site.theme }
    context 'Always returns an Object of Theme for the site or a new Theme Object if no site defined' do
      it { should be_an_instance_of Siteleaf::Theme }
    end
  end

  describe '#assets' do
    before do
      stub_request(:get, %r{sites\/#{ENV['SITE_ID']}\/assets\z}).to_return(body: ENV['assets'], headers: { content_type: 'application/json' })
      stub_request(:get, %r{sites\/\/assets\z}).to_return(body: ENV['error'], headers: { content_type: 'application/json' })
    end
    subject { site.assets }
    context 'when id is present' do
      let(:id) { ENV['SITE_ID'] }
      it { should be_an_instance_of Array }
      it 'should return an array of assets' do
        site.assets.each { |asset| expect(asset).to be_instance_of(Siteleaf::Asset) }
      end
    end
    context 'when id is nil' do
      it 'should raise error for each_pair function in attributes function' do
        expect { site.assets }.to raise_error NoMethodError
      end
    end
  end

  describe '#pages' do
    before do
      stub_request(:get, %r{sites\/#{ENV['SITE_ID']}\/pages\z}).to_return(body: ENV['pages'], headers: { content_type: 'application/json' })
      stub_request(:get, %r{sites\/\/pages\z}).to_return(body: ENV['error'], headers: { content_type: 'application/json' })
    end
    subject { site.pages }
    context 'when id is present' do
      let(:id) { ENV['SITE_ID'] }
      it { should be_an_instance_of Array }
      it 'should return an array of pages' do
        site.pages.each { |page| expect(page).to be_instance_of(Siteleaf::Page) }
      end
    end
    context 'when id is nil' do
      it 'should raise error for each_pair function in attributes function' do
        expect { site.pages }.to raise_error NoMethodError
      end
    end
  end

  describe '#posts' do
    before do
      stub_request(:get, %r{sites\/#{ENV['SITE_ID']}\/posts\z}).to_return(body: ENV['posts'], headers: { content_type: 'application/json' })
      stub_request(:get, %r{sites\/\/posts\z}).to_return(body: ENV['error'], headers: { content_type: 'application/json' })
    end
    subject { site.posts }
    context 'when id is present' do
      let(:id) { ENV['SITE_ID'] }
      it { should be_an_instance_of Array }
      it 'should return an array of posts' do
        site.posts.each { |post|  expect(post).to be_instance_of(Siteleaf::Post) }
      end
    end
    context 'when id is nil' do
      it 'should raise error for each_pair function in attributes function' do
        expect { site.posts }.to raise_error NoMethodError
      end
    end
  end
end
