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
	$pdo = get_pdo();

	if (!$pdo) {
		echo "<h1> Could not connect to database</h1>";
	}
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
	<ul class="summary_list">
		<li><h2>Recent summaries</h2></li>
		<?php
			$i=0;
			foreach ($pdo->query("SELECT summaries.* , users.username ,users.id AS userid FROM summaries LEFT OUTER JOIN users ON users.id=summaries.author ORDER BY date DESC") as $row) {
			echo "<li class='summary_plate'><a href='summary.php?id={$row['id']}'>{$row['header']}</a>";
			if ($row['userid']) {
						echo " by <a href='user.php?id={$row['userid']}'>{$row['username']}</a></li>";
					}
					else {
						echo " by Anonymous</a></li>";
					}
			$i++;
			if ($i == 5) {
				break;
			}
		}
		?>
	</ul>
	<p id="introduction">
		Welcome to Schoolhelp. This is a site that aims to help you improve your grades
		by allowing users to upload and read summaries of knowledge within different 
		subjects.
	</p>
</div>
<footer id="copyright">&copy Jacob Westberg All rights reserved.</footer>
</body>
</html>