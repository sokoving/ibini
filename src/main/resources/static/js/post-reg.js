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

// js platform select event

const platformselect = document.getElementById('platformselect');
// platformselect.onclick = e => {
//     console.log(e.target.value);
//     console.log(e.target.options[e.target.selectedIndex].text);

//     let value = e.target.value;

    
    

// }

// jQuery
    $(document).ready(function(){
        $('#platformselect').change(function(){
            
            alert($(this).val());
            $('#platformselect').val($(this).val()).prop("selected",true);
            
        });
        

    }); // jquery end
