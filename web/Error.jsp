<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Edit Profile</title>
        <script src="assets/js/jquery.min.js"></script>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/css/style.css" rel="stylesheet">
        <link rel='icon' href='favicon.ico' type='image/x-icon' />
    </head>



    <body>
        <header>
            <div class="page-header pheader">
                <h3 style="margin-top: 0px; font-weight:bold;"><a href="openhome" id="head_title"> ##Title##</a></h3>
            </div>
        </header>
        <div class="container col-10 card" style="margin-top: 50px;">
            <img  src="assets/img/oar.png" height="250" width="250" style="margin: auto; margin-top: 25px; margin-bottom: 25px;">
            <code class="col-10 alert-danger" style="margin: auto; ${style}" >${message}</code>
            <ul class="nav" style="margin: auto; margin-top: 25px;">
                <li>
                    <form action="Manage" method="post">
                        <input type="hidden" name="action" value="private">
                        <button class="btn btn-secondary nav-margin nav-item" type="button" onClick="Back();">
                            Return
                        </button>
                    </form>
                </li>
                <li>
                    <form action="login.jsp" method="get">
                        <button class="btn btn-secondary nav-margin nav-item" type="submit">
                            Home
                        </button>
                    </form>
                </li>
            </ul>
        </div>
        <script>
            function Back() {
                history.go(-1);
            }
        </script>
    </body>
</html>