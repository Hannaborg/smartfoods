const clickFunction = () => {
  console.log("hello");

  const clickable = document.querySelectorAll(".clickable");
  clickable.forEach((click) => {
    click.addEventListener("click", (event) => {
      event.currentTarget.classList.toggle("active");
      console.log(event.currentTarget);
      if (event.currentTarget.children[0].checked) {
        event.currentTarget.children[0].checked = false;
      } else {
        event.currentTarget.children[0].checked = true;
      }
    });
  });

};

export { clickFunction };
