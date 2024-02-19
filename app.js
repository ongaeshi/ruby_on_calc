function calculate(input, text) {
  // console.log(input + text);
  return input + text;
}

async function init() {
  const buttons = document.querySelectorAll('.button');
  const display = document.getElementById('display');

  buttons.forEach(button => {
    button.addEventListener('click', () => {
      display.value = calculate(
        display.value,
        button.textContent
        );
    });
  });

  // Redo, Undo, Copy, Editのロジックを実装
}

init();
