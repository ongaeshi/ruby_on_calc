require "js"

def set_button(id, name)
  document = JS.global[:document]
  display = JS.global[:display]

  button = document.getElementById(id)
  button[:innerText] = name
  button.addEventListener("click") do |e|
    display[:value] = yield display[:value].to_s
  end
end

# Setup buttons

set_button("b1", "UPCASE") do |input|
  input.upcase
end

set_button("b2", "downcase") do |input|
  input.downcase
end

set_button("b3", "Capitalize") do |input|
  input.capitalize
end

set_button("b13", "RUBY_VERSION") do
  RUBY_VERSION
end

set_button("b14", "Lorem Ipsum") do
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
end

set_button("b15", "console") do |input|
  JS.global[:console].log(input)
  input
end
