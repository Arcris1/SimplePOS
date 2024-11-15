<?php 

class DB {
    private $host = '127.0.0.1';
    private $db_name = 'cris_pos';
    private $username = 'root';
    private $password = '';
    private $port = '3307';
    private $conn;


    public function connect() {
        $this->conn = null;

        try {
            $this->conn = new PDO('mysql:host=' . $this->host . ';dbname=' . $this->db_name . ';port=' . $this->port, $this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
        } catch (PDOException $e) {
            echo 'Connection Error: ' . $e->getMessage();
        }

        return $this->conn;
    }
}