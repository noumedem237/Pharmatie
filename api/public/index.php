<?php

require("../private/include.php");
$navigator = new Navigator();
$navigator->getApi($_POST['service'], $_POST['key']);

?>