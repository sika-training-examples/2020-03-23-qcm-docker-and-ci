<?php

// Create connection
$conn = new mysqli($_ENV["MYSQL_HOST"], $_ENV["MYSQL_USER"], $_ENV["MYSQL_PASSWORD"],  $_ENV["MYSQL_DATABASE"]);

// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
}

$sql = "SELECT message FROM hello;";
$result = $conn->query($sql);

if ($result->num_rows > 0) {
  // output data of each row
  while($row = $result->fetch_assoc()) {
    echo "<h1>" . $row["message"] . "</h1>";
  }
} else {
  echo "0 results";
}
$conn->close();
?>
