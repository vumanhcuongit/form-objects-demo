require 'rails_helper'

describe RegistrationForm do
  describe 'it does some validations' do
    it { should validate_acceptance_of :terms_of_service }
    it { should validate_presence_of :email }
    it { should validate_presence_of :name }

    context 'valid fields' do
      before(:each) do
        @form = described_class.new({email: 'cuongvu0103@gmail.com', name: 'Cuong Vu', terms_of_service: '1'})
      end

      it 'validates form successfully' do
        expect(@form).to be_valid
      end

      it 'returns true' do
        expect(@form.save).to eql true
      end
    end

    context 'invalid fields' do
      before(:each) do
        @form = described_class.new({})
      end

      it 'fails to validate the form' do
        expect(@form).to be_invalid
      end

      it 'returns false' do
        expect(@form.save).to eql false
      end
    end
  end
end
