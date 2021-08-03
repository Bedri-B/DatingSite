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
    <body>
        <header>
            <div class="page-header pheader">
                <h3 style="margin-top: 0px; font-weight:bold;"><a href="openhome" id="head_title"> ##Title##</a></h3>
            </div>
        </header>
        <div class="container col-8 center" style="margin-top: 50px; display: flex;">

            <form class="col-3" method="post" action="login.jsp" style="display: inline;">
                <input type="hidden" name="type" value="login">
                <button type="submit" action="post" style="padding-bottom: 10px; margin-left: 35%; margin-top: 30px;" class=" btn btn-info ">Sign In </button>
            </form> 
            <form class="col-3" method="post" action="login.jsp" style="display: inline;">
                <input type="hidden" name="type" value="signup">
                <button type="submit" action="post" style="padding-bottom: 10px; margin-left: 35%; margin-top: 30px;" class=" btn btn-info ">Sign Up </button>
            </form> 
        </div>

    </body>
</html
