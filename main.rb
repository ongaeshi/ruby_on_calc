require "js"

document = JS.global[:document]
display = JS.global[:display]

def ruby_version(input)
  RUBY_VERSION
end
    
b1 = document.getElementById("b1")
b1[:innerText] = "RUBY_VERSION"
b1.addEventListener("click") do |e|
  display[:value] = RUBY_VERSION
end
