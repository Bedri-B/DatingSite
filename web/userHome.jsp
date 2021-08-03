<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta charset="ISO-8859-1" />
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/script.js"></script>
        <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
         
        <link rel="stylesheet" href="assets/css/style.css" />

        <link rel="icon" href="favicon.ico" type="image/x-icon" />
        <title>My Profile</title>
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
                                <form action="profiles" method="post">
                                    <input type="hidden" name="action" value="singles">
                                    <button class="btn btn-secondary nav-margin nav-item " type="submit">
                                        Singles Near You
                                    </button>
                                </form>
                            </li>
                            <li>
                                <form action="Manage" method="post">
                                    <input type="hidden" name="action" value="edit">
                                    <button class="btn btn-secondary nav-margin nav-item" type="submit">
                                        Edit profile
                                    </button>
                                </form>
                            </li>
                            <li>
                                <form action="Manage" method="post">
                                    <input type="hidden" name="action" value="private">
                                    <button class="btn btn-secondary nav-margin nav-item" type="submit">
                                        Private info
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
                    <legend class="legend">Profile Information</legend>
                    <table class="tablediv">
                        <tr>
                            <td style="font-weight: bold">Profile ID:</td>
                            <td>
                                <c:out value="${profile.profileid}" />
                            </td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold">Email:</td>
                            <td>
                                <c:out value="${user.email}" />
                            </td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold">Age:</td>
                            <td>
                                <c:out value="${profile.age}" />
                            </td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold">Dating Age Range Start:</td>
                            <td>
                                <c:out value="${profile.dars}" />
                            </td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold">Dating Age Range End:</td>
                            <td>
                                <c:out value="${profile.dare}" />
                            </td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold">Dating Geo Range(Km):</td>
                            <td>
                                <c:out value="${profile.dgr}" />
                            </td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold">Gender</td>
                            <td>
                                <c:out value="${profile.m_f}" />
                            </td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold">Hobbies:</td>
                            <td>
                                <c:out value="${profile.hobbies}" />
                            </td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold">Height(cm):</td>
                            <td>
                                <c:out value="${profile.height}" />
                            </td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold">Weight(Kg):</td>
                            <td>
                                <c:out value="${profile.weight}" />
                            </td>
                        </tr>
                        <tr>
                            <td style="font-weight: bold">Hair Color:</td>
                            <td>
                                <c:out value="${profile.haircolor}" />
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