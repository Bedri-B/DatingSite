<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <meta charset="ISO-8859-1" />
        <title>Edit Profile</title>
        <script src="assets/js/jquery.min.js"></script>
        <script src="assets/js/script.js"></script>
        <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
        <link href="assets/css/style.css" rel="stylesheet" />
        <link href="assets/css/home.css" rel="stylesheet" />
        <link href="assets/css/header.css" rel="stylesheet" />
        <link rel="icon" href="favicon.ico" type="image/x-icon" />
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
                    <div id="signin" class="center sign_form form-group">
                        <form class="form-edit_profile signInFrm" method="post" action="edit_profile" name="editForm">
                            <c:choose>
                                <c:when test="${isnew!='true'}">
                                    <fieldset  class="em_ps">
                                        <legend class="legend signInh2"> Edit your profile </legend>
                                        <div class="form-group">
                                            <label for="regAge" class="">Age</label>
                                            <input type="age" id="regAge" name="regAge" value=${profile.age} class="form-control" placeholder="Age" required
                                                   autofocus />
                                        </div>
                                        <div class="form-group">
                                            <label for="regDars" class="">Dating Age Start</label>
                                            <input type="dating age low" id="regDars" name="regDars" class="form-control"
                                                   placeholder="Dating Age Lower Bound"  value="${profile.dars}" required autofocus />
                                        </div>
                                        <div class="form-group">
                                            <label for="regDare" class="">Dating Age End</label>
                                            <input type="dating age high" id="regDare" name="regDare" class="form-control"
                                                   placeholder="Dating Age Upper Bound" value="${profile.dare}" required autofocus />
                                        </div>
                                        <div class="form-group">
                                            <label for="regDgr" class="">Dating Geo Range</label>
                                            <input type="dating geo range" id="regDgr" name="regDgr" class="form-control"
                                                   placeholder="Dating Radius (Kilometers)" value="${profile.dgr}" required autofocus />
                                        </div>
                                        <div class="form-group">
                                            <label class="" for="regMF" >Gender</label>
                                            <div class="form-group"> 
                                                <c:choose>
                                                    <c:when test="${profile.m_f == 'Male'}">
                                                        <input type="radio" id="regMF" name="gen"  required
                                                               autofocus checked />
                                                        <label for="regMF" class="" style="margin-right:20px;" >Male</label>
                                                        <input type="radio" id="regMF" name="gen"  required
                                                               autofocus />
                                                        <label for="regMF" class="">Female</label>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <input type="radio" id="regMF" name="gen"  required
                                                               autofocus />
                                                        <label for="regMF" class="" style="margin-right:20px;" >Male</label>
                                                        <input type="radio" id="regMF" name="gen"  required
                                                               autofocus checked/>
                                                        <label for="regMF" class="">Female</label>
                                                    </c:otherwise>
                                                </c:choose>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="regHobbies" class="">Hobbies</label>
                                            <input type="hobbies" id="regHobbies" name="regHobbies" value="${profile.hobbies}" class="form-control" placeholder="Hobbies"
                                                   required autofocus />
                                        </div>
                                        <div class="form-group">
                                            <label for="regHeight" class="">Height</label>
                                            <input type="height" id="regHeight" name="regHeight" class="form-control" value="${profile.height}" placeholder="Height"
                                                   required autofocus />
                                        </div>
                                        <div class="form-group">
                                            <label for="regWeight" class="">Weight</label>
                                            <input type="weight" id="regWeight" name="regWeight" class="form-control" value="${profile.weight}" placeholder="Weight"
                                                   required autofocus />
                                        </div>
                                        <div class="form-group">
                                            <label for="regHair" class="">Hair Color</label>
                                            <input type="hair_color" id="regHair" name="regHair" tooltip="Hair Color" class="form-control"  value="${profile.haircolor}" placeholder= "Hair Color"
                                                   required autofocus />
                                        </div>
                                        <button class="btn btn-lg btn-primary btn-block bttnSignIn" type="submit">
                                            Submit
                                        </button>
                                    </fieldset>                    
                                </c:when>
                                <c:otherwise>
                                    <fieldset  class="em_ps">
                                        <legend class="legend signInh2"> Edit your profile </legend>
                                        <div class="form-group">
                                            <label for="regAge" class="">Age</label>
                                            <input type="age" id="regAge" name="regAge" class="form-control" placeholder="Age" required
                                                   autofocus />
                                        </div>
                                        <div class="form-group">
                                            <label for="regDars" class="">Dating Age Start</label>
                                            <input type="dating age low" id="regDars" name="regDars" class="form-control"
                                                   placeholder="Dating Age Lower Bound"  required autofocus />
                                        </div>
                                        <div class="form-group">
                                            <label for="regDare" class="">Dating Age End</label>
                                            <input type="dating age high" id="regDare" name="regDare" class="form-control"
                                                   placeholder="Dating Age Upper Bound"  required autofocus />
                                        </div>
                                        <div class="form-group">
                                            <label for="regDgr" class="">Dating Geo Range</label>
                                            <input type="dating geo range" id="regDgr" name="regDgr" class="form-control"
                                                   placeholder="Dating Radius (Kilometers)"  required autofocus />
                                        </div>
                                        <div class="form-group">
                                            <label class="">Gender</label>
                                            <input type="radio" id="regMF" name="regMF"  class="" placeholder="Gender" required
                                                   autofocus />
                                            <label for="regMF" class="">Male</label>
                                            <input type="radio" id="regMF" name="regMF" class="" placeholder="Gender" required
                                                   autofocus />
                                            <label for="regMF" class="">Female</label>
                                        </div>
                                        <div class="form-group">
                                            <label for="regHobbies" class="">Hobbies</label>
                                            <input type="hobbies" id="regHobbies" name="regHobbies"  class="form-control" placeholder="Hobbies!"
                                                   required autofocus />
                                        </div>
                                        <div class="form-group">
                                            <label for="regHeight" class="">Height</label>
                                            <input type="height" id="regHeight" name="regHeight" class="form-control"  placeholder="Height"
                                                   required autofocus />
                                        </div>
                                        <div class="form-group">
                                            <label for="regWeight" class="">Weight</label>
                                            <input type="weight" id="regWeight" name="regWeight" class="form-control"  placeholder="Weight"
                                                   required autofocus />
                                        </div>
                                        <div class="form-group">
                                            <label for="regHair" class="">Hair Color</label>
                                            <input type="hair_color" id="regHair" name="regHair" tooltip="Hair Color" class="form-control"   placeholder="Hair Color"
                                                   required autofocus />
                                        </div>
                                        <button class="btn btn-lg btn-primary btn-block bttnSignIn" type="submit">
                                            Submit
                                        </button>
                                    </fieldset>                    
                                </c:otherwise>
                            </c:choose>

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