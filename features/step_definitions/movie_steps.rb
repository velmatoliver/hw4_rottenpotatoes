Given /the following movies exist/ do |movies_table|
  movies_table.hashes.each do |movie|
    Movie.create!(movie)
  end
end

Then /the director of "(.*)" should be "(.*)"/ do |title, director|
  m = Movie.find_by_title(title)
  assert director == m.director
end
