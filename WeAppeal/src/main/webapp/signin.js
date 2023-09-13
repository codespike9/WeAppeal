const signUpButton = document.getElementById("signUp");
const signInButton = document.getElementById("signIn");
const container = document.getElementById("container");

signUpButton.addEventListener('click', () => {
    container.classList.add('right-panel-active');
})

signInButton.addEventListener('click', () => {
    container.classList.remove('right-panel-active');
})


function dark() {
    var element = document.body;
    element.classList.toggle("dark-mode");
 }

function profile(){
    window.location.href="profile.html"
}