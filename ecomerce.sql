create database ecomerce;

create table categorias(id serial primary key, id_categoria varchar(50) not null unique, 
nome varchar not null unique);

insert into categorias (id_categoria , nome) values ('id_categoria_frutas', 'frutas'),
('id_categoria_verduras', 'verduras'),
('id_categoria_massas', 'massas'),
('id_categoria_bebidas', 'bebidas'),
('id_categoria_utilidades', 'utilidades');

create table clientes(id serial primary key, cpf varchar(14) not null unique, 
nome varchar(100) not null);

insert into clientes (cpf, nome) values ('803.713.500-42', 'José Augusto Silva'),
('676.428.690-61', 'Antonio Oliveira'),
('631.933.100-34', 'Ana Rodrigues'),
('756.705.050-18', 'Maria da Conceição');

create table vendedores(id serial primary key, cpf varchar(14) not null unique, 
nome varchar(100) not null);

insert into vendedores (cpf, nome) values ('825.398.410-31', 'Rodrigo Sampaio'),
('232.625.460-03', 'Beatriz Souza Santos'),
('280.071.550-23', 'Carlos Eduardo');

SELECT v.nome, ca.nome, cl.nome FROM categorias ca, clientes cl, vendedores v;  

create table produtos(
id serial primary key,
nome varchar(100) not null unique, 
descricao text not null, 
preco int not null, 
quantidade_em_estoque int not null,
categoria_id int not NULL,
CONSTRAINT fk_categoria_produto
FOREIGN KEY(categoria_id)
references categorias(id));

insert into produtos (nome, descricao, preco, quantidade_em_estoque, categoria_id) values 
('Mamão', 'Rico em vitamina A, potássio e vitamina C', 300, 123, 1),
('Maça', 'Fonte de potássio e fibras.', 90, 34, 1),
('Cebola', 'Rico em quercetina, antocianinas, vitaminas do complexo B, C.', 50, 76, 2),
('Abacate', 'NÃO CONTÉM GLÚTEN.', 150, 64, 1),
('Tomate', 'Rico em vitaminas A, B e C.', 125, 88, 2),
('Acelga', 'NÃO CONTÉM GLÚTEN.', 235, 13, 2),
('Macarrão parafuso', 'Sêmola de trigo enriquecida com ferro e ácido fólico, ovos e corantes naturais', 690, 5, 3),
('Massa para lasanha', 'Uma reunião de família precisa ter comida boa e muita alegria.', 875, 19, 3),
('Refrigerante coca cola lata', 'Sabor original', 350, 189, 4),
('Refrigerante Pepsi 2l', 'NÃO CONTÉM GLÚTEN. NÃO ALCOÓLICO.', 700, 12, 4),
('Cerveja Heineken 600ml', 'Heineken é uma cerveja lager Puro Malte, refrescante e de cor amarelo-dourado', 1200, 500, 4),
('Agua mineral sem gás', 'Smartwater é água adicionado de sais mineirais (cálcio, potássio e magnésio) livre de sódio e com pH neutro.', 130, 478, 4),
('Vassoura', 'Pigmento, matéria sintética e metal.', 2350, 30, 5),
('Saco para lixo', 'Reforçado para garantir mais segurança', 1340, 90, 5),
('Escova dental', 'Faça uma limpeza profunda com a tecnologia inovadora', 1000, 44, 5),
('Balde para lixo 50l', 'Possui tampa e fabricado com material reciclado', 2290, 55, 5),
('Manga', 'Rico em Vitamina A, potássio e vitamina C', 198, 176, 1),
('Uva', 'NÃO CONTÉM GLÚTEN.', 420, 90, 1);

create table vendas (
 id serial not null primary key,
 cliente_id int, 
 CONSTRAINT fk_vendas_clientes
 FOREIGN KEY(cliente_id)
 references clientes(id),
 vendedor_id int,
 CONSTRAINT fk_vendas_vendedores
 FOREIGN KEY(vendedor_id)
 references vendedores(id)
 );

create table itens_da_vendas (
  id serial not null primary key,
  venda_id int, 
  CONSTRAINT fk_itens_vendas_vendas
 FOREIGN KEY(venda_id)
 references vendas(id),
  quantidade int not null,
  produto_id int, 
  CONSTRAINT fk_itens_vendas_produtos
 FOREIGN KEY(produto_id)
 references produtos(id)
);

insert into vendas (cliente_id, vendedor_id) values (1,3);
insert into itens_da_vendas(venda_id, quantidade, produto_id) values(1,1,1);
insert into itens_da_vendas(venda_id, quantidade, produto_id) values(1,1,10);
insert into itens_da_vendas(venda_id, quantidade, produto_id) values(1,6,11);
insert into itens_da_vendas(venda_id, quantidade, produto_id) values(1,1,15);
insert into itens_da_vendas(venda_id, quantidade, produto_id) values(1,5,2);

update produtos set quantidade_em_estoque = quantidade_em_estoque - 1 where id = 1 or id = 10 or id = 15;
update produtos set quantidade_em_estoque = quantidade_em_estoque - 6 where id = 11;
update produtos set quantidade_em_estoque = quantidade_em_estoque - 5 where id = 2;

insert into vendas (cliente_id, vendedor_id) values (3,2);
insert into itens_da_vendas(venda_id, quantidade, produto_id) values(2,10,17);
insert into itens_da_vendas(venda_id, quantidade, produto_id) values(2,3,18);
insert into itens_da_vendas(venda_id, quantidade, produto_id) values(2,5,1);
insert into itens_da_vendas(venda_id, quantidade, produto_id) values(2,10,5);
insert into itens_da_vendas(venda_id, quantidade, produto_id) values(2,2,6);

update produtos set quantidade_em_estoque = quantidade_em_estoque - 10 where id = 17 or id = 5;
update produtos set quantidade_em_estoque = quantidade_em_estoque - 3 where id = 18;
update produtos set quantidade_em_estoque = quantidade_em_estoque - 5 where id = 1;
update produtos set quantidade_em_estoque = quantidade_em_estoque - 2 where id = 6;

insert into vendas (cliente_id, vendedor_id) values (4,2);
insert into itens_da_vendas(venda_id, quantidade, produto_id) values(3,1,13);
insert into itens_da_vendas(venda_id, quantidade, produto_id) values(3,6,12);
insert into itens_da_vendas(venda_id, quantidade, produto_id) values(3,5,17);

update produtos set quantidade_em_estoque = quantidade_em_estoque - 1 where id = 13;
update produtos set quantidade_em_estoque = quantidade_em_estoque - 6 where id = 12;
update produtos set quantidade_em_estoque = quantidade_em_estoque - 5 where id = 17;

select p.nome, c.id_categoria from produtos p left join categorias c on c.id = p.categoria_id;
--select p.nome, c.nome from produtos p left join categorias c on c.id = p.categoria_id;

select v.id as "vendas_id",v2.nome as "vendedor", c.nome as "cliente" from vendas v left join vendedores v2 on v.id= v2.id left join clientes c on v.id= c.id;

select c.nome as "categoria", sum(p.quantidade_em_estoque) as "estoque disponivel" from categorias c left join produtos p on c.id = p.categoria_id  group by c.nome;

select p.nome, sum(idv.quantidade) as "total_de_vendas" from produtos p 
left join itens_da_vendas idv on p.id = idv.produto_id 
WHERE idv.quantidade IS null group by p.nome;

select p.nome, sum(idv.quantidade) as "total_de_vendas" from produtos p 
left join itens_da_vendas idv on p.id = idv.produto_id 
WHERE idv.quantidade IS NOT null group by p.nome;
