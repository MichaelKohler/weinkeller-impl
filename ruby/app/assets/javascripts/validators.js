(function(document) {
    var nameInput = document.querySelector('#user_name');
    var passwordInput = document.querySelector('#user_password');
    var submitButton = document.querySelector('#submitbutton');

    if (nameInput && passwordInput && submitButton) {
        nameInput.addEventListener('input', check_loginbutton_state);
        passwordInput.addEventListener('input', check_loginbutton_state);
    }

    function check_loginbutton_state() {
        console.log('checking if button should be activated..');
        if (nameInput.value != '' && passwordInput.value != '') {
            submitButton.removeAttribute('disabled');
        }
        else {
            submitButton.setAttribute('disabled', 'disabled');
        }
    }
}(document));