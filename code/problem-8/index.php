<?php
    $connect = mysqli_connect( "localhost", "root", "", "student" );
    $query   = "SELECT * FROM student_list ORDER BY ID ASC";
    $result  = mysqli_query( $connect, $query );

?>
<html>
<head>
<title>Student's List</title>

</head>
<body>
	<h1 style="text-align:center;">Student's List</h1>
	<table align='center'>
		<thead>
      <tr>
        <th>S/L</th>
        <th>Roll</th>
        <th>Name</th>
        <th>GPA</th>
      </tr>
    </thead>
    <tbody>
        <?php
        while ( $row = mysqli_fetch_assoc( $result ) ) {?>
          <tr>
            <td><?php echo $row['ID'] ?></td>
            <td><?php echo $row['roll'] ?></td>
            <td><?php echo $row['name'] ?></td>
            <td><?php echo $row['gpa'] ?></td>
          </tr>
      <?php
          }
      ?>
    </tbody>
</table>
</body>
</html>