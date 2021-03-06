# language: fr
Fonctionnalité: Opérations d’un visiteur



	Contexte:
		Étant donné que un bloc existe avec la date "1 janvier 1970" et le titre "Réunion publique" et le type de média "img+snd"



	Scénario: Un Visiteur cherche des blocs publiés à une date donnée, et au moins un bloc remplit ce critère
	Étant donné que je suis visiteur
		Et que un bloc existe avec la valeur "1 janvier 1970" pour le champ "date"
		Et un bloc existe avec la valeur "Réunion publique" pour le champ "titre"
		Et un bloc existe avec la valeur "img+snd" pour le champ "type de media"
	Quand je filtre les bloc par "date" avec la valeur "1 janvier 1970"
		Et un bloc existe
	Alors un sous-ensemble des blocs est retourné

	Scénario: Un Visiteur cherche des blocs avec un titre donné, et au moins un bloc remplit ce critère
	Étant donné que je suis visiteur
	Quand je filtre les bloc par "titre" avec la valeur "Réunion publique"
		Et un bloc existe
	Alors un sous-ensemble des blocs est retourné

	Scénario: Un Visiteur cherche des blocs contenant un type de média donné, et aucun bloc ne remplit ce critère
	Étant donné que je suis visiteur
	Quand je filtre les bloc par "type de media" avec la valeur "vid"
		Et aucun bloc existe
	Alors aucun bloc n'est retourné

	Scénario: Un Visiteur cherche des blocs contenant un type de média donné, et au moins un bloc remplit ce critère
	Étant donné que je suis visiteur
	Quand je filtre les bloc par "type de media" avec la valeur "img+snd"
		Et un bloc existe
	Alors un sous-ensemble des blocs est retourné

	Scénario: Un Visiteur demande à se connecter avec des identifiants valides
	Étant donné que je suis visiteur
	Quand je me connecte avec comme pseudo "toto" et comme mot de passe "coucou"
		Et mon couple pseudo/mot de passe est valide
	Alors je suis connecté en tant que "id"

Scénario: Un Visiteur demande à se connecter avec des identifiants invalides
	Étant donné que je suis visiteur
	Quand je me connecte avec comme pseudo "toto" et comme mot de passe "toto"
		Et mon couple pseudo/mot de passe est valide
	Alors je suis connecté en tant que "id"

	Scénario: Un Visiteur demande à se connecter avec des identifiants invalides, et a fait moins de x essais "x"
	Étant donné que je suis visiteur
	Quand je me connecte avec identifiants invalides pseudo "toto"  mot de passe "coucou"
		Et mon couple pseudo/mot de passe est invalide
		Et j’ai fait moins de x essais "3"
	Alors mon nombre d’essais est augmenté de un
		Et je ne suis pas connecté

	Scénario: Un Visiteur demande à se connecter avec des identifiants invalides, et a déjà fait x essais "x"
	Étant donné que je suis visiteur
	Quand je me connecte avec comme pseudo "toto" et comme mot de passe "coucou"
		Et mon couple pseudo/mot de passe est valide
		Et j’ai fait au moins x essais "3"
	Alors le compte associé au pseudo est bloqué "id"

	Scénario: Un Visiteur demande à se connecter avec des identifiants valides
	Étant donné que je suis visiteur
	Quand je me connecte avec comme email "coucou@gmail.com" et comme mot de passe "coucou"
		Et mon couple e-mail/mot de passe est valide
	Alors je suis connecté en tant que "id"

	Scénario: Un Visiteur demande à se connecter avec des identifiants invalides, et a fait moins de x essais "x"
	Étant donné que je suis visiteur
	Quand je me connecte avec comme email "coucou@gmail.com" et comme mot de passe "coucou"
		Et mon couple e-mail/mot de passe est invalide
		Et j’ai fait moins de x essais "3"
	Alors mon nombre d’essais est augmenté de un

	Scénario: Un Visiteur demande à se connecter avec des identifiants invalides, et a déjà fait 3 essais
	Étant donné que je suis visiteur
	Quand je me connecte avec comme email "coucou@gmail.com" et comme mot de passe "coucou"
		Et mon couple e-mail/mot de passe est invalide
		Et j’ai fait au moins 3 essais
	Alors le compte associé au e-mail est bloqué "id"

	Scénario: Un Visiteur demande la génération d’un nouveau mot de passe, et fournit un pseudo valide
	Étant donné que je suis visiteur
	Quand je demande la génération d’un nouveau mot de passe pour l’utilisateur avec le pseudo "pseudo"
		Et mon pseudo est correct
	Alors un e-mail est envoyé à "e-mail"

	Scénario: Un Visiteur demande la génération d’un nouveau mot de passe, et fournit un pseudo valide
	Étant donné que je suis visiteur
	Quand je demande la génération d’un nouveau mot de passe pour l’utilisateur avec le pseudo "pseudo"
		Et mon pseudo est incorrect
	Alors je ne reçois pas d'e-mail

	Scénario: Un Visiteur demande la génération d’un nouveau mot de passe, et fournit un e-mail valide
	Étant donné que je suis visiteur
	Quand je demande la génération d’un nouveau mot de passe pour l’utilisateur avec l’e-mail "e-mail"
		Et mon e-mail est correct
	Alors un e-mail est envoyé à "e-mail"

	Scénario: Un Visiteur demande la génération d’un nouveau mot de passe, et fournit un e-mail valide
	Étant donné que je suis visiteur
	Quand je demande la génération d’un nouveau mot de passe pour l’utilisateur avec l’e-mail "e-mail"
		Et mon e-mail est incorrect
	Alors je ne reçois pas d'e-mail
