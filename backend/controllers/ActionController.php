<?php 
include 'vendor/autoload.php';
include 'configs/DB.php';
class ActionController {
    private $conn;
    public function __construct() {
        $db = new DB();
        $this->conn = $db->connect();
    }
    
    public function actions($action) 
    {
        switch ($action) {
            case 'login':
                include 'controllers/AuthController.php';

                // Get user input
                $data = json_decode(file_get_contents("php://input"));

                $auth = new AuthController();
                $auth->login($data);
                break;
            case 'register':
                include 'controllers/AuthController.php';
                $data = json_decode(file_get_contents("php://input"));
                $auth = new AuthController();
                $auth->register($data);
                break;
            case 'create':
                break;
            case 'read':
                break;
            case 'readSingle':
                break;
            case 'update':
                break;
            default:
                echo json_encode(array('message' => 'Invalid action'));
                break;
        }
    }
}