# language: fr
Fonctionnalité: Opérations d’un visiteur

	Contexte:
		Étant donné que un bloc existe avec comme date "1er janvier 1970"
		Et un bloc existe avec comme titre "Réunion publique"
		Et un bloc existe avec comme type de media "img+snd"

	Scénario: Un Visiteur cherche des blocs publiés à une date donnée, et aucun bloc ne remplit ce critère
	Étant donné que je suis visiteur
	Quand je filtre les bloc par "date" avec la valeur "22 décembre 1972"
		Et aucun bloc existe
	Alors un message d’erreur est affiché "texte du message"

	Scénario: Un Visiteur cherche des blocs publiés à une date donnée, et au moins un bloc remplit ce critère
	Étant donné que je suis visiteur
	Quand je filtre les bloc par "date" avec la valeur "1er janvier 1970"
		Et un bloc existe 
	Alors un sous-ensemble des blocs est retourné

	Scénario: Un Visiteur cherche des blocs avec un titre donné, et aucun bloc ne remplit ce critère
	Étant donné que je suis visiteur
	Quand je filtre les bloc par "titre" avec la valeur "Conseil d’Administration"
		Et aucun bloc existe
	Alors un message d’erreur est affiché "texte du message"

	Scénario: Un Visiteur cherche des blocs avec un titre donné, et au moins un bloc remplit ce critère
	Étant donné que je suis visiteur
	Quand je filtre les bloc par "titre" avec la valeur "Réunion publique"
		Et un bloc existe
	Alors un sous-ensemble des blocs est retourné

	Scénario: Un Visiteur cherche des blocs contenant un type de média donné, et aucun bloc ne remplit ce critère
	Étant donné que je suis visiteur
	Quand je filtre les bloc par "type de media" avec la valeur "vid"
		Et aucun bloc existe
	Alors un message d’erreur est affiché "texte du message"

	Scénario: Un Visiteur cherche des blocs contenant un type de média donné, et au moins un bloc remplit ce critère
	Étant donné que je suis visiteur
	Quand je filtre les bloc par "type de media" avec la valeur "img+snd"
		Et un bloc existe
	Alors un sous-ensemble des blocs est retourné

	Scénario: Un Visiteur demande à se connecter avec des identifiants valides
	Étant donné que je suis visiteur
	Quand je me connecte
		Et mon couple pseudo/mot de passe est valide
	Alors je suis connecté

	Scénario: Un Visiteur demande à se connecter avec des identifiants invalides, et a fait moins de 3 essais
	Étant donné que je suis visiteur
	Quand je me connecte
		Et mon couple pseudo/mot de passe est invalide
		Et j’ai fait moins de 3 essais
	Alors un message d’erreur est affiché "texte du message"
		Et un nouveau couple pseudo/mot de passe est demandé

	Scénario: Un Visiteur demande à se connecter avec des identifiants invalides, et a déjà fait 3 essais
	Étant donné que je suis visiteur
	Quand je me connecte
		Et mon couple pseudo/mot de passe est invalide
		Et j’ai fait au moins 3 essais
	Alors un message d’erreur est affiché "texte du message"
		Et le compte associé au pseudo est bloqué
