<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
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
        <title>Private Information</title>
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
                                    <input type="hidden" name="action" value="deleteaccount">
                                    <button class="btn btn-secondary nav-margin nav-item" type="submit">
                                        Delete Account
                                    </button>
                                </form>
                            </li>
                            <li>
                                <form action="Manage" method="post">
                                    <input type="hidden" name="action" value="changepassword">
                                    <button class="btn btn-secondary nav-margin nav-item" type="submit">
                                        Change Password
                                    </button>
                                </form>
                            </li>
                            <li>
                                <form action="Manage" method="post">
                                    <input type="hidden" name="action" value="home">
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
                <div class="sign_form center form-group">
                    <legend class="legend">Private Information</legend>
                    <table class="tablediv">
                        <tr>
                            <td style="font-weight:bold;">SSN:</td>
                            <td>
                                <c:out value="${user.SSN}" />
                            </td>
                        </tr>
                        <tr>
                            <td style="font-weight:bold;">Email:</td>
                            <td>
                                <c:out value="${user.email}" />
                            </td>
                        </tr>
                        <tr>
                            <td style="font-weight:bold;">Phone:</td>
                            <td>
                                <c:out value="${user.telephone}" />
                            </td>
                        </tr>
                        <tr>
                            <td style="font-weight:bold;">City, Region:</td>
                            <td>
                                <c:out value="${user.city}, ${user.region}" />
                            </td>
                        </tr>
                    </table>

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