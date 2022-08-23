document.querySelector('.pub-btn-group').onclick = function() {
    const $radioGroup = document.getElementsByName('publishStatus');    
    
    for (let radio of $radioGroup) {
    
        if (radio.checked) {
            radio.parentElement.classList.add('checked');
        } else {
            radio.parentElement.classList.remove('checked');
        }       
    }    
}

document.querySelector('.ep-btn-group').onclick = function() {
    const $radioGroup = document.getElementsByName('epId');

    for (let radio of $radioGroup) {
    
        if (radio.checked) {
            radio.parentElement.classList.add('checked');
        } else {
            radio.parentElement.classList.remove('checked');
        }       
    }
}