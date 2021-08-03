<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8">
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta charset="ISO-8859-1" />
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/script.js"></script>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
        
        <link rel="stylesheet" href="assets/css/style.css" />

        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <title>Change Password</title>
    </head>

    <body>
        <c:choose>
            <c:when test="${user != null}">
                <header>
                    <nav>
                        <div class="page-header pheader row">
                            <h1 style="margin-top: 0px; font-weight: bold"><a href="openhome" id="head_title"> ##Title##</a></h1>
                            <ul class="main-nav nav">

                                <li>
                                    <form action="Manage" method="post">
                                        <input type="hidden" name="action" value="private">
                                        <button class="btn btn-secondary nav-margin nav-item" type="submit">
                                            Return
                                        </button>
                                    </form>
                                </li>
                                <li>
                                    <form action="Manage" method="post">
                                        <input type="hidden" name="action" value="logout">
                                        <button class="btn btn-secondary nav-margin nav-item" type="submit">
                                            Logout
                                        </button>
                                    </form>
                                </li>
                            </ul>
                            <img class="rounded-circle account-img-post" src="${profile.profilepic}">
                        </div>
                    </nav>
                </header>
                <section>
                    <div class="center sign_form form-group">
                        <form class="form-signin signInFrm" method="post" action="changepasswordsubmit">
                            <fieldset>
                                <legend class="legend signInh2"> Change your password </legend>
                                ${errMsg1}
                                <div class="form-group ${border1}">
                                    <label for="oldpass" value="${pass}" class="sr-only">Old Password</label>
                                    <input type="password" id="oldpass" name="oldpass" class="form-control" placeholder="Old Password"
                                           required autofocus>
                                </div>
                                <div class="form-group">
                                    <label for="newpass" value="${npass}" class="sr-only">New Password</label>
                                    <input type="password" id="newpass" name="newpass1" class="form-control" placeholder="New Password"
                                           required>
                                </div>
                                ${errMsg2}
                                <div class="form-group  ${border2}">
                                    <label for="checknewpass" class="sr-only">Re-enter Password</label>
                                    <input type="password" id="checknewpass" name="newpass2" class="form-control"
                                           placeholder="Confirm New Password" required autofocus>
                                </div>

                                <button class="btn btn-primary btn-block bttnSignIn" type="submit">Submit</button>
                            </fieldset>
                        </form>
                    </div>
                </section>
            </c:when>
            <c:otherwise>
                <header>
                    <div class="page-header pheader">
                        <h3 style="margin-top: 0px; font-weight:bold;"><a href="openhome" id="head_title"> ##Title##</a></h3>
                    </div>
                </header>
                <div class="container col-8 card center" style="margin-top: 50px;">
                    <img  src="assets/img/oar.png" height="250" width="250" style="margin-left: 25%">
                    <h4 class="alert-danger alert-heading" style="margin-top: 15px">There was an error executing your request!!</h4>
                    <h5 style="padding-bottom: 10px; margin-left: 35%; margin-top: 30px" class=" btn btn-info col-3" onClick="Back();">Return</h5>
                </div>
                <script>
                    function Back() {
                        history.go(-1);
                    }
                </script>
            </c:otherwise>
        </c:choose>
    </body>

</html>