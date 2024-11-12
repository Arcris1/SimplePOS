<?php 

class ProductModel {
    private $conn;
    private $table = 'Products';

    public $id;
    public $name;
    public $description;
    public $price;
    public $quantity;
    public $createdAt;
    public $updatedAt;
    
    public function __construct($db) {
        $this->conn = $db;
    }

    public function read() {
        $query = 'SELECT * FROM ' . $this->table;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        return $stmt;
    }

    public function readSingle() {
        $query = 'SELECT * FROM ' . $this->table . ' WHERE id = :id';
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':id', $this->id);
        $stmt->execute();
        return $stmt;
    }

    public function create() {
        $query = 'INSERT INTO ' . $this->table . ' SET name = :name, description = :description, price = :price, quantity = :quantity';
        $stmt = $this->conn->prepare($query);

        $this->name = htmlspecialchars(strip_tags($this->name));
        $this->description = htmlspecialchars(strip_tags($this->description));
        $this->price = htmlspecialchars(strip_tags($this->price));
        $this->quantity = htmlspecialchars(strip_tags($this->quantity));

        $stmt->bindParam(':name', $this->name);
        $stmt->bindParam(':description', $this->description);
        $stmt->bindParam(':price', $this->price);
        $stmt->bindParam(':quantity', $this->quantity);

        $stmt->execute();

        return $stmt;
    }

    public function update() {
        $query = 'UPDATE ' . $this->table . ' SET name = :name, description = :description, price = :price, quantity = :quantity WHERE id = :id';
        $stmt = $this->conn->prepare($query);

        $this->id = htmlspecialchars(strip_tags($this->id));
        $this->name = htmlspecialchars(strip_tags($this->name));
        $this->description = htmlspecialchars(strip_tags($this->description));
        $this->price = htmlspecialchars(strip_tags($this->price));
        $this->quantity = htmlspecialchars(strip_tags($this->quantity));

        $stmt->bindParam(':id', $this->id);
        $stmt->bindParam(':name', $this->name);
        $stmt->bindParam(':description', $this->description);
        $stmt->bindParam(':price', $this->price);
        $stmt->bindParam(':quantity', $this->quantity);

        $stmt->execute();

        return $stmt;
    }

    public function delete() {
        $query = 'DELETE FROM ' . $this->table . ' WHERE id = :id';
        $stmt = $this->conn->prepare($query);

        $this->id = htmlspecialchars(strip_tags($this->id));

        $stmt->bindParam(':id', $this->id);

        $stmt->execute();

        return $stmt;
    }

    public function checkName() {
        $query = 'SELECT * FROM ' . $this->table . ' WHERE name = :name';
        $stmt = $this->conn->prepare($query);

        $this->name = htmlspecialchars(strip_tags($this->name));

        $stmt->bindParam(':name', $this->name);

        $stmt->execute();

        return $stmt;
    }

    public function getProduct() {
        $query = 'SELECT * FROM ' . $this->table . ' WHERE id = :id';
        $stmt = $this->conn->prepare($query);

        $this->id = htmlspecialchars(strip_tags($this->id));

        $stmt->bindParam(':id', $this->id);

        $stmt->execute();

        return $stmt;
    }

    public function updateQuantity() {
        $query = 'UPDATE ' . $this->table . ' SET quantity = :quantity WHERE id = :id';
        $stmt = $this->conn->prepare($query);

        $this->id = htmlspecialchars(strip_tags($this->id));
        $this->quantity = htmlspecialchars(strip_tags($this->quantity));

        $stmt->bindParam(':id', $this->id);
        $stmt->bindParam(':quantity', $this->quantity);

        $stmt->execute();

        return $stmt;
    }

    public function checkQuantity() {
        $query = 'SELECT * FROM ' . $this->table . ' WHERE id = :id AND quantity >= :quantity';
        $stmt = $this->conn->prepare($query);

        $this->id = htmlspecialchars(strip_tags($this->id));
        $this->quantity = htmlspecialchars(strip_tags($this->quantity));

        $stmt->bindParam(':id', $this->id);
        $stmt->bindParam(':quantity', $this->quantity);

        $stmt->execute();

        return $stmt;
    }

    public function getQuantity() {
        $query = 'SELECT quantity FROM ' . $this->table . ' WHERE id = :id';
        $stmt = $this->conn->prepare($query);

        $this->id = htmlspecialchars(strip_tags($this->id));

        $stmt->bindParam(':id', $this->id);

        $stmt->execute();

        return $stmt;
    }

    public function updateQuantityMinus() {
        $query = 'UPDATE ' . $this->table . ' SET quantity = quantity - :quantity WHERE id = :id';
        $stmt = $this->conn->prepare($query);

        $this->id = htmlspecialchars(strip_tags($this->id));
        $this->quantity = htmlspecialchars(strip_tags($this->quantity));

        $stmt->bindParam(':id', $this->id);
        $stmt->bindParam(':quantity', $this->quantity);

        $stmt->execute();

        return $stmt;
    }

    public function updateQuantityPlus() {
        $query = 'UPDATE ' . $this->table . ' SET quantity = quantity + :quantity WHERE id = :id';
        $stmt = $this->conn->prepare($query);

        $this->id = htmlspecialchars(strip_tags($this->id));
        $this->quantity = htmlspecialchars(strip_tags($this->quantity));

        $stmt->bindParam(':id', $this->id);
        $stmt->bindParam(':quantity', $this->quantity);

        $stmt->execute();

        return $stmt;
    }

    public function getQuantityMinus() {
        $query = 'SELECT quantity - :quantity FROM ' . $this->table . ' WHERE id = :id';
        $stmt = $this->conn->prepare($query);

        $this->id = htmlspecialchars(strip_tags($this->id));
        $this->quantity = htmlspecialchars(strip_tags($this->quantity));

        $stmt->bindParam(':id', $this->id);
        $stmt->bindParam(':quantity', $this->quantity);

        $stmt->execute();

        return $stmt;
    }

    public function getQuantityPlus() {
        $query = 'SELECT quantity + :quantity FROM ' . $this->table . ' WHERE id = :id';
        $stmt = $this->conn->prepare($query);

        $this->id = htmlspecialchars(strip_tags($this->id));
        $this->quantity = htmlspecialchars(strip_tags($this->quantity));

        $stmt->bindParam(':id', $this->id);
        $stmt->bindParam(':quantity', $this->quantity);

        $stmt->execute();

        return $stmt;
    }

    public function getQuantityMinusCheck() {
        $query = 'SELECT quantity - :quantity FROM ' . $this->table . ' WHERE id = :id AND quantity - :quantity >= 0';
        $stmt = $this->conn->prepare($query);

        $this->id = htmlspecialchars(strip_tags($this->id));
        $this->quantity = htmlspecialchars(strip_tags($this->quantity));

        $stmt->bindParam(':id', $this->id);
        $stmt->bindParam(':quantity', $this->quantity);

        $stmt->execute();

        return $stmt;
    }

    public function getQuantityPlusCheck() {
        $query = 'SELECT quantity + :quantity FROM ' . $this->table . ' WHERE id = :id';
        $stmt = $this->conn->prepare($query);

        $this->id = htmlspecialchars(strip_tags($this->id));
        $this->quantity = htmlspecialchars(strip_tags($this->quantity));

        $stmt->bindParam(':id', $this->id);
        $stmt->bindParam(':quantity', $this->quantity);

        $stmt->execute();

        return $stmt;
    }


}