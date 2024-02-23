require "js"

def set_button(id, name)
  document = JS.global[:document]
  display = JS.global[:display]

  button = document.getElementById(id)
  button[:innerText] = name
  button.addEventListener("click") do |e|
    ret = yield display[:value].to_s
    display[:value] = ret.is_a?(String) ? ret : ret.inspect
  end
end

def set_button_to_expect_object(id, name)
  set_button(id, name) do |input|
    yield eval(input)
  end
end

# Setup buttons
# 1-4
set_button("b1", "UPCASE") do |input|
  input.upcase
end

set_button("b2", "downcase") do |input|
  input.downcase
end

set_button("b3", "Capitalize") do |input|
  input.capitalize
end

# 5-8
set_button("b5", "split") do |input|
  input.split(" ")
end

set_button_to_expect_object("b6", "map") do |input|
  input.map do |e|
    e * 2
  end
end

set_button_to_expect_object("b7", "join") do |input|
  input.join(" ")
end

set_button_to_expect_object("b8", "reduce") do |input|
  input.reduce(:+)
end

# 9-12

# 13-16
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
