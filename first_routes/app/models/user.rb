# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  username   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#


class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true

    
    has_many :artworks,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: 'Artwork'
end
