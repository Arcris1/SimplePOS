<?php 
include 'vendor/autoload.php';
include 'models/UserModel.php';
include 'helpers/PageHelper.php';
class AuthController {
    private $conn;
    public function __construct() {
        $db = new DB();
        $this->conn = $db->connect();
    }

    public function login($data) 
    {
        // Check if email and password are not empty
        if (empty($data->email) || empty($data->password)) {
            echo json_encode(array('status' => 'error', 'message' => 'Email and password are required'));
            exit;
        }

        $user = new UserModel($this->conn);
        $result = $user->login($data);

        if ($result->rowCount() > 0) {
            $row = $result->fetch(PDO::FETCH_ASSOC);
            if (password_verify($data->password, $row['password'])) {
                echo json_encode(array('status' => 'success', 'access_token' => generate_jwt(), 'data' => $row));
                exit;
            } else {
                echo json_encode(array('status' => 'error', 'message' => 'Invalid email or password'));
                exit;
            }
        } else {
            echo json_encode(array('status' => 'error', 'message' => 'Invalid email or password'));
            exit;
        }
    }

    public function register($data) 
    {
        // Check if all fields are not empty
        if (empty($data->email) || empty($data->firstName) || empty($data->lastName) || empty($data->contactNumber) || empty($data->password)) {
            echo json_encode(array('status' => 'error', 'message' => 'All fields are required'));
            exit;
        }

        $user = new UserModel($this->conn);
        $result = $user->register($data);

        if ($result->rowCount() > 0) {
            http_response_code(201);
            echo json_encode(array('status' => 'success', 'message' => 'User registered successfully'));
            exit;
        } else {
            http_response_code(400);
            echo json_encode(array('status' => 'error', 'message' => 'Failed to register user'));
            exit;
        }
    }
}