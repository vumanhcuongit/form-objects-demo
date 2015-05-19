require 'rails_helper'

describe RegistrationForm do
  let(:form) { described_class.new({email: 'cuongvu0103@gmail.com', name: 'Cuong Vu', terms_of_service: '1'}) }
  let(:invalid_form) { described_class.new({email: ''}) }

  describe 'it does some validations' do
    it { should validate_acceptance_of :terms_of_service }
    it { should validate_presence_of :email }
    it { should validate_presence_of :name }

    context 'valid fields' do
      it 'validates form successfully' do
        expect(form).to be_valid
      end
    end

    context 'invalid fields' do
      it 'fails to validate the form' do
        expect(invalid_form).to be_invalid
      end
    end
  end

  describe 'it performs data' do
    context 'valid fields' do
      it 'returns true' do
        expect(form.save).to eql true
      end
    end

    context 'invalid fields' do
      it 'returns false' do
        expect(invalid_form.save).to eql false
      end
    end
  end
end
