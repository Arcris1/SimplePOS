<?php 
include 'vendor/autoload.php';

header("Access-Control-Allow-Origin: *");
header("Content-Type: application/json; charset=UTF-8");
header("Access-Control-Allow-Methods: POST");
header("Access-Control-Max-Age: 3600");
header("Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With");

$data = json_decode(file_get_contents("php://input"));

if (!isset($_GET['action'])) {
    echo json_encode(array('message' => 'Action is required'));
    die();
}

$action  = $_GET['action'];

include 'controllers/ActionController.php';

$controller = new ActionController();
$controller->actions($action);