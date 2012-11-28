package pl.avd.deather.adviser.logic.question;

public enum QuestionBundle {

  NETWORK(new Question("Jaka preferujesz siec?",
      "NETWORK",
      new String[]{
          "orange", "plus", "tmobile"
      },
      new String[]{
          "Orange", "Plus", "T-Mobile"
      })),

  MAXCOST(new Question("Maksymalny wydatek na miesiąc?",
      "MAXCOST",
      new Object[]{
          30, 60, 90
      },
      new String[]{
          "30 PLN", "60 PLN", "90 PLN"
      })),

  CALLPACKETS(new Question("Czy jestes zainteresowany pakietami na tansze rozmowy?",
      "CALLPACKETS",
      new Object[]{
          true, false
      },
      new String[]{
          "Tak, jestem zainteresowany.",
          "Nie, nie jestem zainteresowany."
      }
  ));

  private Question question;

  private QuestionBundle(Question question) {
    this.question = question;
  }

  public Question getQuestion() {
    return question;
  }
}
