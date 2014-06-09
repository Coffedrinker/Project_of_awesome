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
if (!empty($pdo)) {

	if (!empty($_POST)) {
		$_POST = null;
		
		$header		= filter_input(INPUT_POST, 'header', FILTER_SANITIZE_SPECIAL_CHARS);
		$author		= filter_input(INPUT_POST, 'user_select', FILTER_VALIDATE_INT);
		$content	= filter_input(INPUT_POST, 'content', FILTER_SANITIZE_SPECIAL_CHARS);
		$subject 	= filter_input(INPUT_POST, 'subject', FILTER_VALIDATE_INT);

		
		if (!empty($header) && !empty($content) && !empty($subject)) {
			$statement = $pdo->prepare("INSERT INTO summaries (header, author, content, date, subject) VALUES (:header, :author, :content, NOW(), :subject)");
			$statement->bindParam(":header", $header);
			$statement->bindParam(":author", $author);
			$statement->bindParam(":content", $content);
			$statement->bindParam(":subject", $subject);
			
			$statement->execute();
			
		}
		
	}
	if (!empty($_GET)) {
		if (!empty($_GET["new_summary"])) {
?>
			<form action="summary.php" method="POST">
				<pre>* Are optional</pre>
				<label for="user_select">User:</label>
				<select name="user_select">
					<option>Anonymous</option>
					<?php
						foreach ($pdo->query("SELECT * FROM users ORDER BY username") as $row) {
							echo "<option value='{$row['id']}'>{$row['username']}</option>";
						}
					?>
				</select>
				<label for="header">Header:</label>	
				<input type="text" name="header"/>

				<label for="subject">Subject:</label>
				<select name="subject">
					<?php
						foreach ($pdo->query("SELECT * FROM subjects ORDER BY name") as $row) {
							echo "<option value={$row['id']}>{$row['name']}</option>";
						}
					?>
				</select>

				<label for="content">Content:</label>
				<textarea name="content"></textarea>

				<input name="submit" type="submit"/>
			</form>

<?php
			}
		if (!empty($_GET["subject"])) {
			$subject_id = filter_input(INPUT_GET, "subject", FILTER_SANITIZE_NUMBER_INT);
			$subject_name = get_single_value($pdo,'subjects','id',$subject_id,'name');
			$_GET = null;
			echo "";

			echo "<ul>";
			echo "<li><h2>Summaries under the " . $subject_name . " subject.</h2></li>";
			foreach ($pdo->query("SELECT summaries.* , users.username ,users.id AS userid FROM summaries LEFT OUTER JOIN users ON users.id=summaries.author WHERE summaries.subject=$subject_id ORDER BY date DESC") as $row) {
				echo "<li><a href='summary.php?id={$row['id']}'>{$row['header']}</a>";
				if ($row['userid']) {
					echo " by <a href='user.php?id={$row['userid']}'>{$row['username']}</a></li>";
				}
				else {
					echo " by Anonymous</a></li>";
				}
			}
			echo "</ul>";
		}
		if (!empty($_GET['id'])){
			$summary_id = filter_input(INPUT_GET, "id", FILTER_SANITIZE_NUMBER_INT);
			$_GET = null;

			foreach ($pdo->query("SELECT summaries.* , users.username, subjects.name AS subject_name, subjects.id AS subject_id FROM summaries LEFT OUTER JOIN users ON users.id=summaries.author JOIN subjects ON summaries.subject =subjects.id WHERE summaries.id=$summary_id") as $row) {
				echo "<h1>{$row['header']}</h1>";
				if (empty($row['username'])) {
					echo "<pre>Posted by Anonymous, the {$row['date']} in <a href='?subject={$row['subject_id']}'>{$row['subject_name']}</a></pre>";
				}
				else{
					echo "<pre>Posted by {$row['username']}, the {$row['date']} in <a href='?subject={$row['subject_id']}'>{$row['subject_name']}</a></pre>";
				}
				echo "<p>{$row['content']}<p>";
			}
			echo "You are looking at summary nr." . $summary_id;

		}
		
	}
	else {
		echo "<ul>";
		echo "<li>All summaries</li>";
			foreach ($pdo->query("SELECT summaries.* , users.username ,users.id AS userid FROM summaries LEFT OUTER JOIN users ON users.id=summaries.author ORDER BY date DESC") as $row) {
				echo "<li><a href='summary.php?id={$row['id']}'>{$row['header']}</a>";
				if ($row['userid']) {
					echo " by <a href='user.php?id={$row['userid']}'>{$row['username']}</a></li>";
				}
				else {
					echo " by Anonymous";
				}
			}
		echo "</ul>";
		echo "<a href='?new_summary=true'>New Summary</a> ";
	}
}
else{
	echo "<p> Connection failed</p>";
}



?>
</div>
<footer id="copyright">&copy Jacob Westberg All rights reserved.</footer>
</body>
</html>