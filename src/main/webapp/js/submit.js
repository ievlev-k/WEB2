let x;
let y;
let r;
let button;
let radio;
function isValidData() {
    if (x == null || r == null || y == null) {
        return false;
    }
    return !(isNaN(y.value) || y.value <= -5 || y.value >= 5);
}


function buttonClick(value, thisButton) {
    $('#messageR').text("");
    if (button != null) button.style.backgroundColor = 'white';
    r = value;
    $('#r').val(r);
    thisButton.style.backgroundColor = 'firebrick';
    button = thisButton;


}

function textChanged() {
    y = document.getElementById("y");
    if (isNaN(y.value) || y.value <= -5 || y.value >= 5) {
        $('#messageY').text("Заполните поле допустимыми значениями");

    }
    else {
        $('#messageY').text("");
    }
}
$(document).ready(function() {
    $('[data-submit]').on('click', function(e) {
        e.preventDefault();
    })
});


function radioChanged(val, thisRadio){
    radio = thisRadio;
    x = val;
}


function canvasClick(e){
    if (r == null ){
        alert("Невозможности определения координат точки. Введите радиус!")
        return;
    }
    x = ((e.offsetX - 250)/250* r)/0.856;
    y = ((250 -e.offsetY )/250 * r)/0.856;
    $("#clickX").val(x);
    $("#clickY").val(y);
    $("#submitData").click();
}



