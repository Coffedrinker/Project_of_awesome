<?php

function get_single_value($pdo, $tableName, $prop, $value, $columnName)
{
  $q = $pdo->query("SELECT * FROM $tableName WHERE $prop='".$value."'");
  $f = $q->fetch();
  $result = $f[$columnName];
  return $result;
}

?>