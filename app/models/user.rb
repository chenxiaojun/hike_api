class User < ApplicationRecord
  include UserFinders
  include UserUniqueValidator
  include UserNameGenerator
end
