const btnToggle = document.querySelector('#btnToggle');
const subMenu = document.querySelector('.sub-menu');
const arr = document.querySelectorAll('.giohang .list__content .item__details .inputBox');

arr.forEach(listBox => {
    listBox.childNodes[1].addEventListener('click',function(){
        if(parseInt(listBox.childNodes[3].value,10) > 1){
            listBox.childNodes[3].value = parseInt(listBox.childNodes[3].value,10) - 1;
         }
    })
    listBox.childNodes[5].addEventListener('click',function(){
          listBox.childNodes[3].value = parseInt(listBox.childNodes[3].value,10) + 1;
    })
});




btnToggle.addEventListener('click',function(){

    if(btnToggle.classList.contains('isOpen')){
        btnToggle.classList.remove('isOpen')
        subMenu.classList.remove('open')
    }else{
        btnToggle.classList.add('isOpen')
        subMenu.classList.add('open')
    }
})


