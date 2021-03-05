const clickFunction = () => {
console.log("hello");

const clickable = document.querySelectorAll(".clickable");

clickable.forEach((click) => {
  click.addEventListener("click", (event) => {
    event.currentTarget.classList.toggle("active");
  });
});

};

export { clickFunction };
