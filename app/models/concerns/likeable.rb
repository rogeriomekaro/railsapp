module Likeable
  extend ActiveSupport::Concern

  included do
    has_many :likes,as: :object
  end

end