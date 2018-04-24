<link rel="stylesheet" type="text/css" href="css/product.css"/>
<script type ="text/javascript" src="js/headerJoinScript.js"></script>


    

            

             
        
 


<div id = "topLogin">
    <div class="container_16">
        <div id="LoginBox" class="grid_16" style="max-width: 70%; margin-left: 15%">

            <div class="grid_6" id = "loginForm">
                <form  method="post" action="loginServlet"  name="login">
                    <table>
                        <tr>
                            <td colspan="2">
                                <h1><strong style="font-wieght:bold; text-align:left; padding:20px 0px; color:#FFF;">Anmelden</strong></h1>
                            </td>
                            <td>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Email</label>
                            </td>
                            <td>
                                <label><input type="email" name="email" placeholder="john_lee@xyz.com" required/><br/></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Passwort</label>
                            </td>
                            <td>
                                <input type="password" name="pass" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;" required/><br/>
                            </td>
                        </tr><tr>
                            <td>

                            </td>
                            <td>
                                <input type="submit" value="Anmelden" id="greenBtn" style="color: #00ccff; font-size: 26px;"/><br/>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <div class="grid_6 push_2" id = "RegisterForm">
                <form  method="POST" action="register" name="registerServlet">
                    <table>
                        <tr>
                            <td colspan="2">
                                <h1><strong style="font-wieght:bold; text-align:right; padding:20px 0px; color:#FFF;">Registrieren</strong></h1>
                            </td>
                            <td>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Email</label>
                            </td>
                            <td>
                                <label><input type="email" name="emailReg" placeholder="john_lee@xyz.com" required/><br/></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Passwort</label>
                            </td>
                            <td>
                                <input type="password" name="passReg" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;" required/><br/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Password wiederholen</label>
                            </td>
                            <td>
                                <input type="password" name="passAgainReg" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;" required/><br/>
                            </td>
                        </tr>
                        <!--	<tr>
                                        <td>
                                        <label>Gender</label>
                                        </td>
                                        <td>
                                        <select>
                                                <option name="gender" value="male">Male</option>
                                                <option name="gender" value="female">Female</option>
                                        </select><br/>
                                        </td>
                                </tr>-->

                        <tr>
                            <td>
                            </td>
                            <td>
                                <input type="submit" value="Registrieren" id="greenBtn" style="color: #00ccff; font-size: 26px;" /><br/>
                            </td>
                        </tr>
                    </table>

                </form>
            </div>
        </div>
    </div>
</div>