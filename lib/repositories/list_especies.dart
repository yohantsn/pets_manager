class Especies{

  static List<String> getEspecies(){
    List<String> listResult = List<String>();

    listResult.add("Selecione a especie do pet");
    listResult.add("Cão");
    listResult.add("Gato");
    listResult.add("Roedor");
    listResult.add("Passaro");
    listResult.add("Peixe");
    listResult.add("Réptil");
    listResult.add("Outros");

    return listResult;
  }
}