/*global $,document, WOW*/
$(document).ready(function () {

    // Example starter JavaScript for disabling form submissions if there are invalid fields
    (function() {
        'use strict';
        window.addEventListener('load', function() {
        // Fetch all the forms we want to apply custom Bootstrap validation styles to
        var forms = document.getElementsByClassName('needs-validation');
        // Loop over them and prevent submission
        var validation = Array.prototype.filter.call(forms, function(form) {
            form.addEventListener('submit', function(event) {
            if (form.checkValidity() === false) {
                event.preventDefault();
                event.stopPropagation();
            }
            form.classList.add('was-validated');
            }, false);
        });
        }, false);
    })();



    //     'use strict';
//     $("body").niceScroll({
//         cursorborderradius: "0px",
//         scrollspeed: 60,
//         cursorwidth: "10px",
//         cursorcolor: "#222222",
//         cursorborder: "1px solid #222222"
//     });
    

// });
//new WOW().init();

//function check() {
//    'use strict';
//
//    var question1 = document.quiz.question1.value,
//        question2 = document.quiz.question2.value,
//        question3 = document.quiz.question3.value,
//        correct = 0;
//
//
//    if (question1 === "Answer One") {
//        correct++;
//    }
//    if (question2 === "Answer Two") {
//        correct++;
//    }
//    if (question3 === "Answer Two") {
//        correct++;
//    }
//
//    var messages = ["Great job!", "That's just okay", "You really need to do better"];
//    var score;
//
//    if (correct == 0) {
//        score = 2;
//    }
//
//    if (correct > 0 && correct < 3) {
//        score = 1;
//    }
//
//    if (correct == 3) {
//        score = 0;
//    }
//
//    document.getElementById("after_submit").style.visibility = "visible";
//
//    document.getElementById("message").innerHTML = messages[score];
//    document.getElementById("number_correct").innerHTML = "You got " + correct + " correct.";


})
