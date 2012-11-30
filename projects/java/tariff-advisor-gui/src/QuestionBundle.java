public enum QuestionBundle {

  NETWORK(new Question("Jaka preferujesz siec?",
      "NETWORK",
      new String[]{
          "Orange", "Plus", "Tmobile", "Play", "Heyah"
      },
      new String[]{
          "Orange", "Plus", "T-Mobile", "Play", "Heyah"
      })),

  MAXCOST(new Question("Maksymalny wydatek na miesiąc?",
      "MAXCOST",
      new Object[]{
          30, 60, 90, 150
      },
      new String[]{
          "30 PLN", "60 PLN", "90 PLN", "150 PLN"
      })),

  /* Pytania dotyczące pakietów rozmów. */

  CALLPACKETS(new Question("Czy jestes zainteresowany pakietami na tańsze rozmowy?",
      "CALLPACKETS",
      new Object[]{
          true, false
      },
      new String[]{
          "Tak, jestem zainteresowany.",
          "Nie, nie jestem zainteresowany."
      }
  )),

  CALLNETWORK(new Question("Do jakiej sieci najczęściej dzwonisz?",
      "CALLNETWORK",
      new Object[]{
          "self", "various_not_play", "various_inc_play", "mostly_play"
      },
      new String[]{
          "Dzwonię najczęściej do swojej sieci.",
          "Dzwonię do różnych sieci, ale raczej nie do Play.",
          "Dzwonię do różnych sieci, również do Play.",
          "Dzwonię głównie do Play.",
      })),

  CALLFAVOURITE(new Question("Do jakiej sieci najczęściej dzwonisz?",
      "CALLFAVOURITE",
      new String[]{
          "one", "several", "none",
      },
      new String[]{
          "Rozmawiam głównie z jedną wybraną osobą.",
          "Rozmawiam głównie z kilkoma osobami.",
          "Nie mam wybranych osób, z którymi rozmawiam najczęściej.",
      })),

  /* Pytania dotyczące pakietów sms */

  SMSPACKETS(new Question("Czy jesteś zainteresowany pakietami na tańsze SMS?",
      "SMSPACKETS",
      new Object[]{
          true, false
      },
      new String[]{
          "Tak, jestem zainteresowany.",
          "Nie, nie jestem zainteresowany."
      })),
  SMSFAVOURITE(new Question("Do jakiej sieci najczęściej wysyłasz SMS?",
      "SMSFAVOURITE",
      new Object[]{
          "self", "various",
      },
      new String[]{
          "Wysyłam sms najczęściej w swojej sieci.",
          "Wysyłam sms do różnych sieci.",
      })),

  /* pytania dotyczące pakietów internetowych */

  NETPACKETS(new Question("Czy jesteś zainteresowany pakietami internetowymi?",
      "NETPACKETS",
      new Object[]{
          true, false
      },
      new String[]{
          "Tak, jestem zainteresowany.",
          "Nie, nie jestem zainteresowany."
      })),
  NETUSAGE(new Question("Ile transferu miesięcznie zużywasz?",
      "NETUSAGE",
      new Object[]{
          0.1, 0.5, 1, 10
      },
      new String[]{
          "Do 100 MB",
          "OD 100 MB do 500 MB",
          "OD 500 MB do 1 GB",
          "1-10 GB",
      })),

  /* pytania ogolne */

  CALLCOUNT(new Question("Ile razy dzwonisz dziennie?",
      "CALLCOUNT",
      new Object[]{
          2, 6, 15, 25, 50
      },
      new String[]{
          "Bardzo mało (0-2)",
          "Kilka razy (3-9)",
          "Kilkanaście razy (10-20)",
          "Dość często (około 25 razy)",
          "Całymi dniami wykonuję telefony"
      })),
  CALLLENGTH(new Question("Jak długo średnio trwają Twoje rozmowy?",
      "CALLLENGTH",
      new Object[]{
          1, 4, 15, 30, 3
      },
      new String[]{
          "Bardzo krótko (do minuty)",
          "Kilka minut (do 5)",
          "Kilkanaście minuty",
          "Do pół godziny",
          "Rozmawiam godzinami"
      })),
  SMSCOUNT(new Question("Ile średnio wysyłasz SMS dziennie?",
      "SMSCOUNT",
      new Object[]{
          1, 5, 15, 50, 100
      },
      new String[]{
          "Prawie wcale",
          "Kilka (około 5)",
          "Kilkanaście",
          "Kilkadziesiąt",
          "Około stu",
      })),
  MMSCOUNT(new Question("Ile średnio wysyłasz MMS dziennie?",
      "MdMSCOUNT",
      new Object[]{
          1, 5, 15, 50, 100
      },
      new String[]{
          "Prawie wcale",
          "Kilka (około 5)",
          "Kilkanaście",
          "Kilkadziesiąt",
          "Około stu",
      })),
  ;
  private Question question;

  private QuestionBundle(Question question) {
    this.question = question;
  }

  public Question getQuestion() {
    return question;
  }
}
