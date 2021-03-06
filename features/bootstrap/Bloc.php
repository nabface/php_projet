<?php

class Bloc{
	private $id;
	private $date;
	private $titre;
	private $format;
	private $media;

	public function __construct($date, $titre, $format){
		$this->date = $date;
		$this->titre = $titre;
		$this->format = $format;
  }

	public function getId(){
		return $this->id;
	}

	public function getDate(){
		return $this->date;
	}

	public function getTitre(){
		return $this->titre;
	}
	// format = taille ! à modifier sur les testes
	public function getFormat(){
		return $this->format;
	}

	public function getMedia(){
		return $this->media;
	}

	public function setTitre($titre) {

		$titre_valide = true;
		// vérification que le titre …
		if (
			// … n’est pas vide
			!isset($titre) ||
			// … ne fait pas plus de 250 caractères
			strlen($titre) > 250
		){
			$titre_valide = false;
		}
		if ($titre_valide) {
			// assigne le titre au nouvel utilisateur s’il est valide …
			$this->titre = $titre;
		} else {
			// … ou affiche un message d’erreur si le titre est invalide
			echo "titre invalide";
		}
	}

	public function setMedia($media) {
		$media_valide = true;
		// vérification que le media …
		if (
			// … n’est pas vide
			!isset($media) ||
			// … ne fait pas plus de 250 caractères
			strlen($media) > 250
		){
			$mediae_valide = false;
		}
		if ($media_valide) {
			// assigne le media au nouvel utilisateur s’il est valide …
			$this->media = $media;
		} else {
			// … ou affiche un message d’erreur si le media est invalide
			echo "media invalide";
		}
	}

	public function setFormat($format) {

		$format_valide = false;

		$format_autorisee = array(
			array('jpg','png','gif'),
			array('mov','mpeg','mpeg2','flv','mp4','avi','wmv','mkv','mp3')
		);
		$format_uploaded;
		$format = strtolower(substr(strrchr($_FILES[''], '.'), 1) );

		if (in_array($format_uploaded, $format_autorisee[0]))
			// && filesize($format_uploaded) <= 20000
		{
			$format_valide = true;
		}

		if (in_array($format_uploaded, $format_autorisee[1]))
		//&& filesize($format_uploaded) <= 50000)
		{
			$format_valide = true;
		}


	}

	public static function filtre($champ, $valeur) {
		//Id Date Titre Format Media
		if (isset($valeur)){
				$blocs_list = "SELECT `date`, `titre`, `media` FROM `blocs`";
				// var_dump($bloc['media']);

				foreach ($this->$blocs_list as $bloc) {
						if ($bloc['date'] == $valeur){
								return $bloc;
						}
				}
				foreach ($this->$blocs_list as $bloc) {
						if ($bloc['titre'] == $valeur){
								return $bloc;
						}
				}
				foreach ($this->$blocs_list as $bloc) {
						if ($bloc['media'] == $valeur){
								return $bloc;
						}
				}
		}
	}
}

?>