<?php

class UserModel {
    private $conn;
    private $table = 'Users';

    public $id;
    public $email;
    public $firstName;
    public $lastName;
    public $contactNumber;
    public $password;
    public $createdAt;
    public $updatedAt;


    public function __construct($conn) {
        $this->conn = $conn;
    }

    public function login($data) 
    {  
        // Sanitize input
        $email = htmlspecialchars($data->email);
        $password = htmlspecialchars($data->password);
        
        $query = 'SELECT * FROM ' . $this->table . ' WHERE email = :email';
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':email', $email);

        $stmt->execute();

        return $stmt;
    }

    public function register($data) 
    {
        // Check if email already exists
        $checkEmail = $this->checkEmail($data->email);
        if ($checkEmail->rowCount() > 0) {
            echo json_encode(array('status' => 'error', 'message' => 'Email already exists'));
            exit;
        }

        $query = 'INSERT INTO ' . $this->table . ' SET email = :email, firstName = :firstName, lastName = :lastName, contactNumber = :contactNumber, password = :password';
        $stmt = $this->conn->prepare($query);

        // Sanitize input
        $email = htmlspecialchars($data->email);
        $firstName = htmlspecialchars($data->firstName);
        $lastName = htmlspecialchars($data->lastName);
        $contactNumber = htmlspecialchars($data->contactNumber);
        $encryptedPwd = password_hash(htmlspecialchars($data->password), PASSWORD_DEFAULT);

        // Bind parameters
        $stmt->bindParam(':email', $email);
        $stmt->bindParam(':firstName', $firstName);
        $stmt->bindParam(':lastName', $lastName);
        $stmt->bindParam(':contactNumber', $contactNumber);
        $stmt->bindParam(':password', $encryptedPwd);

        $stmt->execute();
        
        return $stmt;
    }

    public function checkEmail($email) 
    {
        $query = 'SELECT * FROM ' . $this->table . ' WHERE email = :email';
        $stmt = $this->conn->prepare($query);

        $email = htmlspecialchars($email);

        $stmt->bindParam(':email', $email);

        $stmt->execute();

        return $stmt;
    }

    public function getUser() 
    {
        $query = 'SELECT * FROM ' . $this->table . ' WHERE id = :id';
        $stmt = $this->conn->prepare($query);

        $this->id = htmlspecialchars(strip_tags($this->id));

        $stmt->bindParam(':id', $this->id);

        $stmt->execute();

        return $stmt;
    }

    public function getUsers() 
    {
        $query = 'SELECT * FROM ' . $this->table;
        $stmt = $this->conn->prepare($query);

        $stmt->execute();

        return $stmt;
    }
}