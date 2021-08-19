<?php
session_start();

if(!isset($_SESSION['vitrine-user'])){

    header('Location: /pw2-2021-main/views/customerLogin.php');
}