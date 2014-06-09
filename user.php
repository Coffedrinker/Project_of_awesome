<!DOCTYPE html>
<html>
<head>
	<title>Schoolhelp</title>
	<meta http-equiv="content-Type" content="text/html"/>
	<link rel="stylesheet" type="text/css" href="style.css"/>
</head>
<body>
<?php

include 'includes/dbconnect.inc.php';
include 'includes/includes.inc.php';
 $pdo = get_pdo();
?>
<nav>
 	<a id="image" href="index.php"><img src="images/logo.jpg" alt="logo"/></a>

	<ul>
		<li>Subjects &dArr;
			<ul>
				<?php
				foreach ($pdo->query("SELECT * FROM subjects ORDER BY name") as $row) {
					echo "<li><a href='summary.php?subject={$row['id']} '>{$row['name']}</a></li>";
				}
				?>
			</ul>
		</li>
	</ul>
	<a href='summary.php'>Summaries</a>
</nav>
<div class="content">
<?php
if ($pdo) {
	if (empty($_GET)) {
		echo "<ul>";
		echo "<li> List of users</li>";
		foreach ($pdo->query("SELECT * FROM users ORDER BY  id") as $row) {
			echo "<li><a href='?id={$row['id']}'>{$row['username']}</a></li> ";
		}
		echo "</ul>";
	}
	else
	{
		$user_id = $_GET['id'];
		$_GET = null;
		echo "You are viewing user: " . get_single_value($pdo, 'users' ,'id' ,$user_id ,'username');

		echo "<ul>";
		echo "<li>Summaries submitted by " . get_single_value($pdo, 'users' ,'id' ,$user_id ,'username') . "</li>" ;		
		foreach ($pdo->query("SELECT summaries.*, users.username AS username FROM summaries LEFT OUTER JOIN users on users.id=summaries.author WHERE summaries.author=$user_id ORDER BY date DESC") as $row) {
			echo "<li class='summary_plate'><a href='summary.php?id={$row['id']}' >{$row['header']}</a></li>";
		}
		echo "</ul>";
	}
}
else
{
	echo "<h1> Could not connect to server.</h1>";
}

?>
</div>
<footer id="copyright">&copy Jacob Westberg All rights reserved.</footer>
</body>
</html>