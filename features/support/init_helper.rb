# frozen_string_literal: true

directories = [
  '../helpers/*.rb',
  '../../web/sections/**/*.rb',
  '../../web/pages/*.rb',
  './*.rb'
]

directories.each do |path|
  Dir[File.join(__dir__, path)].sort.each { |file| require file }
end
