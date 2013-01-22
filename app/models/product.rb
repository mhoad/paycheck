class Product < ActiveRecord::Base
  attr_accessible :description, :name
  
  validates :name, :length => { :minimum => 3 }
  validates :description, :length => {
    :minimum   => 200,
    :tokenizer => lambda { |str| str.scan(/\w+/) }, 
    :too_short => "must have at least %{count} words"
  } # 200 word count minimum description
end
