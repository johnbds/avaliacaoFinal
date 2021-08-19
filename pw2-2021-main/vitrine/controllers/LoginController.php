<?php
require_once "Conexao.php";
require_once "../models/Cliente.php";


class LoginController{

    private static $instance;
    private $conexao;

    public static function getInstance(){
        if (self::$instance == null){
            self::$instance = new LoginController();
        }
        return self::$instance;
    }

    private function __construct(){
        $this->conexao = Conexao::getInstance();
    }

    public function login($email, $senha){
        $usuario = $this->existeCliente($email, $senha);
        if ($usuario->getNome() != ""){
            $_SESSION['vitrine-customer'] = serialize($usuario);
            return true;
        }
        return false;
    }

    private function existeCliente($email, $senha){
        $cliente = new Cliente();
        $sql = "SELECT id, nome, email, telefone FROM cliente WHERE email = :email AND senha =:senha";
        $statement = $this->conexao->prepare($sql);
        $statement->bindValue(":email", $email);
        $statement->bindValue(":senha", $senha);
        $statement->execute();
        $retornoBanco = $statement->fetchAll(PDO::FETCH_ASSOC);

        foreach ($retornoBanco as $row){
            $cliente = $this->preencherCliente($row);
        }
        return $cliente;
    }

    private function preencherCliente($row){
        $cliente = new Cliente();
        $cliente->setId($row['id']);
        $cliente->setNome($row['nome']);
        $cliente->setEmail($row['email']);
        $cliente->setTelefone($row['telefone']);
        return $cliente;
    }
}