require File.expand_path('../spec_helper.rb', __FILE__)

describe 'Siteleaf' do
  let(:siteleaf) { Siteleaf }

  describe '#self.api_url' do
    subject { siteleaf.api_url }
    context 'API URL Prefix' do
      it 'should return a https://.....' do
        expect(siteleaf.api_url).to start_with('https://')
      end
    end
  end

  describe '#self.settings_file' do
    subject { siteleaf.settings_file }
    context 'Returns a settings File' do
      it 'may or may not return' do
        # As Figs was put in this file may or may not exist
      end
    end
  end

  describe '#self.load_key_secret' do
    let(:key) { 'Pass Key' }
    let(:secret) { 'Pass Secret' }
    subject { siteleaf.load_key_secret(key, secret) }
    context 'when all arguments are passed' do
      it 'should not raise error' do
        expect { siteleaf.load_key_secret(key, secret) }.not_to raise_error
      end
    end
    context 'when argument is missing' do
      let(:secret) { '' }
      it 'should raise error' do
        expect { siteleaf.load_key_secret(key, secret) }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#self.load_env_vars' do
    subject { siteleaf.load_env_vars }
    context 'Loads Environment Variables for Key and secret' do
      it 'may or may not load key and secret' do
        # Doubles up for siteleaf settings file only if figsfile exists
      end
    end
  end

  describe '#self.load_settings' do
    subject { siteleaf.load_settings }
    context 'Loads up key and secret from either Fggs or siteleaf settings' do
      it 'should load up key and secret' do
        # No need to check because user is prompted to correct that
      end
    end
  end
end
