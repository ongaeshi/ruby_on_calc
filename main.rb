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

def shorten_amazon_url(url)
  match = url.match(/\/dp\/(\w+)/)
  "https://amazon.co.jp/dp/#{match[1]}" if match
end

# Setup buttons.
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

set_button("b4", "Ama短") do |input|
  shorten_amazon_url(input)
end

# 5-8
set_button("b5", "split") do |input|
  input.split(" ")
end

set_button("b6", "map") do |input|
  eval(input).map do |e|
    e * 2
  end
end

set_button("b7", "join") do |input|
  eval(input).join(" ")
end

set_button("b8", "reduce") do |input|
  eval(input).reduce(:+)
end

# 9-12
set_button("b9", "gsub") do |input|
  input.gsub("do", "DOOON")
end

# 13-16
set_button("b13", "eval") do |input|
  eval(input)
end

set_button("b14", "Lorem Ipsum") do
  "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
end

set_button("b15", "console") do |input|
  JS.global[:console].log(input)
  input
end

set_button("b16", "RUBY_VERSION") do
  RUBY_VERSION
end

