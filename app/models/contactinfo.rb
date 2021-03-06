class Contactinfo
  include Mongoid::Document
  include Sunspot::Mongoid 
  field :address1, :type => String
  field :address2, :type => String
  field :address3, :type => String
  field :state, :type => String
  field :city, :type => String
  field :zip,:type => String
  field :email
  field :contact_number, :type => Integer
  field :alternate_email
 # embedded_in :candidates
  belongs_to :candidate
  belongs_to :company
  has_many :positions
  validates_presence_of :address1,:contact_number,:email,:alternate_email,:address2,:address3,:zip
  #validates_uniqueness_of :email,:case_sensitive => false
  validates_format_of :email,:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i,:message => "not valid format"
  validates_format_of :alternate_email,:with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i,:message => "not valid"
  validates_numericality_of :contact_number, :message => "should contain numbers "
  validates_numericality_of :zip, :message => "should not contain characters "
  has_and_belongs_to_many :states
 
 #has_one :city
 def address
    "#{address1}, #{address2},#{address3},#{city},#{zip}"
  end
 
 searchable :auto_index => false, :auto_remove => false do
      text :city
      
      
    end      
 
end
