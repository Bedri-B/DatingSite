<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta charset="ISO-8859-1">
        <title>Profiles</title>
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

    </head>

    <body>
    <header>
        <nav>
            <div class="page-header pheader row">
                <h1 style="margin-top: 0px; font-weight: bold"><a href="openhome" id="head_title"> ##Title##</a></h1>
                <ul class="main-nav nav">
                    <c:choose>
                        <c:when test="${ssn1==ssn2}">
                            <li>
                                <form action="" method="post" class="text-center">
                                    <input type="hidden" name="Username" value="${loggedIn}" />
                                    <button type="button" onclick="Back();"
                                            class="btn btn-secondary nav-margin nav-item">Return</button>
                                </form>
                            </li>
                            <li>
                                <form action="login.jsp" method="post">
                                    <button class="btn btn-secondary nav-margin nav-item" type="submit">
                                        Logout
                                    </button>
                                </form>
                            </li>
                        </c:when>
                    </c:choose>
                </ul>
                <c:choose>
                    <c:when test="${ssn1==ssn2}">
                        <img class="rounded-circle account-img-post" src="${profilepic}">
                    </c:when>
                </c:choose>
            </div>
        </nav>

        <div class="pheader">
            <div class="custom-search-input">
                <form class="form-inline" action="profiles" method="post">
                    <input type="search" class="form-control" style="width: 250px;" name="searchField" size="5"
                           placeholder="Search" required />
                    <button class="btn btn-group-lg" style="margin-left: auto;" 
                            type="submit">Search</i></button>
                </form>
            </div>
        </div>

    </header>
    <section>

        <div class="container col-9 row_1">
            ${query}
            <c:forEach items="${profiles}" var="profile">
                <div class="col-4 column">
                    <div class="post">
                        <img class="rounded-circle account-img-post" src="${profile.profilepic}">
                        <div class="author">
                            <b>${profile.fullname}</b>
                            <p class="post-link">${profile.m_f}, ${profile.age} </p>
                        </div>
                        <p class="post-link">Hobbies: ${profile.hobbies} </p>
                        <p class="post-link">Height: ${profile.height} </p> 
                        <p class="post-link">Weight: ${profile.weight} </p> 
                        <p class="post-link">Hair Color: ${profile.haircolor} </p> 
                        <span>
                            <form action="like" method=post style="display: inline;">
                                <input type="hidden" name="liker" value="${profile.profileid}" />
                                <button class="btn btn-info" type="submit"
                                        data-original-title="Like this user" data-toggle="tooltip"
                                        style="display: inline;">
                                    Like
                                </button>
                            </form>
                            <form action="like" method=post  style="display: inline;">
                                <input type="hidden" name="liker" value="${profile.profileid}" />
                                <button class="btn btn-info" type="submit"
                                        data-original-title="Like this user" data-toggle="tooltip"
                                        style="display: inline;">
                                    Message
                                </button>
                            </form>
                        </span>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</section>
</body>

</html>