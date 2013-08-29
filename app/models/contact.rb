class Contact
  include ActiveModel::Validations 
  include ActiveModel::Conversion 
  extend ActiveModel::Naming

  attr_accessor :cemail, :ctype, :link, :message, :subject

  validates :ctype, presence: true
  validates :subject, presence: true
  validates :cemail, presence: true, format: {with:/^[a-zA-Z0-9_.-]+@([a-zA-Z0-9_ -]+\.)+[a-zA-Z]{2,4}$/}
  validates :message, presence: true
  
  def initialize(attributes = {})
    attributes.each do |subject, value|
      send("#{subject}=", value)
    end
  end

  def persisted?
    false
  end
end