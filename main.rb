require "js"

def set_button(id, name)
  button = JS.global[:document].getElementById(id)
  button[:innerText] = name
  button.addEventListener("click") do |e|
    yield
  end
end

# Setup buttons
document = JS.global[:document]
display = JS.global[:display]

set_button("b1", "RUBY_VERSION") do
  display[:value] = RUBY_VERSION
end
