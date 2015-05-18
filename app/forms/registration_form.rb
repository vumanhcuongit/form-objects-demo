class RegistrationForm
  include ActiveModel::Model

  ATTRIBUTES = [:email, :name, :terms_of_service]

  attr_accessor *ATTRIBUTES

  validates :terms_of_service, acceptance: true

  def initialize(attributes = {})
    ATTRIBUTES.each do |attribute|
      send("#{attribute}=", attributes[attribute])
    end
  end

  validate do
    [user, store].each do |object|
      unless object.valid?
        object.errors.each do |key, value|
          errors[key] = value
        end
      end
    end
  end

  def save
    return false unless valid?

    user.save!
    store.save!
    true
  end

  def user
    @user ||= User.new(email: email)
  end

  def store
    @store ||= Store.new(name: name, user: user)
  end
end