const showmoreFunction = () => {
    console.log("i'm a function");
    const goals = document.querySelectorAll('.goalid');
    var counter = 0;
    goals.forEach((goal) => {
        var button = document.querySelector(`.toggle-button-${counter}`);
        console.log(button);
        var hiddenItems = document.querySelectorAll(`.foodlist-name-${counter}`);
        let isHidden = true;
        button.addEventListener('click', () => {
            button.textContent = isHidden
            ? 'Hide items'
            : 'Show more items';
            
            isHidden = !isHidden;
            hiddenItems.forEach((item) => {
                item.classList.toggle('hidden')
            });
        });
        counter = counter + 1
    });   
};

export { showmoreFunction };
