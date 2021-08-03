function newAccount(){
    $('#signin').fadeOut(100, function() {
        $("#signup").fadeIn(100);
    });
}
function alreadyMem(){
    $("#signup").fadeOut(100, function (){
        $("#signin").fadeIn(100);
    });
}
function next_one(){

        document.getElementById("form-pass-len").innerText = "";
        document.getElementById("form-pass-mismatch").innerText = "";
        var email = document.getElementById("regEmail");
        email.reportValidity();
        if(email.checkValidity()){
            var pass = document.getElementById("regPass").value;
            var repass = document.getElementById("regConfirmPass").value;
            if(pass.length < 8){
                document.getElementById("form-pass-len").innerText = "Password must be at least 8 characters";
            }
            else{
                if(pass === repass){
                    document.getElementById("form-pass-len").innerText = "";
                    document.getElementById("form-pass-mismatch").innerText = "";
                    $("#form1").fadeOut(100, function (){
                        $("#form2").fadeIn(100);
                    });
                }
                else{
                    document.getElementById("form-pass-mismatch").innerText = "Passwords don't match!";
                }
            }
        }
        
}
function back_one(){
    $("#form2").fadeOut(100, function (){
        $("#form1").fadeIn(100);
    });
}
function next_two(){
    var fname = document.getElementById("fname");
    var lname = document.getElementById("lname");
    var uname = document.getElementById("regProfileID");
    fname.reportValidity();
    lname.reportValidity();
    regProfileID.reportValidity();

    if(fname.checkValidity() && lname.checkValidity() && regProfileID.checkValidity()){
        $("#form2").fadeOut(100, function (){
            $("#form3").fadeIn(100);
        });
    }
}
function back_two(){
    $("#form3").fadeOut(100, function (){
        $("#form2").fadeIn(100);
    });
}
function next_three(){
    var phone = document.getElementById("phone");
    var city = document.getElementById("city");
    var region = document.getElementById("region");
    phone.reportValidity();
    city.reportValidity();
    region.reportValidity();

    if(phone.checkValidity() && city.checkValidity() && region.checkValidity()){
        document.forms[1].submit();
    }
}

function Back(){
    history.go(-1);
}

function AccessError(){
    
    alert(ssn1 + ssn2);
    
}