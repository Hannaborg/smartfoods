const clickFunction = () => {
  console.log("hello");

  const button = document.querySelector(".btn");
  const clickable = document.querySelectorAll(".clickable");
  
  clickable.forEach((click) => {
    click.addEventListener("click", (event) => {
      const goal = event.currentTarget;
      goal.classList.toggle('active');


      if (goal.children[0].checked) {
        disableGoal(goal);
      } else {
        enableGoal(goal);
      }
    });
  });

  const disableGoal = (goal) => {
    goal.children[0].checked = false;
    let goalsEnabled = 0;
    
    clickable.forEach(goal => {
      if (goal.classList.contains('active')) {
        goalsEnabled += 1;
      }
    });
    
    if (goalsEnabled == 0) {
      button.disabled = true;
    }
  }
  
  const enableGoal = (goal) => {
    button.disabled = false;
    goal.children[0].checked = true;
  }
};

export { clickFunction };
