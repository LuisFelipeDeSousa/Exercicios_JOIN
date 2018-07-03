SELECT * FROM habilidades;
SELECT * FROM herois;

SELECT 
	herois.nome 'Personagem',
	habilidades 'Habilidade'
FROM habilidades
JOIN herois ON (habilidades.id_heroi = herois.id);

--OBJETIVO DO 'JOIN' > Trazer informação de outra tabela.

-- JOIN PARA PEGAR POKEMONS DE CATEGORIA
SELECT 
name 'Nome', categories.name 'Categoria' 
FROM pokemons
JOIN categorias ON (categories.id = pokemons.id_categoryI)
WHERE name = 'Bulbasaur'

-- JOIN PARA PEGAR CATEGORIA

SELECT categories.name 'Categoria', pokemons.name 'Pokemon'
FROM categories
JOIN pokemons ON(categories.id = pokemons.categoryI)
ORDER BY categories.name, pokemons.name; -- ORDENAR CATEGORIAS

-- JOIN PARA PEGAR QUANTIDADE DE POKEMONS 'BUG'

SELECT COUNT (pokemons.id) 'Quantidade de Pokemons BUG'
FROM categories
JOIN pokemons ON(pokemons.id_categoryI = categories.id)
WHERE categories.name = 'Bug';

-- GROUP BY --> SERVE PARA ARMAZENAR A QUANTIDADE DE MASSA DE ESTATISTICA 

SELECT tipo, SUM (valor)
FROM -- DA TABELA X
/*GROUP BY*/ tipo 

SELECT COUNT (pokemons.id) 'Quantidade de Pokemons BUG'
FROM categories
JOIN pokemons ON(pokemons.id_categoryI = categories.id)
WHERE categories.name = 'Bug';

SELECT categories.name, COUNT (pokemons.id) 'Quantidade de Pokemons'
FROM categories
JOIN pokemons ON(pokemons.id_categorYI = categories.id)
GROUP BY  categories.name
ORDER BY COUNT (pokemons.id)DESC;

-- GROUP BY -- Serve para pegar informações e agrupar informações



