    
<div id = "topLogin">
    <div class="container_16">
        <div id="LoginBox" class="grid_16">

            <div class="grid_6" id = "loginForm">
                <form method="POST" action="login"  name="loginForm">
                    <table>
                        <tr>
                            <td colspan="2">
                                <h1><strong style="font-wieght:bold; text-align:left; padding:20px 0px; color:#FFF;">Login...</strong></h1>
                            </td>
                            <td>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Email</label>
                            </td>
                            <td>
                                <label><input type="text" name="email" placeholder="john_lee@xyz.com" /><br/></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Password</label>
                            </td>
                            <td>
                                <input type="password" name="pass" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;" /><br/>
                            </td>
                        </tr><tr>
                            <td>

                            </td>
                            <td>
                                <input type="submit" value="Login!!" id="greenBtn" /><br/>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

            <div class="grid_6 push_3" id = "RegisterForm">
                <form method="POST" action="register" name="registerForm">
                    <table>
                        <tr>
                            <td colspan="2">
                                <h1><strong style="font-wieght:bold; text-align:right; padding:20px 0px; color:#FFF;">Registrieren!!</strong></h1>
                            </td>
                            <td>

                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Email</label>
                            </td>
                            <td>
                                <label><input type="text" name="email" placeholder="john_lee@xyz.com" /><br/></label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Passwort</label>
                            </td>
                            <td>
                                <input type="password" name="pass" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;" /><br/>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <label>Passwort wiederholen</label>
                            </td>
                            <td>
                                <input type="password" name="passAgain" placeholder="&bull;&bull;&bull;&bull;&bull;&bull;&bull;" /><br/>
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
                                <input type="submit" value="Register" id="greenBtn" /><br/>
                            </td>
                        </tr>
                    </table>

                </form>
            </div>
        </div>
    </div>
</div>