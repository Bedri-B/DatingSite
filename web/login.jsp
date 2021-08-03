<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="ISO-8859-1">
        <title>Login</title>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/script.js"></script>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css">
        <link rel="stylesheet" href="assets/css/style.css" >
        <link rel='icon' href='favicon.ico' type='image/x-icon'/>
    </head>
    <c:choose>
        <c:when test="${paramValues.type == 'signup'}" >  <body onload="newAccount();" > </c:when>
        <c:otherwise> <body> </c:otherwise>    
    </c:choose>
        <header>
            <div class="page-header pheader">
                <h1 style="margin-top: 0px; font-weight:bold;"><a href="openhome" id="head_title"> ##Title##</a></h1>
            </div>
        </header>
        ${msg}
        <div id="signin" class="sign_form center form-group">
            <form class="form-signin signInFrm" method="post" action="Login">
                <fieldset class="em_ps">
                    <legend class="legend signInh2"> Log into account </legend>
                    <div class="form-group" >
                        <label for="email" class="sr-only">Email</label>
                        <input type="email" id="loginEmail" name="email"  value="${email}" class="form-control" placeholder="Email" required autofocus>
                    </div>
                    <div class="form-group">
                        <label for="password" class="sr-only">Password</label>
                        <input type="password" id="loginPass" name="password" class="form-control" placeholder="Password" required>
                    </div>
                    ${errMsg}
                    <button class="btn btn-lg btn-primary btn-block bttnSignIn" type="submit">Sign In</button>
                    <br>
                    <p> Not a member yet? <a href="#" onClick="newAccount();">Sign Up</a></p>
                </fieldset>
            </form>
        </div>


        <div id="signup" class="sign_form center form-group" style="display:none">
            <form class="form-signin signInFrm" method="post" action="register">
                <fieldset id="form1">
                    <legend class="legend signInh2"> Create an account </legend>
                    <div class="form-group" >
                        <label for="regEmail" class="sr-only">SSN</label>
                        <input type="email" id="regEmail" name="regEmail" class="form-control" placeholder="E-mail" required autofocus>
                    </div>
                    <small id="form-pass-len"></small>
                    <div class="form-group">
                        <label for="regPass" class="sr-only">Password</label>
                        <input type="password" id="regPass" name="regPass1" class="form-control" placeholder="Password" required>
                    </div>
                    <small id="form-pass-mismatch"></small>
                    <div class="form-group">
                        <label for="regConfirmPass" class="sr-only">Confirm Password</label>
                        <input type="password" id="regConfirmPass" name="regPass2" class="form-control" placeholder="Confirm Password" required>
                    </div>

                    <button class="btn btn-lg btn-primary btn-block bttnSignIn" type="button" onclick="next_one();"> Sign Up </button>
                    <br>
                    <p> Already a member? <a href="#" onClick="alreadyMem();">Sign In</a></p>
                </fieldset>

                <fieldset id="form2" style="display:none">
                    <legend class="legend signInh2"> Additional Information </legend>
                    <div class="form-group">
                        <label for="fname" class="sr-only">First Name</label>
                        <input type="text" id="fname" name="fname" class="form-control" placeholder="First Name" size="11" required>
                    </div>
                    <div class="form-group" >
                        <label for="lname" class="sr-only">Last Name</label>
                        <input type="text" id="lname" name="lname" class="form-control" placeholder="Last Name" size="11" required>
                    </div>
                    <div class="form-group" >
                        <label for="regProfileID" class="sr-only">ProfileID</label>
                        <input type="text" id="regProfileID" name="regProfileID" class="form-control" placeholder="Username" required autofocus>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-lg btn-primary btn-block bttnSignIn" type="button" onClick="next_two();"> Next </button>
                        <button class="btn btn-lg btn-primary btn-block bttnSignIn" type="button" onClick="back_one();"> Back </button>
                    </div>
                </fieldset>

                <fieldset id="form3" style="display:none">
                    <legend class="legend signInh2"> Finishing Up </legend>

                    <div class="form-group">
                        <label for="phone" class="sr-only">Phone Number</label>
                        <input type="text" id="phone" name="phone" class="form-control" placeholder="Phone number" size="11" required>
                    </div> 
                    <div class="form-group">
                        <label for="city" class="sr-only">City</label>
                        <input type="text" id="city" name="city" class="form-control" placeholder="City" size="11" required>
                    </div>
                    <div class="form-group">
                        <label for="region" class="sr-only">State</label>
                        <input type="text" id="region" name="region" class="form-control" placeholder="Region" size="11" required>
                    </div>
                    <div class="form-group">
                        <input style="padding-left: 10px;" type="checkbox" id="term_cond" name="term_cond" size="11" required>
                        <label style="padding-left: 10px;" for="term_cond">I Agree to the <a href="assets/help.pdf" target="_blank" > Terms and Conditions. </a></label>
                    </div>

                    <div class="form-group">
                        <button class="btn btn-lg btn-primary btn-block bttnSignIn" type="button" onClick="next_three();"> Finish </button>
                        <button class="btn btn-lg btn-primary btn-block bttnSignIn" type="button" onClick="back_two();"> Back </button>
                    </div>
                </fieldset>   

            </form>
        </div>

    </body>
</html>