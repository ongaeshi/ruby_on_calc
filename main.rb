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

set_button("b1", "RUBY_VERSION") do
  RUBY_VERSION
end

set_button("b5", "UPCASE") do |input|
  input.upcase
end
