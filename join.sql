USE restauranteVDD;

# INNER JOIN
SELECT u.id_usuario, u.nome, u.cpf, u.email
FROM usuario u
INNER JOIN reserva r ON u.id_usuario = r.id_usuario
WHERE r.data_reserva BETWEEN '2023-08-11' AND '2023-08-16';
# Selecionou os usuários que fizeram reserva entre os dias 11/08/2023 e 16/08/2023

# LEFT JOIN
SELECT f.nome, f.cargo, fi.nome_filial
FROM funcionario f
LEFT JOIN filial fi ON f.id_filial = fi.id_filial;


# RIGHT JOIN
SELECT p.nome_prato, p.preco, e.quantidade
FROM prato p
RIGHT JOIN estoque e ON p.id_prato = e.id_prato;


# CROSS JOIN
SELECT f.nome_fornecedor, p.nome_prato
FROM fornecedor f
CROSS JOIN prato p;
