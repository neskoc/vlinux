
<?php $uriFile = basename($_SERVER["REQUEST_URI"]); ?>

<nav class="navbar">
    <a href="me.php"
        class='<?= $uriFile == "me.php" ? "selected" : null ?>'>Hem</a>
    <a href="report.php"
        class='<?= $uriFile == "report.php" ? "selected" : null ?>'>Redovisning</a>
    <a href="about.php"
        class='<?= $uriFile == "about.php" ? "selected" : null ?>'>Om</a>
</nav>
