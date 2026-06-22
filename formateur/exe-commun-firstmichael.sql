# Affichez tous les champs de la table `article`
SELECT * FROM `article`;

# Affichez tous les champs de la table `article` ordonné par `date` descendante
SELECT * FROM `article` ORDER BY `date` DESC;

# Affichez tous les champs de la table `article` ordonné par `date` descendante quand `user_id` vaut 1
SELECT * 
	FROM `article`
    WHERE `user_id` = 1
    ORDER BY `date` DESC;
    
# Affichez tous les champs de la table `category`
SELECT * FROM `category`;

# Affichez tous les champs de la table `user`
SELECT * FROM `user`;

# Affichez tous les champs de la table `user` dont le champ `actif` vaut 1
SELECT * 
	FROM `user`
    WHERE `actif` = 1
    ;

# Affichez le champ `username` et le champ `realname` de la table `user` dont le champ `actif` vaut 1  
SELECT `username`, `realname`
	FROM `user`
    WHERE `actif` = 1
    ;  
    
# Affichez les champs `id`, `username`, `realname` de la table `user` ordonné par `username` ascendant 
SELECT `id`, `username`, `realname`
	FROM `user`
    ORDER BY `username` ASC
    ;     
    
# Affichez les champs `id`, `title`  de la table `article`
SELECT `id`, `title`
	FROM `article`;
    
# Affichez les champs `id`, `title`  de la table `article`, ainsi que le `username` venant de la table `user` (jointure interne donc obligatoire)
SELECT 
	`article`.`id`, `article`.`title`,
    `user`.`username`
	FROM `article`
    INNER JOIN `user`
		ON `user`.`id` = `article`.`user_id`
;

# Affichez les champs `id`, `title`, `date`  de la table `article`, ainsi que l' `id` et le `username` venant de la table `user` (jointure interne donc obligatoire) ! id est dupliqué !
SELECT 
	`article`.`id`, `article`.`title`,`article`.`date`,
    `user`.`id`, `user`.`username`
	FROM `article`
    INNER JOIN `user`
		ON `user`.`id` = `article`.`user_id`
;

# Affichez les champs `id`, `title`, `date`  de la table `article`, ainsi que l' `id` renommé `iduser` (alias de sortie) et le `username` venant de la table `user` (jointure interne donc obligatoire)
SELECT 
	`article`.`id`, `article`.`title`,`article`.`date`,
    `user`.`id` AS `iduser`, `user`.`username`
	FROM `article`
    INNER JOIN `user`
		ON `user`.`id` = `article`.`user_id`
;

# Affichez les champs `id`, `title`, `date`  de la table `article`, ainsi que l' `id` renommé `iduser` (alias de sortie) et le `username` venant de la table `user` (jointure interne donc obligatoire) - utilisation d'alias de table
SELECT 
	a.`id`, a.`title`,a.`date`,
    u.`id` AS `iduser`, u.`username`
	FROM `article` a
    INNER JOIN `user` u
		ON u.`id` = a.`user_id`
;   

# Affichez les champs `id`, `title`, `date` et `contenu`  de la table `article`, ainsi que l' `id` renommé `iduser` (alias de sortie) et le `username` venant de la table `user` lorsque l' id de l'article vaut 2
SELECT 
	a.`id`, a.`title`,a.`date`, a.`content`,
    u.`id` AS `iduser`, u.`username`
	FROM `article` a
    INNER JOIN `user` u
		ON u.`id` = a.`user_id`
	WHERE a.`id` = 2
;    

# Affichez les champs `id`, `title`, `date` et `contenu`  de la table `article`, ainsi que l' `id` renommé `iduser` (alias de sortie) et le `username` venant de la table `user`, ET prendre l'`id` et le `title` de la table `category` SI ils existent pour l'article (Jointure où l'article est toujours affiché -> jointure externe de type LEFT)  -- lorsque l' id de l'article vaut 1
SELECT 
	a.`id`, a.`title`,a.`date`, a.`content`,
    u.`id` AS `iduser`, u.`username`,
    c.`id`, c.`title`
	FROM `article` a
    INNER JOIN `user` u
		ON u.`id` = a.`user_id`
    LEFT JOIN `category_has_article` h
		ON a.`id` = h.`article_id`
    LEFT JOIN  `category` c 
		ON c.`id` = h.`category_id`
	-- WHERE a.`id` = 1
; 


# Affichez les champs `id`, `title`, `date` et `contenu`  de la table `article`, ainsi que l' `id` renommé `iduser` (alias de sortie) et le `username` venant de la table `user`, ET prendre l'`id` et le `title` de la table `category` SI ils existent pour l'article   -- lorsque l' id de l'article vaut 1
SELECT 
	a.`id`, a.`title`,a.`date`, a.`content`,
    u.`id` AS `iduser`, u.`username`,
    c.`id`, c.`title`
	FROM `article` a
    INNER JOIN `user` u
		ON u.`id` = a.`user_id`
    LEFT JOIN `category_has_article` h
		ON a.`id` = h.`article_id`
    LEFT JOIN  `category` c 
		ON c.`id` = h.`category_id`
	-- WHERE a.`id` = 1
    GROUP BY a.`id` -- permet de n'avoir qu'un article mais on a une perte d'information
; 