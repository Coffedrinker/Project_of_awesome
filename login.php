<?php

include "includes/dbconnect.inc.php";
$pdo = get_pdo();

if ($pdo) {
	echo '<pre>Connected</pre>';

	echo <<<login
	<form action="login.php" method="POST">
		<input name="name" id="name" placeholder="Name"/>
		<input name="pwd" id="password" placeholder="Password" type="password"/>
		<input name="login" id="login_submit" type="submit" value="Log in"/>
	</form>
login;
}
else {
	echo "<pre>Connection failed</pre>";
}

?>