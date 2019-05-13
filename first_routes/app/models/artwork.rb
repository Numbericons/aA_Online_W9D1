# == Schema Information
#
# Table name: artworks
#
#  id         :bigint           not null, primary key
#  artist_id  :integer          not null
#  image_url  :string           not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artwork < ApplicationRecord
    validates :artist_id, :title, :image_url, presence: true
    validates_uniqueness_of :title, scope: :artist_id

    belongs_to :artist,
    primary_key: :id,
    foreign_key: :artist_id,
    class_name: 'User'
end
